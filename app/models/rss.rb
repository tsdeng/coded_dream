require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'
class Rss < ActiveRecord::Base
  def rss_content
    content=""
    open(address) do |s|
      content=s.read
    end
    rss=RSS::Parser.parse(content,false)
   return rss

  end
end
