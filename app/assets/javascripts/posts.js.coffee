validate_content_length = (content) ->
  if content.length > 100
    false
  else
    true