require_relative './edit_form'
require_relative '../shared/render_error'

module Web::Views::Actuators
  class Update
    include Web::View
    include Web::Views::Actuators::EditForm
    include Web::Views::Shared::RenderError

    template 'actuators/edit'
  end
end


