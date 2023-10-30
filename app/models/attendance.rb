class Attendance < ApplicationRecord
  belongs_to :kid
  belongs_to :parent, optional: true
  belongs_to :employee, optional: true
end
