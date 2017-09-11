class ReceptionDesk < ApplicationRecord
  has_many :found_items, dependent: :destroy
  has_many :lost_items, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
end
