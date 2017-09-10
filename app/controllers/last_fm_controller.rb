class LastFmController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    # @artists = search(params[:q])
  end

  def search
    puts params[:q]
    puts "Pupu"
    @artists = api('/2.0/?method=artist.search&artist='+params[:q]+'&api_key=1ca2cf614eeaa185c2b61753b434b599&format=json&limit=5')    
  end

  def api(req_url)
    base = 'http://ws.audioscrobbler.com'
    url = URI.parse(base + req_url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    return JSON.parse(res.body)['results']['artistmatches']['artist']
  end
end
