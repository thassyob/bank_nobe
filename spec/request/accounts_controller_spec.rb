require 'rails_helper'

RSpec.describe AccountsController, type: :request do

  describe "POST #create" do
    context "when a account is created" do
      it 'return 201 status code' do
        user = create(:user)
        account_params = attributes_for(:account, user_id: user.id)

        post "/accounts", params: { account: account_params }

        expect(response).to have_http_status(:created)
      end

      it 'must return a customer is created' do
        user = create(:user)
        account_params = attributes_for(:account, user_id: user.id)

        post "/accounts", params: { account: account_params }

        expect(json_body).to have_key(:name)
        expect(json_body).to have_key(:balance)
        expect(json_body).to have_key(:user)
        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:name)
      end
    end
  end

  describe 'PUT #update' do
    context 'when pass valid data' do
      it 'return 200 status code' do
        account = create(:account)
        account_params = attributes_for(:account)

        put "/accounts/#{account.id}", params: { account: account_params }

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end