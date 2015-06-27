class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_one :user_detail
  has_many :doctor_visits
  has_many :health_records
  has_many :family_members
  
  
  mount_uploader :image, ImageUploader

end
