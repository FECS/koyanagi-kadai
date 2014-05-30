require 'net/http'

class Net::HTTP
  alias :create :initialize

  def initialize(*args)
    create(*args)
    self.set_debug_output STDOUT
  end
end

http = Net::HTTP.new("www.google.co.jp", 80)
p http.get("/").cod