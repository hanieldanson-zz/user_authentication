require 'bcrypt'

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user.password == params[:user][:password]
    # session[:user_id] = user.id
    redirect '/users'
  else
    erb :"users/login"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect_to '/'
end

