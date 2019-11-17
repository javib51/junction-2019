from service import db
from service.models import order
from .order import Order
from .orderItem import OrderItem
from .products import Products

db.create_all()

# from sqlalchemy.orm import sessionmaker
# Session = sessionmaker(bind=engine)