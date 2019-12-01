class JsonWebToken
	Payload = Struct.new(:user_id, :exp)

  def self.encode(payload)
		expiration = { exp: (Time.now.to_i + 86400) }
		payload_with_expiration = expiration.merge(payload)

		JWT.encode(payload_with_expiration, Rails.application.credentials.secret_key_base)
	end

	def self.decode(token)
		return Payload.new(
			JWT.decode(token, Rails.application.credentials.secret_key_base)[0])
	rescue
		nil
	end
end