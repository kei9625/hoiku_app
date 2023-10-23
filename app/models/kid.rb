class Kid < ApplicationRecord
  belongs_to :parent
  has_many :notes
  has_many :attendances
end
