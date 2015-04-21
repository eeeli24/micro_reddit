class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  before_save { email.downcase! }
  validates :name, presence: true,
                   length: { minimum: 3, maximum: 25 }

  validates :password, presence: true,
                       length: { minimum: 6, maximum: 25 }

  validates :email, presence: true,
                    length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
end
