require_relative './new_form'

module Web::Views::Sensors
  class New
    include Web::View
    include Web::Views::Sensors::NewForm
  end
end

