before do
  session['message'] = nil
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

post '/posts' do #create
  tags = params['post']['tags'].split ','
  tags.map! { |tag| Tag.create(:name => tag) }
  @post = Post.new( :title => params['title'],
                    :author => params['author'],
                    :body =>   params['body'])
  @post.tags << tags
  if @post.save
    session['message'] = "Post \"#{@post.title}\" created."
    @posts = Post.all
    erb :posts  #should probably be redirecting but want to display error message
                #so I decided to render the posts index
  else
    session['message'] = "Post creation unsuccessful. Please try again."
    erb :posts_new
  end
end

put '/posts/:id' do #update
  @post = Post.find(params[:id])
  @post.update_attributes(:title => params[:title],
                          :body =>  params[:body],
                          :author => params[:author] )
  @posts = Post.all
  session['message'] = "Post \"#{@post.title}\" updated."
  erb :posts
end

get '/posts/new' do
  erb :posts_new
end

get'/posts/:id' do
  @post = Post.find(params[:id])
  erb :posts_show
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :posts_edit
end

delete '/posts/:id' do #delete
  post = Post.find(params[:id])
  post.destroy
  redirect to('/posts')
end


