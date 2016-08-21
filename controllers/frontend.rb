# set :public_folder, File.dirname(__FILE__) + '/views'

#FRONTEND
get '/' do
  erb :home
end

get '/category/:cat' do
  @category = params['cat']
  @links = Link.where(type: @category.capitalize.chop)
  erb :link_page
end
