class SensorRepository < Hanami::Repository
  def find_by_visibility(visibility, limit: 9)
    sensors
      .where(visible: visibility)
      .limit(limit)
  end
end
