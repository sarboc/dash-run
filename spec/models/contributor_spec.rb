require 'spec_helper'

describe Contributor do
  let(:thing) do
    thing = Thing.new
    thing.admin_email = "sara@lafassett.com"
    thing.admin_name = "Sara"
    thing.time = Time.now
    thing.square_cash_email = "sara@lafassett.com"
    thing.venmo_id = "sarlaf"
    thing.title = "Come to my party!"
    thing.description = "It will be a super awesome party."
    thing.min_contribution = 4
    thing.save
    thing
  end

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

  it "should raise an error for an invalid email address" do
    contributor.email = "1234.com"
    contributor.save
    contributor.errors.messages[:email].should == ["#{ I18n.t "errors.invalid_email"}"]
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

  it "should destroy any contributors if the thing is destroyed" do
    thing.destroy
    Contributor.all.count.should == 0
  end

end
