class Provider < ActiveRecord::Base
  validates :name, :contact_name, :phone, :address, presence: true
  has_many :ingredient, dependent: :restrict_with_error
end
