class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities
  before_create :set_token

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  private

    def set_token
      self.view_token = User.new_token
    end

end
