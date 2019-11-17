import configparser
import os

import firebase_admin
from flask_sqlalchemy import SQLAlchemy
from algoliasearch.search_client import SearchClient


def get_config(profile):
    if profile is not '':
        config_file = 'config-' + profile.lower() + '.ini'
    else:
        config_file = 'config.ini'

    config = configparser.ConfigParser()
    config.read('config/' + config_file)
    print(dict(config.items('mysql')))
    return config


def get_db_connection(config, app):
    db_url = 'mysql://{}:{}@{}/{}'.format(config['mysql']['user'], config['mysql']['password'],
                                          config['mysql']['host'], config['mysql']['schema'])

    app.config['SQLALCHEMY_DATABASE_URI'] = db_url
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    engine = SQLAlchemy(app)
    return engine