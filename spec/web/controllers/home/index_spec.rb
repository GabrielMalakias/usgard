require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/index'

describe Web::Controllers::Home::Index, type: :controller do
  let(:action) { Web::Controllers::Home::Index.new }
  let(:params) { Hash[] }

  before do
    stub_current_user!
  end

  it 'is successful' do
    response = action.call(params)

    expect(response[0]).to be 200
  end
end
