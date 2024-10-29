class HomeController < ApplicationController
    require 'faraday'
    def index
        lastmethod = "user.gettopalbums"
        lastuser = "ayreonnaut"
        api_key = " "
        period = "1month"
        @response = Faraday.get("http://ws.audioscrobbler.com/2.0/?method=#{lastmethod}&user=#{lastuser}&period=#{period}&api_key=#{api_key}&format=json")
    end
end
