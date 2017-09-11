class ReceptionDesk < ApplicationRecord
  has_many :found_items
  has_many :lost_items

  validates :name, presence: true
  validates :location, presence: true
end
