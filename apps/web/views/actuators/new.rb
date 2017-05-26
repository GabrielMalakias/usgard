require_relative './new_form'

module Web::Views::Actuators
  class New
    include Web::View
    include Web::Views::Actuators::NewForm
  end
end
