require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it 'null name should be invalid' do
    weapon = build(:weapon, name: nil)

    expect(weapon).to be_invalid
  end

  it 'negative power base is invalid' do
    weapon = build(:weapon, power_base: rand(-100..-1))

    expect(weapon).to be_invalid
  end

  it 'null power base is invalid' do
    weapon = build(:weapon, power_base: nil)

    expect(weapon).to be_invalid
  end
  
  it 'negative power step is invalid' do
    weapon = build(:weapon, power_step: rand(-100..-1))

    expect(weapon).to be_invalid
  end

  it 'null power step is invalid' do
    weapon = build(:weapon, power_step: nil)

    expect(weapon).to be_invalid
  end
  
  it 'negative level is invalid' do
    weapon = build(:weapon, level: rand(-100..-1))

    expect(weapon).to be_invalid
  end

  it 'null level is invalid' do
    weapon = build(:weapon, level: nil)

    expect(weapon).to be_invalid
  end

  it 'zero level is invalid' do
    weapon = build(:weapon, level: 0)

    expect(weapon).to be_invalid
  end

  it 'returns current power correctly' do
    weapon = build(:weapon)
    current_power = weapon.power_base + ((weapon.level - 1)*weapon.power_step)

    expect(weapon.current_power).to eq(current_power)
  end
end
