require_relative './edit_form'

module Web::Views::Sensors
  class Edit
    include Web::View
    include Web::Views::Sensors::EditForm
  end
end

