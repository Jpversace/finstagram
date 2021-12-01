get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do
  @user = User.new
  erb(:signup)       
end

post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    "User #{username} saved!"
  else
    erb(:signup)
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    username = params[:username]
    password = params[:password]
  
    user = User.find_by(username: username)
  
    if user && user.password == password
      "Success!"
    else
      "Login failed."
  end
end
