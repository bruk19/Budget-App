require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/group/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/group/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/group/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /group_params" do
    it "returns http success" do
      get "/group/group_params"
      expect(response).to have_http_status(:success)
    end
  end

end
