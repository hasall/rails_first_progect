# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Items' do
  # GET list, index
  get '/items' do
    context '200' do
      example_request 'Getting a list of items' do
        expect(status).to eq(200)
      end
    end
  end

  # GET item, show
  get '/items/:id' do
    let(:item) { create(:item) }
    let(:id) { item.id }
    
    example_request 'Get item' do
      response_hash = JSON.parse(response_body)

      expect(response_hash['id']).to eq(id)
      expect(status).to eq(200)
    end
  end

  # POST item, create
  post '/items' do
    parameter :name, 'Name item'

    let(:name) { item.name }
    let(:item) { create(:item) }

    example_request 'Create item' do
      response_hash = JSON.parse(response_body)

      expect(response_hash['name']).to eq(name)
      expect(status).to eq(200)
    end
  end

  # PATCH item, update
  patch '/items/:id' do
    parameter :name, '', scope: :item

    let(:name) { item.name }
    let(:id) { item.id }

    let(:item) { create(:item) }

    example_request 'Update item' do
      response_hash = JSON.parse(response_body)

      expect(response_hash['name']).to eq(name)
      expect(status).to eq(200)
    end
  end

  # DELETE item, destroy
  delete '/items/:id' do
    let(:item) { create(:item) }
    let(:id) { item.id }

    example_request 'Destroy item' do
      expect(status).to eq(200)
    end
  end
end
