require_relative './new_form'
require_relative '../shared/render_error'

module Web::Views::Sensors
  class Create
    include Web::View
    include Web::Views::Sensors::NewForm
    include Web::Views::Shared::RenderError

    template 'sensors/new'
  end
end
