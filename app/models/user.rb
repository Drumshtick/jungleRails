class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {in: 6..20}
  validates :password_confirmation, presence: true
  # Gives the user model authentication methods from bcrypt
  has_secure_password
  
  def self.authenticate_with_credentials(email, password)
    user = User.where(email: email).first
    if user
      user.authenticate(password)
    else
      nil
    end
  end
  
    # before saving before_save is called!
      # This will put the email to downcase before saving
  before_save { self.email.downcase!}

end
