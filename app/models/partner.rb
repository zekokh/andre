class Partner < ActiveRecord::Base
  validates :name, :contact_name, :phone, :address, presence: true
end
