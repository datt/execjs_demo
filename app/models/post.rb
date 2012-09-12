require "open-uri"
class Post < ActiveRecord::Base
  attr_accessible :content
  validate :validate_contents

  def validate_contents
    source = File.read(Rails.root.join("app/assets/javascripts/validations.js"))
    context = ExecJS.compile(source)
    #logger.info "content params #{params[:content]}"
    unless context.call("validate_content_length",content)
      errors.add :content,"greater than max"
    end
  end


  def coffee_demo
    @flag=1
    logger.info "***************************************************************************befor condition #{@flag}"
   #context = V8::Context.new
    if @flag==1
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

      source = File.read(Rails.root.join("app/assets/javascripts/coffee-script.js"))

      context = ExecJS.compile(source)
      c = context.call("CoffeeScript.compile",coffe , :bare => true)
      @flag=2
     logger.info "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%inside condition #{@flag}"
    end
   unless context.call(c,content)
      errors.add :content,"greater than max"
   end
  end
end
