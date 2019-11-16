from service import db


class Category(db.Model):
    """"""
    __tablename__ = "category"

    id = db.Column(db.Integer, primary_key=True)
    picture = db.Column(db.String(500), nullable=False)
    name = db.Column(db.String(20), unique=True, nullable=False)
    subCategories = db.relationship('SubCategory', backref='category', lazy=True)
    items = db.relationship('Item', backref='category', lazy=True)

    # ----------------------------------------------------------------------
    def __repr__(self):
        return 'Category(name="{}", picture="{}", subCategories="{}")'.format(self.name, self.picture,
                                                                              self.subCategories)
        pass

    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return {
            'id': self.id,
            'picture': self.picture,
            'name': self.name,
            'subcategories': [i.serialize for i in self.subCategories]
        }

    @property
    def serialize_search_index(self):
        """Return object data in easily serializable format"""
        return {
            'id': self.id,
            'name': self.name,
        }
