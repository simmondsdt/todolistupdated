class Item < ApplicationRecord
  belongs_to :list
  # validates :urgency, numericality: true, length: {is < 3 }, message: "%{value} is not a valid number"
  # validates :complete, allow_blank: true,
end
