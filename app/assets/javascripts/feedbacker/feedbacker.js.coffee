Feedback = toggle_form: ->
  $('#compressed_feedback_form_tab').toggle()
  $('#expanded_feedback_form').toggle()
  return

ready = ->
  $('a.toggle_feedback').click ->
    Feedback.toggle_form()
    false
  return

$(document).ready ready
$(document).on 'page:load', ready