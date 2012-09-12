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
    logger.info "***************************************************************************before condition #{@flag}"
   #context = V8::Context.new
    if @flag==1
      coffe = File.read(Rails.root.join("app/assets/javascripts/posts.js.coffee"))
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
