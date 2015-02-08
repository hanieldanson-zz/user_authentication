require 'bcrypt'

enable :sessions

get "/users" do
  @users = User.all
  redirect "/users/login"
end

get "/users/secret" do
  @user = User.find(session[:user_id])
  if @user
    erb :secret
  else
    redirect "/"
  end
end

# Display form to create a new user account.
get "/users/new" do
  # @user = User.new
  erb :"users/new"
end

# Create a new users account
post "/users/new" do
  user = User.create!(params[:username])
  if user.save
    session[:user_id] = user.id
    redirect '/users'
  else
    @errors = user.errors.messages
    erb :"users/new"
  end
end

post "/users" do
  erb :"/users/login"
end

get "/users/:user_id" do
  @user = User.find(params[:user_id])
  erb :"/users/show"
end
