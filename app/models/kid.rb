class Kid < ApplicationRecord
  belongs_to :parent
  has_many :notes
  has_many :attendances

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true

end
