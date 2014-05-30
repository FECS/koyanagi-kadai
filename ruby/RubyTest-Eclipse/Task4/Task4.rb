require 'net/http'
require 'uri'

class Hello
  def sayHallo
    p "Hello World!"
  end

  def showGoogle
    Net::HTTP.get_print getHtml('http://google.co.jp')
  end
  private

  def getHtml html
    URI.parse html
  end
end

h=Hello::new
h::sayHallo
h.showGoogle()
