require 'bcrypt'

enable :sessions

get '/' do
  redirect "/login"
end
