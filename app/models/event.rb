# Ici je vais m'occuper de toutes mes validations ainsi que des liens entre les BDD.
# Un event peut avoir plusieurs réservations et un event peut avoir plusieurs users au travers des réservations
class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User'
  validates :start_date, presence: true
  validate :start_date_in_future
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :duration_multiple_of_5
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :price, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :location, presence: true

  # Cette def sera appellée au travers du validates "start_date"
  def start_date_in_future
    if !start_date.nil? && (Time.now > start_date)
      errors.add(:start_date, "ERREUR : la date de commencement de l'event ne peut être dans le passé")
    end
  end

  # Cette def sera appellée au travers du validates "duration"
  def duration_multiple_of_5
    errors.add(:duration, 'ERREUR : la durée doit être un multiple de 5') if !duration.nil? && (duration % 5 != 0)
  end


  def find_author_name
    author_id = self.admin_id.to_i
    author_array = []
    author_array << User.find_by(id: author_id)
    author_name = author_array[0].first_name
    return author_name
  end

end
