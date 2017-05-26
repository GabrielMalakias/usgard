require 'spec_helper'
require_relative '../../../../apps/web/controllers/sensors/blabla'

describe Web::Controllers::Sensors::Blabla do
  let(:action) { Web::Controllers::Sensors::Blabla.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
