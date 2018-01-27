class ActuatorRepository < Hanami::Repository
  def all_by_user(user_id)
    find_by_user(user_id)
  end

  def find_by_visibility(user_id, visibility, limit: 9)
    find_by_user(user_id)
      .where(visible: visibility)
      .limit(limit)
  end

  def find_by_id_and_user_id(id, user_id)
    find_by_user(user_id)
      .where(id: id)
      .one
  end

  def delete_by_id_and_user_id(id, user_id)
    find_by_user(user_id).delete
  end

  private

  def find_by_user(user_id)
    actuators.where(user_id: user_id)
  end
end
