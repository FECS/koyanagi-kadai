module HelloModule
  def sayHello who="HelloModule"
    p "I'm "+who+"! Hello World!!"
  end
  module_function :sayHello
end
