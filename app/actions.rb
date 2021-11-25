get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end
  
get '/signup' do
  @user = User.new
  erb(:signup)
end