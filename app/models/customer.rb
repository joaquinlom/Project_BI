class Customer < ActiveRecord::Base
  has_many :orders
  validates_uniqueness_of :customer_id
end
