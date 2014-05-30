# coding: utf-8
require 'net/http'
require 'uri'

class Hello
  GOOGLE_URL="http://www.example.com/index.html"
  ANIMEMAP_URL="http://animemap.net/api/table/tokyo.json"
  def sayHallo
    puts "Hello World!"
  end

  def decord str
    #JSONのインストールに失敗したので諦めて¥uを変換　すげえ時間かかった
    str.gsub(/\\u([\da-fA-F]{4})/) {
      [$1].pack('H*').unpack('n*').pack('U*') }
  end

  def getData anime_title
  end

  def initialize
    @database=Hash.new()
    json = getJSONinString()
    #JSONのインストールに失敗したので諦めてitem要素だけを抽出
    arr =json.scan(%r<\"title.*?\"\}>)
    arr.each do |val|
      val.chop!
      val.gsub!('"',"")
      #      val.gsub!('\\',"\\")
      puts "▼▼▼▼▼▼▼▼▼▼▼"
      hash = Hash.new()
      val.split(",").each{|str|
        puts str
        arr = str.split(":")
        decorded=""
        arr.size.times{|count|
          next if count==0
          decorded<<":" unless count==1
          decorded<<arr[count]
        }
        puts decorded
        decorded=decord(decorded)
        puts decorded
        hash[arr[0]]=decorded
      }
      puts "▲▲▲▲▲▲▲▲▲"
      @database[hash["title"]]=hash
      #      puts "#{val}\n"
    end
    puts @database
    waitForPutTitle
  end

  def waitForPutTitle
    puts "▼▼▼▼▼▼▼▼▼"
    puts "***im ready***"
    puts "▲▲▲▲▲▲▲▲▲"
    puts "◆ what u wanna view? input the title in Japanese! (ls:list)"
    command=gets.to_s()
    puts    command.chop!()
    if command == "ls"
      @database.each_key{|key|
        puts key
      }
      waitForPutTitle
    else
      findHash command
    end
  end

  def findHash title
    if data=@database[title]
      puts "▼▼▼▼▼▼▼▼▼"
      puts "***here's data***"
      puts "▲▲▲▲▲▲▲▲▲"
      puts data
      puts "▼▼▼▼▼▼▼▼▼"
      puts "***thanks***"
      puts "▲▲▲▲▲▲▲▲▲"
    else
      puts "▼▼▼▼▼▼▼▼▼"
      puts "*NO-DATA-IS*"
      puts "▲▲▲▲▲▲▲▲▲"
      waitForPutTitle
    end
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
