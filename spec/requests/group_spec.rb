require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Bruk Teshome', password: '0123456', email: 'bruk21@gmail.com')
    @group = @user.groups.create(name: 'Hilux', icon: 'https://icon.com')
    sign_in @user
  end

  context 'GET /index : ' do
    it 'returns http success' do
      expect(response).to_not have_http_status(:success)
    end
  end
  describe 'GET /index' do
    it 'Redirect status is correct' do
      expect(response).to_not have_http_status(200)
    end
  end

  describe 'GET /show' do
    it 'Redirect status is correct' do
      expect(response).to_not have_http_status('index')
    end
  end

  describe 'GET /new' do
    it 'Redirect status is not correct' do
      expect(response).to_not have_http_status(200)
    end

    it 'Redirect status is not correct' do
      expect(response).to_not have_http_status('new')
    end
  end
end
