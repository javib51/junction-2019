from service import db
import enum


class DateType(enum.Enum):
    booked = 1
    rent_day_off = 2


class UnAvailableDate(db.Model):
    """"""
    __tablename__ = "unavailable_dates"

    id = db.Column(db.Integer, primary_key=True)
    item_id = db.Column(db.Integer, db.ForeignKey('item.id'), nullable=False)
    date = db.Column(db.DateTime(timezone=True), nullable=False)
    type = db.Column(db.Enum(DateType), nullable=False)

    # ----------------------------------------------------------------------
    def __repr__(self):
        return 'Item( item_id="{}", date="{}", type="{}")'.format(self.item_id,
                                                                  self.date.strftime('%Y-%m-%dT%H:%M:%SZ'),
                                                                  self.type.name)

    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return self.date.strftime('%Y-%m-%dT%H:%M:%SZ')
