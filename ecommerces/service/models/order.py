from service import db
import enum, datetime

class DeliveryState(enum.Enum):
    delivered = 1
    shipped = 2
    invoiced = 3
    canceled = 4
    unavailable = 5
    processing = 6
    created = 7
    approved = 8


class Order(db.Model):
    """"""
    __tablename__ = "order"

    customer_id = db.Column(db.String(50), primary_key=True, nullable=False)
    order = db.relationship("OrderItem", back_populates="order", uselist=False, lazy=True)
    order_status = db.Column(db.Enum(DeliveryState), nullable=False)
    order_purchase_timestamp = db.Column(db.DateTime(), default=datetime.datetime.utcnow)
    order_approved_at = db.Column(db.DateTime(), default=datetime.datetime.utcnow)
    order_delivered_carrier_date = db.Column(db.DateTime(), default=datetime.datetime.utcnow)
    order_delivered_customer_date = db.Column(db.DateTime(), default=datetime.datetime.utcnow)
    order_estimated_delivery_date = db.Column(db.DateTime(), default=datetime.datetime.utcnow)

    # ----------------------------------------------------------------------
    
    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return {
            'customer_id': self.customer_id,
            'order_status': self.order_status,
            'order_purchase_timestamp': self.order_purchase_timestamp,
            'order_approved_at': self.order_approved_at,
            'order_delivered_carrier_date': self.order_delivered_carrier_date,
            'order_delivered_customer_date': self.order_delivered_customer_date,
            'order_estimated_delivery_date': self.order_estimated_delivery_date,
            'order': [i.serialize for i in self.order]
        }