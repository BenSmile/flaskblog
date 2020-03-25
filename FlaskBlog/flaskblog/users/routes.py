from flask import Blueprint, render_template, redirect, flash, url_for, request, abort
from flask_login import login_user, current_user, logout_user, login_required
from flaskblog.users.forms import (RegistrationForm, LoginForm, UpdateAccountForm,
                             ResetPasswordForm, RequestResetForm)
from flaskblog import db, bcrypt, mail
from flaskblog.models import User, Post
from flaskblog.users.utils import save_picture
from flask_mail import Message


users = Blueprint('users', __name__)

@users.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        u = User.query.filter_by(email=form.email.data).first()
        if u:
            if bcrypt.check_password_hash(u.password, form.password.data):
                login_user(u, form.remember.data)
                next_page = request.args.get('next')
                return redirect(next_page) if next_page else redirect(url_for('main.home'))
        else:
            flash('Login or password incorrect', 'danger')
    return render_template('login.html', title='Login', form=form)

@users.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('register'))
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        u1 = User.query.filter_by(username=form.username.data).first()
        u2 = User.query.filter_by(email=form.email.data).first()
        if u1 or u2:
            flash('Username or email is already used', 'danger')
            return redirect(url_for('users.register'))
        new_user = User(username=form.username.data,
                        password=hashed_password, email=form.email.data)
        db.session.add(new_user)
        db.session.commit()
        flash('Your account has been created! You are able to log in', 'success')
        return redirect(url_for('users.login'))
    return render_template('register.html', title='Register', form=form)


@users.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('main.home'))


@users.route('/account', methods=['GET', 'POST'])
@login_required
def account():
    form = UpdateAccountForm()
    if form.validate_on_submit():
        if form.picture.data:
            picture_file = save_picture(form.picture.data)
            current_user.image_file = picture_file
        current_user.username=form.username.data
        current_user.email=form.email.data
        db.session.commit()
        flash('Your account has been updated', 'success')
        return redirect(url_for('users.account'))
    elif request.method == 'GET':
        form.username.data = current_user.username
        form.email.data = current_user.email
    image_file = url_for('static', filename='profile_pics/'+current_user.image_file)
    return render_template('account.html', title='Account', image_file=image_file, form=form)


@users.route('/user/<username>')
def user_post(username):
    user = User.query.filter_by(username =username).first_or_404()
    page = request.args.get('page',1, type = int)
    posts = Post.query.filter_by(author=user)\
        .order_by(Post.date_post.desc())\
        .paginate(per_page = 5)
    return render_template('user_posts.html', posts=posts, user = user)


def send_reset_mail(user):
    token = user.get_reset_token()
    print('#########', token)
    msg = Message('Password Reset Request', 
                    sender='smilekafirongo@gmail.com',
                    recipients=[user.email])
    msg.body=f'''To reset yout password, visit the following link:
    {url_for('users.reset_token', token = token, _external=True)}
    If you did not make this request then simply ignore this email and no change will be made
    '''
    mail.send(msg)

@users.route('/reset_request', methods=['GET','POST'])
def reset_request():
    if current_user.is_authenticated:
       return redirect(url_for('home'))
    form = RequestResetForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        send_reset_mail(user)
        flash('A email has been send with instruction to reset your password', 'info')
        return redirect(url_for('users.login'))
    return render_template('reset_request.html', title = 'Reset password', form = form)
    
@users.route('/reset_request/<token>', methods=['GET','POST'])
def reset_token(token):
    if current_user.is_authenticated:
       return redirect(url_for('main.home'))
    user = User.verify_reset_token(token)
    if user is None:
        flash('That is an invalid or expired token', 'warning')
    form = ResetPasswordForm()
    if form.validate_on_submit():
        hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user.password=hashed_password
        db.session.commit()
        flash('Your password has been successfully changed', 'success')

    return render_template('reset_token.html', title = 'Reset password', form = form)