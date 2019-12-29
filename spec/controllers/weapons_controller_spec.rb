require 'rails_helper'

RSpec.describe WeaponsController, type: :controller do
  describe 'GET :index' do
    it 'returns success' do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it 'returns n existing weapons' do
      num_weapons = rand(1..10)
      create_list(:weapon, num_weapons)

      get :index
      response_body = json_body

      expect(response_body.length).to eq(num_weapons)
    end
  end

  describe 'POST :create' do
    let(:weapon_attributes) { attributes_for(:weapon) }

    it 'returns success' do
      post :create, params: {
        weapon: weapon_attributes
      }

      expect(response).to have_http_status(:created)
    end

    it 'creates new weapon' do
      expect {
        post :create, params: {
          weapon: weapon_attributes
        }
      }.to change(Weapon, :count).from(0).to(1)
    end

    it 'returns errors if weapon is invalid' do
      weapon_attributes[:name] = nil

      post :create, params: {
        weapon: weapon_attributes
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE :destroy' do
    let!(:weapon) { create(:weapon) }

    it 'returns success' do
      delete :destroy, params: { id: weapon.id }

      expect(response).to have_http_status(:ok)
    end

    it 'deletes an existing weapon' do
      expect {
        delete :destroy, params: { id: weapon.id }
      }.to change(Weapon, :count).from(1).to(0)
    end

    it 'deletes the requested weapon' do
      create_list(:weapon, 5)

      delete :destroy, params: { id: weapon.id }

      expect {
        Weapon.find(weapon.id)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns 404 if weapon was not found' do
      delete :destroy, params: { id: 0 }

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :show' do
    let(:weapon) { create(:weapon) }

    it 'returns success' do
      get :show, params: { id: weapon.id }

      expect(response).to have_http_status(:ok)
    end

    it 'includes weapon name' do
      get :show, params: { id: weapon.id }

      expect(response.body).to include(weapon.name)
    end

    it 'returns 404 if weapon was not found' do
      get :show, params: { id: 0 }

      expect(response).to have_http_status(:not_found)
    end
  end
end
