class User < ActiveRecord::Base
  # Gives the user model authentication methods from bcrypt
  has_secure_password
end
