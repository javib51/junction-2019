from service import db


class OrderItem(db.Model):
    """"""
    __tablename__ = "order_items"

    order = db.relationship('Order', backref='order_items', lazy=True)
    order_item_id = db.Column(db.Integer(), primary_key=True)
    price = db.Column(db.Float())
    product = db.relationship('Product', backref='order_items', lazy=True)
    seller_id = db.Column(db.Text())
    shipping_limit_date = db.Column(db.Text())
    freight_value = db.Column(db.Float())

    # ----------------------------------------------------------------------

    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return {
            'order_item_id': self.order_item_id,
            'price': self.price,  
            'seller_id': self.seller_id,
            'shipping_limit_date': self.shipping_limit_date,
            'freight_value': self.freight_value,
            'order': self.order,
            'product': [i.serialize for i in self.product]
        }
