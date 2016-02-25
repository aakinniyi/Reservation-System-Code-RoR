class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  
  has_many :reservations
  has_many :extra_reservations

  # enum role: [:user, :admin]
  # after_initialize :set_default_role, :if => :new_record?
  #
  # def set_default_role
  #   self.role ||= :user
  # end
        
end
