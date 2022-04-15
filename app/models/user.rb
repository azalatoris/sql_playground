class User < ApplicationRecord
  has_many :sales
  has_many :tickets
end
