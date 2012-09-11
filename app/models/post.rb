require "open-uri"
class Post < ActiveRecord::Base
  attr_accessible :content
  validate :coffee_demo

  def validate_contents
    source = File.read(Rails.root.join("app/assets/javascripts/validations.js"))
    context = ExecJS.compile(source)
    #logger.info "content params #{params[:content]}"
    unless context.call("validate_content_length",content)
      errors.add :content,"greater than max"
    end
  end


  def coffee_demo
   #context = V8::Context.new
   coffe = File.read(Rails.root.join("app/assets/javascripts/posts.js.coffee"))
   ##js = CoffeeScript.compile(coffe)
   #context.call("CoffeeScript.compile", coffe, :bare => true)
   ##context = ExecJS.eval(js)
   ## source = open("http://jashkenas.github.com/coffee-script/extras/coffee-script.js").read
   ##context = ExecJS.compile(source)
   ##context.call("CoffeeScript.compile", "square = (x) -> x * x", :bare => true)
   #
   ##context = ExecJS.eval(js)
   ##context.call("validate_content_length",content)

    source = open("http://jashkenas.github.com/coffee-script/extras/coffee-script.js").read

    context = ExecJS.compile(source)
    c = context.call("CoffeeScript.compile",coffe , :bare => true)
   unless context.call(c,content)
      errors.add :content,"greater than max"
   end
  end
end
