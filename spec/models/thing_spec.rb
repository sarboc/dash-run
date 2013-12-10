require 'spec_helper'

describe Thing do
  it "should have many supporters" do
    thing = Thing.create
    thing.should respond_to :contributors
  end

  it "should automatically create admin and public URLs" do
    thing = Thing.create
    thing.reload.admin_url.should_not be_nil
    thing.public_url.should_not be_nil
  end

  it "should raise an error for an invalid email address" do
    thing = Thing.create(email: "1234.com")
    thing.errors[:email].should == "foo"
  end

end
