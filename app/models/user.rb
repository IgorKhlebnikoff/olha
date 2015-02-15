class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_one :bag, dependent: :destroy

  has_many :wishes, through: :wish_lists, source: :wish
  has_many :wish_lists
  has_many :orders
  has_many :authentications, dependent: :destroy
  has_many :left_reviews, class_name: 'Review', foreign_key: 'user_id'

  belongs_to :role

  ajaxful_rater

  delegate :first_name, :last_name, :phone_number, :gender, :full_name, to: :profile

  after_create :create_profile

  def is_admin?
    role_id == Role.find_by_name('admin').id
  end

  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    authentications.build(provider: omniauth['provider'], uid: omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  private

  def create_profile
    profile = Profile.new(user_id: id)
    profile.save(validate: false)
  end
end
