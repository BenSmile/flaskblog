from flask import Blueprint
from flaskblog.models import User, Post

api = Blueprint('api', __name__)
