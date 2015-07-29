require 'rails_helper'
require 'pry'

describe PoptartsController do
  context '#index' do
    it 'return all the poptarts' do
      Poptart.create(flavor: 'strawberry', sprinkles: 'red')
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      poptarts = JSON.parse(response.body)
      expect(poptarts.count).to eq(1)
      poptart = poptarts.last
      expect(poptart['flavor']).to eq('strawberry')
      expect(poptart['sprinkles']).to eq('red')
    end
  end

  context '#show' do
    it 'returns a single poptart' do
      smore = Poptart.create(flavor: 'smore', sprinkles: 'none')
      # chocolate = Poptart.create(flavor: 'chocolate', sprinkles: 'brown')

      get :show, id: smore.id, format: :json

      expect(response).to have_http_status(:ok)
      poptart_response = JSON.parse(response.body)
      expect(poptart_response['flavor']).to eq('smore')
      expect(poptart_response['sprinkles']).to eq('none')
    end
  end

  context '#create' do
    it 'creates the best poptart' do
      post :create, format: :json, poptart: {flavor: 'boston creme', sprinkles: 'black and white'}

      expect(response).to have_http_status(:created)
      poptart_response = JSON.parse(response.body)
      expect(poptart_response['flavor']).to eq('boston creme')
      expect(poptart_response['sprinkles']).to eq('black and white')
    end
  end

  context '#update' do
    it 'makes a bad poptart edible' do
      poptart = Poptart.create(flavor: 'plain', sprinkles: 'no sprinkles')

      put :update, id: poptart.id, format: :json, poptart: { flavor: 'chocolate cheese', sprinkles: 'jerky' }

      expect(response).to have_http_status(:no_content)
      expect(poptart.reload.flavor).to eq('chocolate cheese')
      expect(poptart.sprinkles).to eq('jerky')

    end
  end

  context '#destroy' do
    it 'destroy the plain poptarts cause they are sad' do
      poptart = Poptart.create(flavor: 'plain', sprinkles: 'no sprinkles')

      expect {
        delete :destroy, id: poptart.id, format: :json
      }.to change { Poptart.count}.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end
