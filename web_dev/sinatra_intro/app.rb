# require gems
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET route that does a contact address.

get '/contact/:addressline1/:addressline2' do
  response = "Address: <br><br>"
  address = params[:addressline1] + "<br>"
  address << params[:addressline2]
  response << address.to_s
end

# write a GET route that takes a person's name if present and says good job!

get '/great_job' do
  name = params["name"]
  if(name)
    "Good job, #{name}!!"
  else
    "Good job!"
  end
end

# create a route that adds two given numbers together

get '/add/:num1/:num2' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  math = num1 + num2
  math.to_s
end

# call a student with a given campus from the database

get '/student_search/campus/:campus' do 
  students = db.execute("SELECT * FROM students WHERE campus=?", [params[:campus]])
  # display info in a pretty way
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# Sinatra is not the only framework out there.  Others like Ruby on Rails, Merb, Nitro, and Camping.

# I found a post saying Sinatra is database-agnostic which seems to mean it can use any database system.

# Web stack is the collection of software needed for web development.
# It has an operating system, a programming language, database software and a web server.