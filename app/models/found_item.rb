class FoundItem < ApplicationRecord
  before_save :set_resolved_at
  belongs_to :reception_desk
  validates :reception_desk_id, presence: true
  validates :receptionist_id, presence: true
  validates :kind, presence: true
  validates :location_found, presence: true
  validates :characteristic, presence: true
  validates :status, inclusion: { in: [true, false] }
  validate :check_resolver_id
  enum kind: {
    other: 0,
    key: 1,
    wallet: 2,
    mobile_phone: 3,
    electronic_device: 4,
    clothes: 5,
    card: 6,
    cash: 7,
    card_case: 8,
    keychain: 9,
    umbrella: 10,
    glasses: 11,
  }

  def set_resolved_at
    self.resolved_at = if status
                         Time.now.utc
                       else
                         ""
                       end
  end

  def check_resolver_id
    if self.status && !self.resolver_id
      errors.add(:resolver_id, "を入力してください")
    end
  end
end
