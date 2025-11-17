require 'jwt'

class JwtServices
  ALGORITHM = 'HS256'
  SECRET = Rails.application.credentials.jwt_secret

  def self.encode(payload, exp = 1.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET, ALGORITHM)
  end

  def self.decode(token)
    begin
      decoded = JWT.decode(token, SECRET, true, { algorithm: ALGORITHM })
      puts "decoded token: #{decoded}"
      return decoded[0]
    rescue JWT::ExpiredSignature => e
      return { json: { error: e.message }, status: :unauthorized }
    rescue JWT::VerificationError, JWT::DecodeError => e
      return { json: { error: e.message }, status: :unauthorized }
    end
  end
end

