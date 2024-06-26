class Note < ApplicationRecord
  belongs_to :parent, optional: true
  belongs_to :kid, optional: true #Kidが完成したらoptional: trueを外す
  belongs_to :employee, optional: true

  validates :title, presence: true
  validates :content, presence: true

  def creator
    parent || employee
  end
end
