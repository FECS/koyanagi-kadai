require 'net/http'
require 'uri'

class Hello
  def sayHallo
    p "Hello World!"
  end

  def showGoogle
    showHtml('http://www.example.com/index.html')
  end

  def showAnimeMap
    showHtml("http://animemap.net/api/table/tokyo.json")
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
h.showAnimeMap()
