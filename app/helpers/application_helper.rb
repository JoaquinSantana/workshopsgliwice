module ApplicationHelper

  def admins_link(&block)
    block.call if current_user.try(:admin)
  end

  def owner_link(object, &block)
    block.call if current_user == object.try(:user)
  end
end
