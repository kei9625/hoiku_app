class Attendance < ApplicationRecord
  belongs_to :kid
  belongs_to :parent, optional: true
  belongs_to :employee, optional: true

  def formatted_drop_off
    self.drop_off.strftime("%Y/%m/%d %H:%M") if self.drop_off.present?
  end

  def formatted_pick_up
    self.pick_up.strftime("%Y/%m/%d %H:%M") if self.pick_up.present?
  end

end
