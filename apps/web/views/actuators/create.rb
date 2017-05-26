require_relative './new_form'
require_relative '../shared/render_error'

module Web::Views::Actuators
  class Create
    include Web::View
    include Web::Views::Actuators::NewForm
    include Web::Views::Shared::RenderError

    template 'actuators/new'
  end
end
