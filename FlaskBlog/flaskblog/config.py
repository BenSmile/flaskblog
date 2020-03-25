import os

class Config:

   
    SECRET_KEY = '35d668731b9a277b681fac0a0c12e4c4'
    DATABASE = 'flask'
    PASSWORD = 'smile'
    USER = 'root'
    # in case of docker, this is the hostname pointed to the db container
    HOSTNAME = 'db'

    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://%s:%s@%s/%s'%(USER, PASSWORD, HOSTNAME, DATABASE)
#    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:smile@db/flask'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    # mail configurations
    MAIL_SERVER = 'smtp.gmail.com'
    MAIL_PORT = 465
    MAIL_USE_SSL = True
    MAIL_USERNAME = os.environ.get('MAIL_USERNAME')
    MAIL_PASSWORD = os.environ.get('MAIL_PASSWORD')
    MAIL_DEFAULT_SENDER = os.environ.get('MAIL_USERNAME')


