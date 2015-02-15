class Review < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  belongs_to :product
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :body, :product_id, :user_id, presence: true

  delegate :profile, :full_name, to: :author
end
