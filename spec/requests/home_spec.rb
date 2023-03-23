require 'rails_helper'

RSpec.describe 'home', type: :request do
  describe 'GET /index' do
    before do
      get '/'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "Renders Splash 'index' template" do
      expect(response).to render_template(:index)
    end
  end
end
