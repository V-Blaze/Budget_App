require 'rails_helper'

RSpec.describe 'Category', type: :request do
  describe 'GET /index' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/categories'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    before do
      current_user = User.first
      current_user.confirm if current_user.confirmed_at.nil?
      sign_in current_user
      get '/categories/new'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'new' template" do
      expect(response).to render_template(:new)
    end
  end
end
