#例3: より汎用的な例
require 'net/http'
require 'uri'

url = URI.parse('http://www.example.com/index.html')
res = Net::HTTP.start(url.host, url.port) {|http|
  http.get('/index.html')
}
puts res.body
