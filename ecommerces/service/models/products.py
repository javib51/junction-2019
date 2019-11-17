from service import db

class Products(db.Model):
    """"""
    __tablename__ = "products"

    item = db.relationship("OrderItem", back_populates="products", uselist=False, lazy=True)
    product_category_name = db.Column(db.String(100), nullable=False, primary_key=True)
    product_description_length = db.Column(db.Integer(), nullable=False)
    product_height_cm = db.Column(db.Integer(), nullable=False)
    product_length_cm = db.Column(db.Integer(), nullable=False)
    product_name_length = db.Column(db.Integer(), nullable=False)
    product_photos_qty = db.Column(db.Integer(), nullable=False)
    product_weight_g = db.Column(db.Integer(), nullable=False)
    product_width_cm =db.Column(db.Integer(), nullable=False)

    # ----------------------------------------------------------------------

    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return {
            'product_category_name': self.product_category_name,
        }