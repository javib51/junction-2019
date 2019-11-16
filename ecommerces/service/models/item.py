from service import db


class Item(db.Model):
    """"""
    __tablename__ = "item"

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    description = db.Column(db.String(2000), nullable=False)
    dayPrice = db.Column(db.Float, nullable=False)
    weekPrice = db.Column(db.Float, nullable=False)
    monthPrice = db.Column(db.Float, nullable=False)
    photos = db.relationship('Photo', backref='item', lazy=True)
    unAvailableDates = db.relationship('UnAvailableDate', backref='item', lazy=True)
    #category = db.relationship('Category')
    category_id = db.Column(db.Integer, db.ForeignKey('category.id'), nullable=False)
    subcategory_id = db.Column(db.Integer, db.ForeignKey('subcategory.id'), nullable=False)
    user_id = db.Column(db.String(30), nullable=False)

    # ----------------------------------------------------------------------
    def __repr__(self):
        return 'Item(title="{}", description="{}",' + \
               ' dayPrice="{}", weekPrice="{}",' + \
               ' monthPrice="{}", userId="{}")'.format(self.title, self.description, self.dayPrice, self.weekPrice,
                                                       self.monthPrice, self.user_id)

    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'dayPrice': self.dayPrice,
            'weekPrice': self.weekPrice,
            'monthPrice': self.monthPrice,
            'category_id': self.category_id,
            'subcategory_id': self.subcategory_id,
            'photos': [i.serialize for i in self.photos],
            'user_id': self.user_id
        }

    @property
    def serialize_all(self):
        """Return object data in easily serializable format"""
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'dayPrice': self.dayPrice,
            'weekPrice': self.weekPrice,
            'monthPrice': self.monthPrice,
            'category_id': self.category_id,
            'subcategory_id': self.subcategory_id,
            'photos': [i.serialize for i in self.photos],
            'unavailable_dates': [i.serialize for i in self.unAvailableDates],
            'user_id': self.user_id
        }

    @property
    def serialize_search_index(self):
        """Return object data in easily serializable format"""
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'dayPrice': self.dayPrice,
            'weekPrice': self.weekPrice,
            'monthPrice': self.monthPrice,
            'photos': [i.serialize for i in self.photos],
            'user_id': self.user_id
        }