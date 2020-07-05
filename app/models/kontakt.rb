class Kontakt
  include ActiveModel::Model

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :name, :subject, :email, :message

  validates :name,    presence: true, length: { maximum: 255 }
  validates :subject, presence: true, length: { maximum: 255 }
  validates :message, presence: true, length: { maximum: 1000000 }
  validates :email,   presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

end
