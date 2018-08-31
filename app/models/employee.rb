class Employee < ApplicationRecord
  enum marital_status: [:single, :married, :widowed, :divorced, :separated]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :marital_status, presence: true
  validates :sin, presence: true, length: { is: 9 }
  validates :hire_date, presence: true

  validates_date :dob, :before => lambda { 18.years.ago }
  validates_date :hire_date, :on_or_before => lambda { Date.current }

  def sin
    decrypt_sin
  end

  def sin=(value)
    encrypt_sin(value)
  end

  private

  def encrypt_sin(value)
    return write_attribute(:encrypted_sin, nil) if value == nil

    encrypted_data = ActiveSupport::MessageEncryptor
      .new(encryption_key)
      .encrypt_and_sign(value)

    write_attribute(:encrypted_sin, encrypted_data)
  end

  def decrypt_sin
    return nil if read_attribute(:encrypted_sin) == nil

    ActiveSupport::MessageEncryptor
      .new(encryption_key)
      .decrypt_and_verify(read_attribute(:encrypted_sin))
  end

  # @TODO Store in ENV
  def encryption_key
    "632E4D882C3CFBDP9CCA2CCB1A81EB3F"
  end
end
