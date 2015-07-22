class Provider < ActiveRecord::Base
  validates :name, :contact_name, :phone, :address, :comments, presence: true
end
