class Individual < Client
  validates :firstname, :lastname, presence: true, length: { minimum: 3 }

  before_create -> do
    self.premium = false unless premium
    self.loyalty_points = 0 unless loyalty_points
  end
end
