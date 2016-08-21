# set :public_folder, File.dirname(__FILE__) + '/static'

#FRONTEND
get '/' do
  erb :home
end

get '/category/sessions' do
  @links = Link.all
  erb :sessions
end

get '/category/:cat' do
  @links = Link.all
  erb :sessions
end