#例1: GET して 表示するだけ
require 'net/http'
Net::HTTP.get_print 'www.example.com', '/index.html'
