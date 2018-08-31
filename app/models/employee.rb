class Employee < ApplicationRecord
  attr_encrypted :sin, key: :encryption_key
  enum marital_status: [:single, :married, :widowed, :divorced, :separated]

  def encryption_key
    "632E4D882C3CFBDP9CCA2CCB1A81EB3F"
  end
end
