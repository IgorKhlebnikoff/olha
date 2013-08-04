@Reviews = ->

Reviews.productReviews = ->
  url = $('#comments').data('url')
  sendRequest(url, 'get')
