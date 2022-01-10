class User < ActiveRecord::Base
  # Gives the user model authentication methods from bcrypt
  has_secure_password
  
  def authenticate_with_credentials(email, password)
    @user = User.where(email: email, password: password)
  end
  
    # before saving before_save is called!
      # This will put the email to downcase before saving
  before_save { self.email.downcase!}
end
    # a ||= b is a conditional assignment operator. It means:
      # if a is undefined or falsey, then evaluate b and set a to the result.
      # Otherwise (if a is defined and evaluates to truthy), then b is not evaluated, and no assignment takes place.
