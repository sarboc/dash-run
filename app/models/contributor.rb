class Contributor < ActiveRecord::Base
  attr_accessible :name, :email, :contribution, :note

  belongs_to :thing, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :contribution, presence: true
  validates :thing, presence: true

  after_create :calc_totals
  before_save :validate_email

  def calc_totals
    thing = self.thing
    thing.total_contributors = thing.contributors.count
    thing.total_contributions = thing.contributors.reduce(0) { |sum, n| sum + n.contribution }
    thing.save
  end

  def validate_email
    email = self.email.match(/(^\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z$)/i)
    unless email && email[0] == self.email
      errors.add(:email, "#{ I18n.t "errors.invalid_email"}")
    end
  end

end
