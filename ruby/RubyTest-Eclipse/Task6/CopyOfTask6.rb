require 'net/http'
require 'uri'

class Hello
  GOOGLE_URL='http://www.example.com/index.html'
  ANIMEMAP_URL="http://animemap.net/api/table/tokyo.json"
  def sayHallo
    p "Hello World!"
  end

  def task6
    json = getJSONinString()
    arrX=to_aX(json)
    arrX.each do |val|
      print val.class.to_s + " : "
      puts "#{val}\n"
    end
  end
  def to_aX str
    regex = /(?<=(\{.*?))(\},)/
    #arr=
    p regex=~str
    p $&
    str.split(regex)
  end
  def to_array2 array, regex
    return array
    array.length.times do |num|
      str=array[num]
      if regex=~str
        obj=str.split(regex)
      else
        obj=str
      end
      array[num]=obj
    end
    return array
  end

  def to_array str
    regex = /[¥{.+¥}]/
    arr=str.split(regex)
    return arr
    return to_array2(arr,regex)
  end

  def getJSONinString html=ANIMEMAP_URL
    uri = getHtml html
    json = Net::HTTP.get(uri)
    #    json.split(/¥{.+¥}/)
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
h.task6
