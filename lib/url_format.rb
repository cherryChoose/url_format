require "url_format/version"
require "url_format/model_additions"
require 'url_format/railtie'
module UrlFormat
  def self.format_url(url)
    if url.to_s !~ url_regexp && "http://#{url}" =~ url_regexp
      "http://#{url}"
    else
      url
    end
  end

   # i :模式中的字符将同时匹配大小写字母. x: 空白忽略.
  def self.url_regexp
    /^https?:\/\/([^\s:@]+:[^\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?$/iux
  end
end
