class User < ApplicationRecord
    validates :email,
        :presence => {message: "can't be blank"},
        :uniqueness => true
    validates :name,
        :presence => {message: "can't be blank"}
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: "is not formatted correctly"
    
    before_create :set_api_key

    private

    def set_api_key
        self.api_key = generate_key
    end

    def generate_key
        loop do
            key = SecureRandom.hex(27)
            break key unless User.where(api_key: key).exists?
        end
    end
end
