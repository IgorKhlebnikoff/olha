$(function() {
  $(document).on('click', "#categories_list a[data-method='delete']", function() {
    addWall('#categories_list');
  });

  $(document).on('submit', 'form#new_category', function() {
    addWall('#categories_list');
  })

  $(document).on('click', "#assortments_list a[data-method='delete']", function() {
    addWall('#assortments_list');
  });

  $(document).on('submit', 'form#new_assortment', function() {
    addWall('#assortments_list');
  })

  $(document).on('click', "#products_list a[data-method='delete']", function() {
    addWall('#products_list');
  });

  $(document).on('submit', 'form#new_product', function() {
    addWall('#products_list');
  })

});
