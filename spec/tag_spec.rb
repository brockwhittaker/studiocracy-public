require 'spec_helper'

describe Post do
  before :all do
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
    @tag = Tag.new(
      post: @post
    )
  end

  describe "#new" do
    it "creates a new test Tag using default values" do
      expect(@tag).to be_an_instance_of Tag
    end
  end

  describe ":post" do
    it "returns the post of the test tag" do
      expect(@tag["post"]).to be == @post.id
    end
  end
end