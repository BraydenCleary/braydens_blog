get '/tags/:name' do
  tag = Tag.find_by_name(params[:name])
  @posts = tag.posts
  erb :tags_show
end

get '/tags' do
  @tags = Tag.all
  erb :tags
end
