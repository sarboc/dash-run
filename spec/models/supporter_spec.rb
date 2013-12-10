require 'spec_helper'

describe Supporter do
  it "should belong to a run" do
    supporter = Supporter.create(name: "Sara", email: "sara@lafassett.com", contribution: 5, note: "Awesome!")
    supporter.should respond_to :thing
  end
end
