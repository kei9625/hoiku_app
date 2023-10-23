class Attendance < ApplicationRecord
  belongs_to :kid
  belongs_to :parent
  belongs_to :employee
end
