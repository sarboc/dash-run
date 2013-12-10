class Thing < ActiveRecord::Base
  attr_accessible :time, :name, :email

  has_many :contributors

  validates :admin_url, presence: true
  validates :public_url, presence: true
  validates :time, presence: true
  validates :name, presence: true
  validates :email, presence: true

  before_create :add_urls
  before_save :validate_email

  def add_urls
    self.admin_url = SecureRandom.hex(32)

    while Thing.find_by_admin_url(self.admin_url)
      self.admin_url = SecureRandom.hex(32)
    end

    self.public_url = SecureRandom.hex(32)

    while Thing.find_by_public_url(self.public_url)
      self.public_url = SecureRandom.hex(32)
    end

  end

  def validated_email
    unless self.email.match(/(^\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z$)/i)[0] == self.email
      errors.add(:email, "That is not a valid email address!")
    end
  end

end
