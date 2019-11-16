from service import db


class SubCategory(db.Model):
    """"""
    __tablename__ = "subcategory"

    id = db.Column(db.Integer, primary_key=True)
    picture = db.Column(db.String(500), nullable=False)
    name = db.Column(db.String(50), unique=True, nullable=False)
    category_id = db.Column(db.Integer, db.ForeignKey('category.id'),
                            nullable=False)
    items = db.relationship('Item', backref='subcategory', lazy=True)

    # ----------------------------------------------------------------------
    def __repr__(self):
        return 'SubCategory(name="{}", picture:"{}")'.format(self.name, self.picture)
        pass

    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return {
            'id': self.id,
            'picture': self.picture,
            'name': self.name
        }
