class Thing < ActiveRecord::Base
  attr_accessible
  attr_readonly :admin_url, :public_url

  has_many :contributors

  validates :admin_url, presence: true, on: :update
  validates :public_url, presence: true, on: :update
  validates :time, presence: true
  validates :admin_name, presence: true
  validates :admin_email, presence: true
  validates :title, presence: true
  validates :min_contribution, presence: true

  before_create :add_urls
  before_save :validate_admin_email

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

  def validate_admin_email
    admin_email = self.admin_email.match(/(^\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z$)/i)
    unless admin_email && admin_email[0] == self.admin_email
      errors.add(:admin_email, "#{ I18n.t "errors.invalid_email"}")
    end
  end

end
