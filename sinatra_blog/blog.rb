require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'sinatra/base'
require 'sinatra/advanced_routes'

require 'sqlite3'
require 'json'
require 'pp'

# class Foo < Sinatra::base
# 	register Sinatra::AdvancedRoutes
# end

def query_db(sql)
  pp sql
  db = SQLite3::Database.new('database.db')
  db.results_as_hash = true
  data = db.execute(sql)
  db.close
  data
end

@different_routes_list = []
Sinatra::Application.each_route do |route|
  @different_routes_list.push(route.path)
end

get '/' do
  erb 'blog/index'.to_sym
end

get '/blog' do
  @blog_entries = query_db('SELECT * FROM blog').first #
  erb 'blog/blog'.to_sym
end

get '/new' do
  @parameters = params
  erb 'blog/new_entry'.to_sym
end

post '/new' do
  pp params
  @parameters = params
  query_db("INSERT INTO blog (author, title, date_written, entry, picture) VALUES ('#{@parameters[:author]}', '#{@parameters[:title]}', '#{@parameters[:date_written]}', '#{@parameters[:entry]}', '#{@parameters[:picture]}')")
  redirect to '/'
end

helpers do
  def li_with_a(options)
    '<li class="' + options[:class] + '"><a href="' + options[:url] + '">' + options[:text] + '</a></li>'
  end
end
