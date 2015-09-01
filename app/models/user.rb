class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save {self.email=email.downcase}
  has_many :thoughts,dependent: :destroy
  validates :name,presence: true,length: {maximum: 50}
  validates :email,presence:true,length:{maximum: 250}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX},uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length:{minimum: 6},allow_blank: true
  validate :picture_size
  mount_uploader :picture,PictureUploader

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def User.token
    SecureRandom.urlsafe_base64
  end
  def remember
    self.remember_token=User.token
    self.update_attribute(:remember_digest,User.digest(remember_token))
  end
  def authenticated(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end
  def forget
    self.update_attribute(:remember_digest, nil)
  end
  def feed(category)
    self.thoughts.where('category=?',category).all
  end
  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end

