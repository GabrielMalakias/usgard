module Web::Views::Sensors
  class Index
    include Web::View

    def sensor_link(id)
      url = routes.sensor_path(id: id)

      link_to(id, url)
    end
  end
end
