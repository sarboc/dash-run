class Contributor < ActiveRecord::Base
  attr_accessible :name, :email, :contribution, :note

  belongs_to :thing

  validates :name, presence: true
  validates :email, presence: true
  validates :contribution, presence: true
  validates :thing, presence: true

  after_create :calc_totals

  def calc_totals
    thing = self.thing
    thing.total_contributors = thing.contributors.count
    thing.total_contributions = thing.contributors.reduce(0) { |sum, n| sum + n.contribution }
    thing.save
  end
end
