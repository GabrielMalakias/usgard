require_relative './edit_form'
require_relative '../shared/render_error'

module Web::Views::Sensors
  class Update
    include Web::View
    include Web::Views::Sensors::EditForm
    include Web::Views::Shared::RenderError

    template 'sensors/edit'
  end
end


