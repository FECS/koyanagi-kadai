#例4: 上の例よりさらに汎用的な例
require 'net/http'

url = URI.parse('http://www.example.com/index.html')
req = Net::HTTP::Get.new(url.path)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body