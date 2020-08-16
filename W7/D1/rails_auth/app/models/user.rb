class User < ApplicationRecord
    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: {message: "Password can't be blank"}, length: {minimum: 6}, allow_nil: true

    attr_reader :password

    def self.find_by_credentials(username, password)
        User.find_by(username: username, password_digest: BCrypt.Password.create(password))
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
    end

    def ensure_session_token
        if !self.session_token
            self.reset_session_token!
        end
    end

    def password=(argument)
        @password = argument
        self.password_digest = BCrypt.Password.create(@password)
    end

end
