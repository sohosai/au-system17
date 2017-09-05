class FoundItem < ApplicationRecord
  belongs_to :reception_desk
  validates :resolver_id, presence: true
  validates :reception_desk_id, presence: true
  validates :receptionist_id, presence: true
  validates :name, presence: true
  validates :kind, presence: true
  validates :location_found, presence: true
  validates :characteristic, presence: true
  validates :finder_name, presence: true
  validates :finder_contact, presence: true
  enum kind: {
      other: 0,
      key: 1,
      wallet: 2,
      mobile_phone: 3,
      cloth_product: 4,
      card: 5,
      cash: 6,
      card_case: 7,
      keychain: 8,
      strap: 9,
      umbrella: 10
  }
end
