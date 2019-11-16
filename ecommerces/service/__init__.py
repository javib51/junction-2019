import os

from flask import Flask
from service import config

app = Flask(__name__)

# # Init logging
# if os.environ.get('GAE_ENV') == 'standard':
#     import google.cloud.logging
#     client = google.cloud.logging.Client()
#     client.setup_logging()

from . import config as cf

config = cf.get_config('')
db = cf.get_db_connection(config, app)
from . import models
from . import routes
