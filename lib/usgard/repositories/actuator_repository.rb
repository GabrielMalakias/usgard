class ActuatorRepository < Hanami::Repository
  def find_by_visibility(visibility, limit: 9)
    actuators
      .where(visible: visibility)
      .limit(limit)
  end

  def pluck_ids
    actuators.pluck(:id)
  end
end
