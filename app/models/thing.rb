class Thing < ActiveRecord::Base
  attr_accessible

  has_many :contributors

  before_create :add_urls

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

end
