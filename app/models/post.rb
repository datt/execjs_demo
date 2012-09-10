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
end
