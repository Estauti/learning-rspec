require 'rails_helper'

RSpec.describe Weapon, type: :model do
  describe 'is valid' do
    it 'with required attributes' do
      weapon = build(:weapon)
  
      expect(weapon).to be_valid
    end
  end

  describe 'is invalid' do
    context 'when name' do
      it 'is null' do
        weapon = build(:weapon, name: nil)
    
        expect(weapon).to be_invalid
      end
    end

    context 'when power base' do
      it 'is negative' do
        weapon = build(:weapon, power_base: rand(-100..-1))
    
        expect(weapon).to be_invalid
      end
    
      it 'is null' do
        weapon = build(:weapon, power_base: nil)
    
        expect(weapon).to be_invalid
      end
    end
    
    context 'when power step' do
      it 'is negative' do
        weapon = build(:weapon, power_step: rand(-100..-1))
    
        expect(weapon).to be_invalid
      end
    
      it 'is null' do
        weapon = build(:weapon, power_step: nil)
    
        expect(weapon).to be_invalid
      end
    end
    
    context 'when level' do
      it 'is negative' do
        weapon = build(:weapon, level: rand(-100..-1))
    
        expect(weapon).to be_invalid
      end
    
      it 'is null' do
        weapon = build(:weapon, level: nil)
    
        expect(weapon).to be_invalid
      end
    
      it 'is zero' do
        weapon = build(:weapon, level: 0)
    
        expect(weapon).to be_invalid
      end
    end
  end

  describe 'current power' do
    it 'returns correctly' do
      weapon = build(:weapon)
      current_power = weapon.power_base + ((weapon.level - 1)*weapon.power_step)
  
      expect(weapon.current_power).to eq(current_power)
    end
  end

  describe 'title' do
    it 'returns correctly' do
      weapon = build(:weapon)
      title = "#{weapon.name} ##{weapon.level}"
  
      expect(weapon.title).to eq(title)
    end
  end
end
