require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/index'

describe Web::Controllers::Home::Index, type: :controller do
  let(:user) { instance_double(User, id: user_id) }
  let(:action) { Web::Controllers::Home::Index.new }
  let(:params) { Hash[] }
  let(:user_id) { 1 }

  before do
    stub_current_user!(user)
  end

  it 'is successful' do
    response = action.call(params)

    expect(response[0]).to be 200
  end
end
