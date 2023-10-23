class Note < ApplicationRecord
  belongs_to :parent
  belongs_to :kid
  belongs_to :employee
end
