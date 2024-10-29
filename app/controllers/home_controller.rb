class HomeController < ApplicationController
  require 'faraday'
  def index
    lastmethod = "user.gettopalbums"
    lastuser = "ayreonnaut"
    @response = Faraday.get("http://ws.audioscrobbler.com/2.0/?method=#{lastmethod}&user=#{lastuser}")
    end
end
