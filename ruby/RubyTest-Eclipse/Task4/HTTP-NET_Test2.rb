#例2: URI を使う
require 'net/http'
require 'uri'

Net::HTTP.get_print URI.parse('http://www.example.com/index.html')
