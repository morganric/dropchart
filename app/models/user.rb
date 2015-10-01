class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create :create_profile

  def set_default_role
    self.role ||= :user
  end

  def create_profile
    @profile = Profile.new(:user_id => id)
    @profile.save
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :drops
   has_one :profile

   # validates_presence_of :name
end
