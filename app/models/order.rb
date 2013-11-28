class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_details
  validates_uniqueness_of :order_id
end
