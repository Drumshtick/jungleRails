class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {in: 6..20}
  validates :password_confirmation, presence: true
  # Gives the user model authentication methods from bcrypt
  has_secure_password
  
  def authenticate_with_credentials(email, password)
    @user = User.where(email: email, password: password)
  end
  
    # before saving before_save is called!
      # This will put the email to downcase before saving
  before_save { validate_save}
  def validate_save
    if (self.first_name && self.last_name && self.email && self.email )
      self.email.downcase!
    else 
      nil
    end
  end

end
    # a ||= b is a conditional assignment operator. It means:
      # if a is undefined or falsey, then evaluate b and set a to the result.
      # Otherwise (if a is defined and evaluates to truthy), then b is not evaluated, and no assignment takes place.
