class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  has_many :tickets
end
