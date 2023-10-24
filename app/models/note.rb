class Note < ApplicationRecord
  belongs_to :parent, optional: true
  belongs_to :kid, optional: true #Kidが完成したらoptional: trueを外す
  belongs_to :employee, optional: true
end
