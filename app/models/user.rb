require 'bcrypt'

class User #< ActiveRecord::Base
  #include BCrypt
  include DataMapper::Resource

  property :id,            Serial
  property :email,         String
  property :password,      String

  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
end
