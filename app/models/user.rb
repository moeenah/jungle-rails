class User < ActiveRecord::Base

  has_secure_password

  validates_confirmation_of :password
  validates :password, :password_confirmation, presence: true
  validates :password, :length => {:minimum => 8 }
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true

  def self.authenticate_with_credentials(email, password)
    #converts email to lowercase and removes whitespaces then tries
    #matching in database to all emails converted to lowercase
    user = User.where('lower(email) = ?', email.strip.downcase).first
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      puts user.id
      return user
    else
      return false
    end

  end

end
