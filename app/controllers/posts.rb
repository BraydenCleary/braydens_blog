before do
  session['message'] = nil
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

get '/posts/:id/like' do
  @post = Post.find(params[:id])
  @post.like_count += 1
  @post.save
  @posts = Post.all.sort { |a,b| b.like_count <=> a.like_count}
  redirect to '/posts'
end

post '/posts' do #create
  content_type :json
  tags = params['post']['tags'].split(/[\s,]+/)
  tags.map! do |tag| 
    Tag.create(:name => tag)
  end
  @post = Post.new( :title => params['title'],
                    :author => params['author'],
                    :body =>   params['body'])
  @post.tags << tags
  if @post.save
    session['message'] = "Post \"#{@post.title}\" created."
    @posts = Post.all
    @post.to_json
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


