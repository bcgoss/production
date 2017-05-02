require 'rails_helper'

RSpec.describe List, type: :request do
  context 'good requests' do
    it 'creates a list' do
      list = attributes_for :list

      headers = {"ACCEPTS": 'application/json', "Content-Type": 'application/json' }
      post "/api/v1/lists", params: list.to_json, headers: headers

    end
  end
end
