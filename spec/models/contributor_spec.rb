require 'spec_helper'

describe Contributor do
  let(:thing) { Thing.create }

  let (:contributor) do
    contributor = Contributor.new(name: "Sara", email: "sara@lafassett.com", contribution: 5, note: "Awesome!")
    contributor.thing = thing
    contributor.save
    contributor
  end

  it "should belong to a run" do
    contributor.should respond_to :thing
  end

  it "should require name" do
    Contributor.all.count.should == 0
    contributor = Contributor.new(email: "sara@lafassett.com", contribution: 5, note: "Awesome!")
    contributor.thing = thing
    contributor.save
    Contributor.all.count.should == 0
  end

  it "should require email" do
    Contributor.all.count.should == 0
    contributor = Contributor.new(name: "Sara", contribution: 5, note: "Awesome!")
    contributor.thing = thing
    contributor.save
    Contributor.all.count.should == 0
  end

  it "should require contribution" do
    Contributor.all.count.should == 0
    contributor = Contributor.new(name: "Sara", email: "sara@lafassett.com", note: "Awesome!")
    contributor.thing = thing
    contributor.save
    Contributor.all.count.should == 0
  end

  it "should require a thing" do
    Contributor.all.count.should == 0
    contributor = Contributor.new(name: "Sara", email: "sara@lafassett.com", contribution: 5, note: "Awesome!")
    contributor.save
    Contributor.all.count.should == 0
  end

  it "should not require a note" do
    Contributor.all.count.should == 0
    contributor = Contributor.new(name: "Sara", email: "sara@lafassett.com", contribution: 5)
    contributor.thing = thing
    contributor.save
    Contributor.all.count.should == 1
  end

  it "should recalculate total_contributors for its thing when saved" do
    contributor
    thing.reload.total_contributors.should == 1
  end

  it "should recalculate total_contributions for its thing when saved" do
    contributor
    thing.reload.total_contributions.should == 5
  end

end
