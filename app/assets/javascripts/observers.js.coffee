$ ->
  $(document).on 'click', "#categories_list a[data-method='delete']", ->
    addWall '#categories_list'

  $(document).on 'submit', 'form#new_category', ->
    addWall '#categories_list'

  $(document).on'click', "#assortments_list a[data-method='delete']", ->
    addWall '#assortments_list'

  $(document).on 'submit', 'form#new_assortment', ->
    addWall '#assortments_list'

  $(document).on 'click', "#products_list a[data-method='delete']", ->
    addWall "#products_list"

  $(document).on 'submit', 'form#new_product', ->
    addWall '#products_list'
