require 'spec_helper'

describe Thing do
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

  it "should have many supporters" do
    thing.should respond_to :contributors
  end

  it "should not be possible to remove the admin_url" do
    thing.admin_url = nil
    thing.save.should be_false
  end

  it "should not be possible to update the admin_url" do
    url = thing.admin_url
    thing.admin_url = SecureRandom.hex(32)
    thing.reload.admin_url.should == url
  end

  it "should not be possible to remove the public_url" do
    thing.public_url = nil
    thing.save.should be_false
  end

  it "should not be possible to update the public_url" do
    url = thing.public_url
    thing.public_url = SecureRandom.hex(32)
    thing.reload.public_url.should == url
  end

  it "should automatically create admin and public URLs" do
    thing.reload.admin_url.should_not be_nil
    thing.public_url.should_not be_nil
  end

  it "should require admin email" do
    thing.admin_email = nil
    thing.save.should be_false
  end

  it "should raise an error for an invalid email address" do
    thing.admin_email = "1234.com"
    thing.save
    thing.errors.messages[:admin_email].should == ["#{ I18n.t "errors.invalid_email"}"]
  end

  it "should require admin name" do
    thing.admin_name = nil
    thing.save.should be_false
  end

  it "should require a min_contribution" do
    thing.min_contribution = nil
    thing.save.should be_false
  end

  it "should not require a square_cash_email" do
    thing.square_cash_email = nil
    thing.save.should be_true
  end

  it "should not require a venmo_id" do
    thing.venmo_id = nil
    thing.save.should be_true
  end

end
