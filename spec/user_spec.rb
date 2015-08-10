require 'spec_helper'

describe User do
  before :all do
    @user = User.new(
      email: "test@rspec.com",
      password: "testPassword1",
      password_confirmation: "testPassword1",
      first_name: "test",
      last_name: "rspec",
      image: File.new('app/assets/images/default_icon.jpg')
    )
  end

  describe "#new" do
    it "creates a new test User using default values" do
      expect(@user).to be_an_instance_of User
    end
  end

  describe "#fullname" do
    it "returns the first and last names of the User" do
      expect(@user.fullname).to be == "test rspec"
    end
  end
end