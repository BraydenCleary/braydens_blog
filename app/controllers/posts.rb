before do
  session['message'] = nil
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

post '/posts' do
  @post = Post.new(params)
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

get '/posts/new' do
  erb :posts_new
end

get'/posts/:id' do
  @post = Post.find(params[:id])
  erb :posts_show
end

delete '/posts/:id' do
  puts params
  post = Post.find(params[:id])
  post.destroy
  redirect to('/posts')
end


