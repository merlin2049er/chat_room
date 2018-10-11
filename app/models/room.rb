class Room < ApplicationRecord
  has_many :messages
  validates :name, presence: true
  validates :subject, presence: true

  def self.search(search_term)
    if Rails.env.production?
      Room.where("name ilike ?", "%#{search_term}%")
    else
      Room.where("name LIKE ?", "%#{search_term}%")
    end
  end

end
