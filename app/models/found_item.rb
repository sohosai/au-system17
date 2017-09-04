class FoundItem < ApplicationRecord
  validates :resolver_id, presence: true
  validates :reception_desk_id, presence: true
  validates :receptionist_id, presence: true
  validates :name, presence: true
  validates :kind, presence: true
  validates :location_found, presence: true
  validates :characteristic, presence: true
  validates :finder_name, presence: true
  validates :finder_contact, presence: true
end
