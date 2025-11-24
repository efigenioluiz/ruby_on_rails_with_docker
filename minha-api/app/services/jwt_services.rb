require 'jwt'

class JwtServices
  ALGORITHM = 'HS256'
  SECRET = Rails.application.credentials.jwt_secret

  def self.encode(payload, exp = 1.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET, ALGORITHM)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET, true, { algorithm: ALGORITHM })
    decoded[0]
  rescue JWT::ExpiredSignature => e
    Rails.logger.info "AUTH ERROR: #{e.class} - #{e.message}"
    raise e
  rescue JWT::VerificationError, JWT::DecodeError => e
    Rails.logger.info "AUTH ERROR: #{e.class} - #{e.message}"
    raise e
  end
end

