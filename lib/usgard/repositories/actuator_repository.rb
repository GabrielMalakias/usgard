class ActuatorRepository < Hanami::Repository
  def find_by_params(params)
    attributes = params.reject { |k, _| k == :limit }

    actuators
      .where(attributes)
      .limit(params.fetch(:limit, 10))
  end

  def find_by_id_and_user_id(id, user_id)
    find_by_user_id(user_id)
      .where(id: id)
      .one
  end

  def delete_by_id_and_user_id(id, user_id)
    find_by_user_id(user_id).delete
  end

  def find_by_user_id(user_id)
    actuators.where(user_id: user_id)
  end
end
