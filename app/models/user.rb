class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password ||= Password.create(pass)
    self.password_hash = @password
  end

  def self.create(params)
    user = User.new(
      :username => params[:username],
      :email => params[:email] )
    user.password = params[:password]
    user.save
    user
  end

  # def self.authenticate(params)
  #   user = User.find_by_name(params[:username])
  #   (user && user.password == params[:password]) ? user : nil
  # end

  validates :username, :presence => true,
  :uniqueness => true
  validates :email,    :presence => true,
  :uniqueness => true,
  :format => { :with => /\w+@\w+\.\w+/ }
  validates :password, :presence => true

end
