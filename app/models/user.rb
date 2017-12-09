class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key

  # This method is not available in has_secure_token
  def invalidate_api_key
    self.update_columns(api_key: nil)
  end

  def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end

end
