require 'spec_helper'
require_relative '../../../../apps/web/views/home/index'

describe Web::Views::Home::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/home/index.html.slim') }
  let(:view)      { Web::Views::Home::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'renders home/index' do
    skip 'Should be implemented'

    expect(view.template).to eq 'apps/web/templates/home/index.html.slim'
  end
end
