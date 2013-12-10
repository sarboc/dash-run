class Supporter < ActiveRecord::Base
  attr_accessible :name, :email, :contribution, :note

  belongs_to :thing
end
