# coding: utf-8
require 'net/http'
require 'uri'

class Hello
  GOOGLE_URL="http://www.example.com/index.html"
  ANIMEMAP_URL="http://animemap.net/api/table/tokyo.json"
  def sayHallo
    p "Hello World!"
  end

  def initialize
    puts "\u6587"
    p "\6587"
    print "?u6587"
    puts "?05db"
    t="?u661f"
    puts t
    puts t.inspect
    puts t.dump
    u="\346\230\237"
    puts u
    #    s="\\u661f\\u523b\\u306e\\u7adc\\u9a0e\u58eb(\\u30c9\\u30e9\\u30b0\\u30ca\\u30fc)"
    #    puts s
    #    puts s.inspect()
    #    s.gsub!("\\\\\\","\\")
    #    puts s
    #    puts s.inspect()
  end

  def aa
    @database=Hash.new()
    json = getJSONinString()
    #JSONのインストールに失敗したので諦めてitem要素だけを抽出
    arr =json.scan(%r<\"title.*?\"\}>)
    arr.each do |val|
      val.chop!
      val.gsub!('"',"")
      val.gsub!('\\',"\\")
      p "■"
      hash = Hash.new()
      val.split(",").each{|str|
        p str
        arr = str.split(":")
        hash[arr[0]]=arr[1]
      }
      p "■"
      @database[hash["title"]]=hash
      #      puts "#{val}\n"
    end
    p @database
  end

  def getJSONinString html=ANIMEMAP_URL
    uri = getHtml html
    json = Net::HTTP.get(uri)
    #    json.split(/\{.+\}/)
  end

  def printArray array
    array.each do |val|
      puts "#{val}\n"
    end
  end

  def showGoogle
    showHtml(GOOGLE_URL)
  end

  def showAnimeMap
    showHtml(ANIMEMAP_URL)
  end
  private

  def showHtml html
    Net::HTTP.get_print getHtml(html)
  end

  def getHtml html
    URI.parse html
  end
end

h=Hello::new
h::sayHallo
