require 'rails_helper'

RSpec.describe List, type: :request do
  context 'good requests' do
    it 'creates a list' do
      list = attributes_for :list, name: 'List Name'

      headers = {"ACCEPTS": 'application/json', "Content-Type": 'application/json' }
      post "/api/v1/lists", params: list.to_json, headers: headers

      expect(response.status).to eq(201)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq "List Name"
    end

    it 'shows a list' do
      list = create :list, name: 'List Name'
  
      get "/api/v1/lists/#{list.id}"

      expect(response.status).to eq(200)
      
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:name]).to eq 'List Name'
    end

    it 'shows all lists' do
      first_list = create :list, name: 'First'
      second_list = create :list, name: 'Second'

      get '/api/v1/lists'

      expect(response.status).to eq(200)
      
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json.first[:name]).to eq 'First'
      expect(json.last[:name]).to eq 'Second'
    end

    it 'updates lists' do
      list = create :list, name: 'Initial name'

      new_data = { list: { name: 'New name' } }
      headers = { 'ACCEPTS': 'application/json', 'Content-Type': 'application/json' }

      put "/api/v1/lists/#{list.id}", params: new_data.to_json, headers: headers
    end
  end
end
