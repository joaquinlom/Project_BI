class Item < ActiveRecord::Base
  has_many :order_details
  validates_presence_of :item_id
end
