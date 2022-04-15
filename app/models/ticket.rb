class Ticket < ApplicationRecord
  belongs_to :sale
  belongs_to :seat
  belongs_to :passenger, class_name: 'User', foreign_key: :user_id
end
