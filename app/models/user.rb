# Un User peut avoir plusieurs réservations et il peut avoir plusieurs events au travers des réservations
class User < ApplicationRecord
   #Include default devise modules. Others available are:
   #:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  after_create :welcome_send
  has_many :attendances
  has_many :events, through: :attendances
  has_many :created_event, foreign_key:'admin_id', class_name: 'User'

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
