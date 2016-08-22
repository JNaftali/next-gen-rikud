# db = SQLite3::Database.new("links.db")
# db.results_as_hash = true

# link_types = db.execute <<-SQL
#     SELECT name FROM sqlite_master
#     WHERE type='table';
#   SQL
# link_types.map! { |hash| hash['name'] }

#BACKEND
#Admin homepage
get '/edit' do

  @links = Link.all_by_type

  erb :edit
end

#Adding new link types
#Unsure how to handle doing this. Maybe the answer is don't
get '/new' do
  erb :new_category
  "This doesn't work yet"
end

post '/new' do
  name = params['name'].downcase.gsub(" ", "_")
  db.execute("CREATE TABLE IF NOT EXISTS #{name}( item VARCHAR(255), quantity INT, purchased INT )")
  redirect '/edit'
end

#Adding new links
get '/:type/add' do
  @type =  params['type']
  erb :add_link
end

post '/:type/add' do
  attributes = { title: params['title'], url: params['url'], description: params['description'], type: params['type'] }
  Link.create(attributes)
  redirect '/edit'
end

#Editing existing links
get '/:type/edit/:id' do
  @type =  params['type']
  @id = params['id'].to_s
  link = Link.find(@id)
  @title = link.title
  @url = link.url
  @description = link.description
  erb :edit_link
end

post '/:type/edit/:id' do
  Link.update(params['id'], title: params['title'], url: params['url'], description: params['description'])

  redirect '/edit'
end
