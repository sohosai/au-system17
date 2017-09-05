class FoundItem < ApplicationRecord
  before_save :set_resolved_at
  belongs_to :reception_desk
  validates :reception_desk_id, presence: true
  validates :receptionist_id, presence: true
  validates :name, presence: true
  validates :kind, presence: true
  validates :location_found, presence: true
  validates :characteristic, presence: true
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

  def set_resolved_at
    if self.status
      self.resolved_at = Time.now
    else
      self.resolved_at = ''
    end
  end
end
