# encoding: utf-8
require 'spec_helper'

class Comment < SuperModel::Base
  include ActiveModel::Validations::Callbacks
  extend UrlFormat::ModelAdditions
  format_url :website
end	
describe UrlFormat::ModelAdditions do
  it "adds http:// to URL upon saving" do
    Comment.create!(website: "example.com").website.should eq("http://example.com")
    Comment.create!(website: "http://example.com").website.should eq("http://example.com")
  end

  it "validates URL format" do
    comment = Comment.new(website: "foo bar")
    comment.should_not be_valid
    comment.errors[:website].should eq(["is not a valid URL"])
    comment.website = "example.com"
    comment.should be_valid
  end
end
