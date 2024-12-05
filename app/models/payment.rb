class Payment < ApplicationRecord

  def initialize(first_name, last_name, address, credit_card_num, cvv)
    @first_name = first_name
    @last_name = last_name
    @address = address 
    @credit_card_num = credit_card_num
    @cvv = cvv
  end
  
  validates_presence_of    :identifier,
                           :first_name,
                           :last_name,
                           :address,
                           :credit_card_num,
                           :cvv
  validates_uniqueness_of  :identifier, :credit_card_num
  
  belongs_to :User, :Rental
  
  def get_payment_amt
    payment_amt = @ride.price
    payment_amt
  end
end