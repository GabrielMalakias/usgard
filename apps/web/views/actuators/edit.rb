require_relative './edit_form'

module Web::Views::Actuators
  class Edit
    include Web::View
    include Web::Views::Actuators::EditForm
  end
end

