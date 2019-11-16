from service import db

class Photo(db.Model):
    """"""
    __tablename__ = "photo"

    id = db.Column(db.Integer, primary_key=True)
    picture = db.Column(db.String(500), nullable=False)
    item_id = db.Column(db.Integer, db.ForeignKey('item.id'), nullable=False)


    # ----------------------------------------------------------------------
    def __repr__(self):
        return 'Photo(category_id="{}", picture:"{}")'.format(self.category_id, self.picture)
        pass

    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return self.picture
