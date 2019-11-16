import datetime

from flask import request, jsonify, Response
from flask_restful import Api

from service import app
from service import db
from service.models import Category, SubCategory
from service.models import Item
from service.models import Photo
from service.models import UnAvailableDate, DateType

api = Api(app)


@app.route('/category', methods=['POST'])
def new_category():
    rsq = Category.query.filter(Category.name == request.json['name'])
    if len(rsq.all()) > 0:
        return Response('Entity duplicated', status=409)

    category = Category(name=request.json['name'], picture=request.json['picture'])
    db.session.add(category)
    db.session.commit()
    return jsonify(category.serialize)


@app.route('/categories')
def categories():
    qrs = Category.query
    return jsonify([i.serialize for i in qrs.all()])


@app.route('/category/<int:category_id>/subcategory', methods=['POST'])
def new_subcategory(category_id: int):
    # category = Category.query.get(category_id)
    # if category is None:
    #     return Response('Category was not found', status=401)
    rsq = SubCategory.query.filter(SubCategory.name == request.json['name']).filter(
        SubCategory.category_id == category_id)
    if len(rsq.all()) > 0:
        return Response('Entity duplicated', status=409)

    subcategory = SubCategory(name=request.json['name'], picture=request.json['picture'], category_id=category_id)
    db.session.add(subcategory)
    db.session.commit()
    return jsonify(subcategory.serialize)


@app.route('/item', methods=['POST'])
def new_item():
    item = Item(title=request.json['title'], description=request.json['description'],
                dayPrice=request.json['dayPrice'],
                weekPrice=request.json['weekPrice'], monthPrice=request.json['monthPrice'],
                category_id=request.json['category_id'], subcategory_id=request.json['subcategory_id'],
                user_id=request.json['user_id'])
    db.session.add(item)
    db.session.commit()

    for el in request.json['photos']:
        photo = Photo(picture=el, item_id=item.id)
        db.session.add(photo)
    db.session.commit()

    for el in request.json['unavailable_dates']:
        date = UnAvailableDate(item_id=item.id, date=datetime.datetime.strptime(el, '%Y-%m-%dT%H:%M:%S.%fZ'),
                               type=DateType.rent_day_off)
        db.session.add(date)
    db.session.commit()

    qr = db.session.query(Category).filter(Category.id == item.category_id)
    if len(qr.all()) == 1:
        json = item.serialize_search_index
        category = qr.one()
        json['category'] = category.name
        json['category_id'] = category.id

    return jsonify(item.serialize)


@app.route('/item/<int:item_id>')
def get_item(item_id: int):
    rsq = Item.query.filter(Item.id == item_id)

    if len(rsq.all()) is not 1:
        return Response('Item was not found', status=404)

    return jsonify(rsq.one().serialize_all)

@app.route('/items/count')
def count_items():
    res = Item.query.filter(Item.user_id == rest_user.get_id()).count()
    return jsonify(count=res)


@app.route('/item/<int:item_id>/book', methods=['POST'])
def book_item(item_id: int):
    """
    Internal call
    :param item_id:
    :return:
    """
    start_date = request.json['start_date']
    end_date = request.json['end_date']

    # Check if item is unavailable on the provided dates range
    # TODO: Optimize query
    q = db.session.query(UnAvailableDate).join(Item.unAvailableDates).filter(Item.id == item_id).filter(
        UnAvailableDate.date >= start_date).filter(UnAvailableDate.date <= end_date)

    if len(q.all()) > 0:
        return Response('Item is not available on these dates', status=409)

    # Get interval of dates to save them individually
    start = datetime.datetime.strptime(start_date, '%Y-%m-%dT%H:%M:%S.%fZ')
    end = datetime.datetime.strptime(end_date, '%Y-%m-%dT%H:%M:%S.%fZ')
    delta = end - start

    # Save dates
    for i in range(delta.days + 1):
        d = start + datetime.timedelta(days=i)
        date = UnAvailableDate(item_id=item_id, date=d, type=DateType.booked)
        db.session.add(date)
    db.session.commit()

    return jsonify(success=True)


@app.route('/item/<int:item_id>/release', methods=['POST'])
def release_item(item_id: int):
    """
    Internal call
    :param item_id:
    :return:
    """
    start_date = datetime.datetime.strptime(request.json['start_date'], '%Y-%m-%dT%H:%M:%S.%fZ')
    end_date = datetime.datetime.strptime(request.json['end_date'], '%Y-%m-%dT%H:%M:%S.%fZ')
    # end_date += datetime.timedelta(days=1)

    # Check if item is booked on the provided dates range
    # TODO: Optimize query
    q = db.session.query(UnAvailableDate).filter(UnAvailableDate.item_id == item_id).filter(
        UnAvailableDate.date >= start_date).filter(UnAvailableDate.date <= end_date)
    if len(q.all()) == 0:
        return Response('These dates were not found', status=404)

    q.delete(synchronize_session=False)
    db.session.commit()

    return jsonify(success=True)