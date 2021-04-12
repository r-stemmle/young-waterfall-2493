class Actor < ApplicationRecord
  has_and_belongs_to_many :movies

  validates :name, uniqueness: true

  def self.active
    where(currently_working: true)
  end

  def self.oldest_first
    order(age: :desc)
  end

end
