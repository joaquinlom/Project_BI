class Customer < ActiveRecord::Base
  has_many :orders 
  validates_uniqueness_of :customer_id
  
  def fullname
    "#{first_name} #{last_name}"
  end
end
