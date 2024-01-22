import os
from datetime import datetime
from flask import Flask, redirect, request,render_template, jsonify, send_from_directory, session, url_for, flash
import sqlite3
from werkzeug.security import generate_password_hash, check_password_hash

from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import InputRequired, Length, Regexp

class SignupForm(FlaskForm):
    username = StringField('Username', validators=[
        InputRequired(),
        Regexp('^[A-Za-z][A-Za-z0-9_.]{3,20}$', message="Username must start with a letter and be between 4 and 20 characters long.")
    ])
    password = PasswordField('Password', validators=[
        InputRequired(),
        Length(min=6, max=15, message="Password must be between 6 and 15 characters long.")
    ])
    submit = SubmitField('Register')

    def validate_username(self, field):
        conn = sqlite3.connect(DATABASE)
        cur = conn.cursor()
        cur.execute('SELECT id FROM users WHERE username = ?', (field.data,))
        if cur.fetchone():
            raise ValidationError('Username already exists.')
        conn.close()

class LoginForm(FlaskForm):
    username = StringField('Username', validators=[InputRequired()])
    password = PasswordField('Password', validators=[InputRequired()])
    submit = SubmitField('Login')


DATABASE = 'ann_brain.db'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])

app = Flask(__name__)

@app.route("/", methods=['GET'])
@app.route("/home", methods=['GET'])
def home():
    return render_template('1_home.html')

@app.route("/about", methods=['GET'])
def about():
    return render_template('2_about.html')

# ********************************projects*********************************
@app.route("/projects", methods=['GET'])
def projects():
  industry = request.args.get('industry')
  location = request.args.get('location')
  year = request.args.get('year')
  page = request.args.get('page', default=1, type=int)
  limit = request.args.get('limit', default=6, type=int)
  start = (page - 1) * limit

  # return filter options
  conn = sqlite3.connect(DATABASE)
  conn.row_factory = sqlite3.Row
  cursor = conn.cursor()

  cursor.execute('SELECT COUNT(id) as count FROM projects')
  total_projects = cursor.fetchone()['count']
  total_pages = (total_projects + limit - 1) // limit
  
  cursor.execute('SELECT DISTINCT industry FROM projects')
  industries = [row['industry'] for row in cursor.fetchall()]
  cursor.execute('SELECT DISTINCT location FROM projects')
  locations = [row['location'] for row in cursor.fetchall()]
  cursor.execute('SELECT DISTINCT year FROM projects')
  years = [row['year'] for row in cursor.fetchall()]

  # make up query indluding filter query
  conditions = []
  query_params = []
  if industry:
      conditions.append('industry = ?')
      query_params.append(industry)
  if location:
      conditions.append('location = ?')
      query_params.append(location)
  if year:
      conditions.append('year = ?')
      query_params.append(year)
  where_clause = ' WHERE ' + ' AND '.join(conditions) if conditions else ''

  query = f"SELECT * FROM projects {where_clause} LIMIT ? OFFSET ?"
  query_params.append(limit)
  query_params.append(start)
  cursor.execute(query, query_params)
  projects = [dict(row) for row in cursor.fetchall()]

  for project in projects:
    cursor.execute('SELECT rating FROM comments WHERE project_id = ?', (project['id'],))
    ratings = cursor.fetchall()
    if ratings:
        average = round(sum(rating['rating'] for rating in ratings) / len(ratings), 1)
    else:
        average = 0
    project['rating'] = average

  conn.close()
  if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
      return jsonify({'projects': projects, 'industries': industries, 'locations': locations, 'years': years, 'total_pages': total_pages, 'current_page': page})
  return render_template('3_projects.html', projects=projects, industries=industries, locations=locations, years=years, total_pages=total_pages, current_page=page)

@app.route('/images/<int:project_id>')
def get_first_image(project_id):
  image_directory = os.path.join('static', 'img', '3_projects', str(project_id))
#   image_files = os.listdir(image_directory)
#   image_files.sort()
  
  image_files = sorted([f for f in os.listdir(image_directory) 
            if os.path.isfile(os.path.join(image_directory, f)) 
            and (f.lower().endswith('.jpg') or f.lower().endswith('.png'))])
  print(image_files)

  first_image = image_files[0] if image_files else None
  print(image_directory,first_image)
  if first_image:
      return send_from_directory(image_directory, first_image)
  else:
      return 'No image found', 404

# ********************************projects-DETAILS*********************************
@app.route('/projects/<int:project_id>', methods=['GET', 'POST'])
def project_detail(project_id):
    if request.method == 'GET':
        # connect
        conn = sqlite3.connect(DATABASE)
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()

        cursor.execute('SELECT * FROM projects WHERE id = ?', (project_id,))
        project = cursor.fetchone()
        project_dict = dict(project) if project else None
        comments = cursor.execute('SELECT comments.*, users.username FROM comments JOIN users ON users.id = comments.user_id WHERE project_id = ?', (project_id,)).fetchall()
        
        cursor.execute('SELECT rating FROM comments WHERE project_id = ?', (project_id,))
        ratings = cursor.fetchall()
        if ratings:
            rating_avr = round(sum(rating['rating'] for rating in ratings) / len(ratings), 1)
        else:
            rating_avr = 0

        # get imgs
        image_directory = os.path.join('static', 'img', '3_projects', str(project_id))
        print(image_directory)
        image_files = [f for f in os.listdir(image_directory) if os.path.isfile(os.path.join(image_directory, f))]
        print(image_files)
        
        image_files = sorted([f for f in os.listdir(image_directory) 
                    if os.path.isfile(os.path.join(image_directory, f)) 
                    and (f.lower().endswith('.jpg') or f.lower().endswith('.png'))])
        print(image_files)

        image_data = []
        for image_file in image_files:
            image_path = f'/static/img/3_projects/{project_id}/{image_file}'
            image_name = image_file.rsplit('.', 1)[0]
            image_data.append({'path': image_path, 'name': image_name})

        conn.close()
        print(project)
        print(image_data)
        return render_template('4_prodtail.html', project=project_dict, images=image_data, comments=comments, rating_avr=rating_avr)
    if request.method == 'POST':
        if not session.get('logged_in'):
            error = ''
            return render_template('6_login.html', error=error)
        else:
            username = session.get('username')
            conn = sqlite3.connect(DATABASE)
            conn.row_factory = sqlite3.Row
            cursor = conn.cursor()
            cursor.execute('SELECT id FROM users WHERE username = ?', (username,))
            user = cursor.fetchone()
            user_id = user['id'] if user else None
            print(user_id)

            comment_text = request.form['comment']
            rating = request.form['rating']
            time = datetime.now().strftime('%Y-%m-%d %H:%M')

            cursor.execute('INSERT INTO comments (project_id, user_id, comment, rating, time) VALUES (?, ?, ?, ?, ?)',
                       (project_id, user_id, comment_text, rating, time))
            conn.commit()

            conn.close()
            return redirect(url_for('project_detail', project_id=project_id))


# ********************************SIGNUP*********************************
@app.route("/signup", methods=['GET','POST'])
def signup():
    form = SignupForm()
    if request.method == 'POST':
        if form.validate_on_submit():
            username = request.form.get('username', default="Error")
            password = request.form.get('password', default="Error")
            hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
            password = hashed_password

            try:
                conn = sqlite3.connect(DATABASE)
                conn.row_factory = sqlite3.Row
                cur = conn.cursor()
                cur.execute('INSERT INTO users (username, password) VALUES (?, ?)', (username, password))
                conn.commit()
                flash('Registration successful. Welcome! Please log in')
                return redirect(url_for('login'))
            except :
                conn.rollback()
                flash('Registration error: ')
            finally:
                conn.close()
    return render_template('5_signup.html', form=form)

app.secret_key = 'secret_key'

# ********************************LOGIN*********************************
@app.route("/login", methods=['GET','POST'])
def login():
    form = LoginForm()
    if request.method == 'POST':
        if form.validate_on_submit():
            username = request.form.get('username', default="Error")
            password = request.form.get('password', default="Error")

            try:
                conn = sqlite3.connect(DATABASE)
                conn.row_factory = sqlite3.Row
                cur = conn.cursor()
                cur.execute('SELECT * FROM users WHERE username = ?', (username,))
                user = cur.fetchone()

                if user and check_password_hash(user['password'], password):
                    session['logged_in'] = True
                    session['username'] = user['username']
                    # might change to profile page
                    return render_template('1_home.html')
                else:
                    flash('Invalid username or password')
            except:
                flash('Database error')
            finally:
                if conn:
                    conn.close()
        return render_template('6_login.html', form=form)
    else:
        return render_template('6_login.html', form=form)

# ********************************LOGOUT*********************************
@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    session.pop('username', None)
    return render_template('1_home.html')

# ********************************PROFILE*********************************
@app.route('/profile')
def profile():
    if not session.get('logged_in'):
        error=''
        return render_template('6_login.html', error=error)
    
    username = session['username']
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    cursor = conn.cursor()

    cursor.execute('SELECT id FROM users WHERE username = ?', (username,))
    user = cursor.fetchone()

    if user:
        user_id = user['id']
        cursor.execute('SELECT * FROM comments WHERE user_id = ?', (user_id,))
        rows = cursor.fetchall()
        comments = [dict(row) for row in rows]
    else:
        comments = []
    print(comments)
    
    conn.close()
    return render_template('7_profile.html', comments=comments, username=username)

  
if __name__ == "__main__":
    app.run(debug=True)