@Reviews = ->

Reviews.productReviews = ->
  url = $('#comments').data('url')
  sendRequest(url, 'get')

$('body').on 'click', '#tabs a', (e) ->
  e.preventDefault()
  $(this).tab 'show'
