class User < ActiveRecord::Base
    has_many :statuses, :dependent => :destroy
    has_many :likes, :dependent => :destroy

    validates :email, presence: true, uniqueness: true
    validate :valid_email
    validates :name, presence: true
    validates :password, presence: true, length: { in: 6..20 }
    validates_confirmation_of :password
    validates :password_confirmation, presence: true

    has_secure_password


    def valid_email
		if (self.email =~ /\w+@\w+\.\w{2,}/).nil?
			self.errors.add(:email, "invalid email")
		end
	end
end
