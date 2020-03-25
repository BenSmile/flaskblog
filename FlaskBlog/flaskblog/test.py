from flaskblog import db
from flaskblog.models import User, Post

user1 = User.query.get(6).first()
user2 = User.query.get(6).first()
user3 = User.query.get(6).first()

for i in range(20):
    post = Post(title=f'post title {i}', content=f'content post {i}', author=user1)
    db.session.add(post)
db.session.commit()

user = User.query.filter(User.email.like('%gmail%'))

from sqlalchemy import or_, and_
posts = Post.query.filter(or_(Post.title.like('%love%'),Post.content.like('%love%'))).all()
user = User.query.filter(User.email.like('%@%')).all()

