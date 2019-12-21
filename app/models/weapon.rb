class Weapon < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :power_base, greater_than_or_equal_to: 0, only_integer: true
  validates_numericality_of :power_step, greater_than_or_equal_to: 0, only_integer: true
  validates_numericality_of :level, greater_than_or_equal_to: 1, only_integer: true

  def current_power
    power_base + ((level - 1)*power_step)
  end
end
