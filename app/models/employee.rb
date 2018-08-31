class Employee < ApplicationRecord
  enum marital_status: [:single, :married, :widowed, :divorced, :separated]

  def sin
    decrypt_sin
  end
  
  def sin=(value)
    encrypt_sin(value)
  end
  
  private
  
  def encrypt_sin(value)
    encrypted_data = ActiveSupport::MessageEncryptor
      .new(encryption_key)
      .encrypt_and_sign(value)
      
    write_attribute(:encrypted_sin, encrypted_data)
  end
  
  def decrypt_sin
    ActiveSupport::MessageEncryptor
      .new(encryption_key)
      .decrypt_and_verify(read_attribute(:encrypted_sin))
  end

  # @TODO Store in ENV
  def encryption_key
    "632E4D882C3CFBDP9CCA2CCB1A81EB3F"
  end
end
