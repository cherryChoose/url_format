# encoding: utf-8
require 'spec_helper'

describe UrlFormat do
  describe ".format_url" do
    it "adds http:// to a URL if not provided" do
      UrlFormat.format_url("example.com").should eq("http://example.com")
    end

    it "does not add http:// to a URL if already provided" do
      UrlFormat.format_url("http://example.com").should eq("http://example.com")
    end

    it "returns an invalid URL unchanged" do
      UrlFormat.format_url("foo bar").should eq("foo bar")
      UrlFormat.format_url(nil).should eq(nil)
    end
  end

  describe ".url_regexp" do
    it "matches valid URLs" do
      [
        'http://example.com/',
        'HTTP://E-XAMLE.COM',
        'https://example.co.uk./foo',
        'http://example.com:8080',
        'http://www.example.com/anything/after?slash',
        'http://www.example.com?anything_after=question',
        'http://user123:sEcr3t@example.com',
        'http://user123:@example.com',
        'http://example.com/~user',
        'http://1.2.3.4:8080',
        'http://ütf8.com',
      ].each do |url|
        url.should match(UrlFormat.url_regexp)
      end
    end

    it "does not match invalid URLs" do
      [
        "www.example.com",
        "http://",
        "http://example..com",
        "http://e xample.com",
        "http://example.com/foo bar",
        "http://example",
        "other://example.com",
      ].each do |url|
        url.should_not match(UrlFormat.url_regexp)
      end
    end
  end
end
