# require gems
require 'sinatra'
require 'sqlite3'
require_relative 'utility'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("links.db")
db.results_as_hash = true

link_groups = db.execute <<-SQL
    SELECT name FROM sqlite_master
    WHERE type='table';
  SQL
link_groups.map! { |hash| hash['name'] }

get '/' do
  @tables = link_groups.map! {|w| parse_table_name(w)}

  @tables.to_s
end

#Admin homepage
get '/edit' do
  @links = {}
  link_groups.each do |table|
    @links[table] = db.execute("SELECT * FROM #{table}")
  end

  erb :edit
end

#Adding new link groups
get '/new' do
  erb :new_category
end

post '/new' do
  name = params['name'].downcase.gsub(" ", "_")
  db.execute("CREATE TABLE IF NOT EXISTS #{name}( item VARCHAR(255), quantity INT, purchased INT )")
  redirect '/edit'
end

#Adding new links
get '/:group/add' do
  @group =  params['group']
  erb :add_link
end

post '/:group/add' do
  db.execute("INSERT INTO #{params['group']}(title, url, description) VALUES (?, ?, ?)", params['title'], params['url'], params['description'])
  redirect '/edit'
end

#Editing existing links
get '/:group/edit/:id' do
  @group =  params['group']
  @id = params['id'].to_s
  row = db.execute("SELECT * FROM #{params['group']} WHERE id = ?",@id)[0]
  @title = row['title']
  @url = row['url']
  @description = row['description']
  erb :edit_link
end

post '/:group/edit/:id' do
  db.execute("DELETE FROM #{params['group']} WHERE id=?",params['id'])
  db.execute("INSERT INTO #{params['group']}(id, title, url, description) VALUES (?, ?, ?, ?)", params['id'], params['title'], params['url'], params['description'])

  redirect '/edit'
end