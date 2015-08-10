require 'spec_helper'

describe PostVote do
  before :all do
    @user = User.new(
      email: "test@rspec.com",
      password: "testPassword1",
      password_confirmation: "testPassword1",
      first_name: "test",
      last_name: "rspec",
      image: File.new('app/assets/images/default_icon.jpg')
    )
    @post = Post.new(
      title: "test title 123",
      user: @user,
      content_md: "test content 123",
      year_created: (1),
      medium: "test medium 123",
      dimension_height: 2,
      dimension_width: 3,
      measurement: 'in',
      weight_in_pounds: 4,
      price: 5,
      quantity: 6,
      image: File.new('app/assets/images/test.png')
    )
    @post_vote = PostVote.new(
      user: @user,
      post: @post
    )
  end

  describe "#new" do
    it "creates a new test PostVote using default values" do
      expect(@post_vote).to be_an_instance_of PostVote
    end
  end

  describe ":user" do
    it "returns the user of the test post_vote" do
      expect(@post_vote["user"]).to be == @user.id
    end
  end

end