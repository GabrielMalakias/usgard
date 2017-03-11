module Web::Views::Actuators
  class Index
    include Web::View

    def actuator_link(id)
      url = routes.sensor_path(id: id)

      link_to(id, url)
    end
  end
end
