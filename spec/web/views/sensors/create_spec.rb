require 'spec_helper'
require_relative '../../../../apps/web/views/sensors/create'

describe Web::Views::Sensors::Create do
  let(:exposures) { { params: {sensor: { name: 'luminosity', description: 'test', topic: 'luminosity', visible: true } } } }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sensors/new.html.slim') }
  let(:view)      { Web::Views::Sensors::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'renders sensors/new' do
    skip  'No method implemented'

    expect(view.template).to eq 'apps/web/templates/sensors/new.html.slim'
  end
end
