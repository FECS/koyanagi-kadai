#"require" is refer to the directory where Ruby is working
#(that is Working Directory in Eclipse).
require "module-test/HelloModule.rb"

str="foo"
 
def str.sayHello
  HelloModule.sayHello self
end

str.sayHello

class String
  include HelloModule
  def helloInclude
    sayHello "include-man"
  end
end

"bar".helloInclude()