from flask import Flask
from flask_bootstrap import Bootstrap
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_bcrypt import Bcrypt
from flask_mail import Mail
from flaskblog.config import Config
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand



bootstrap = Bootstrap()
bcrypt = Bcrypt()
login_manager = LoginManager()
login_manager.login_view='users.login'
login_manager.login_message_category='info'
mail = Mail()
db = SQLAlchemy()




def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(Config)
    bootstrap.init_app(app)
    bcrypt.init_app(app)
    login_manager.init_app(app)
    mail.init_app(app)
    db.init_app(app)
    migrate = Migrate(app, db)
    manager = Manager(app)
    manager.add_command('db', MigrateCommand)

    from flaskblog.users.routes import users
    from flaskblog.posts.routes import posts
    from flaskblog.main.routes import main
    from flaskblog.api import api
    from flaskblog.errors.handlers import errors

    app.register_blueprint(users)
    app.register_blueprint(posts)
    app.register_blueprint(main)
    app.register_blueprint(api, url_prefix='/api/v1')
    app.register_blueprint(errors)
    
    return app