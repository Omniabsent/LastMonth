class HomeController < ApplicationController
    require 'faraday'
    def index
        lastmethod = "user.getWeeklyAlbumChart"
        lastuser = "ayreonnaut"
        api_key = " "
        from = "1704078000" #unix time
        to = "1706756400"  #unix time
        @response_albums = Faraday.get("http://ws.audioscrobbler.com/2.0/?method=#{lastmethod}&user=#{lastuser}&api_key=#{api_key}&from=#{from}&to=#{to}&format=json")
        hash = JSON.parse @response_albums.env.response_body
        @selected_images = []
        for i in 0..24 do
            album_title = hash["weeklyalbumchart"]["album"][i]["name"]
            album_artist = hash["weeklyalbumchart"]["album"][i]["artist"]["#text"]
            get_images(album_artist, album_title, lastuser, api_key)
        end
    end

    def get_images(album_artist, album_title, lastuser, api_key)
        query = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&user=#{lastuser}&api_key=#{api_key}&artist=#{CGI.escape(album_artist)}&album=#{CGI.escape(album_title)}&format=json"
        @response_images = Faraday.get(query)
        hash = JSON.parse @response_images.env.response_body
        @selected_images << hash["album"]["image"][3]["#text"]
    end
end