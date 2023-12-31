class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :notes, dependent: :destroy
         has_many :kids, dependent: :destroy
         def full_name
           "#{last_name} #{first_name}"
         end
end
