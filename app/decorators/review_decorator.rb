class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    user.firstname + ' ' + user.lastname
  end

  def created_at
    object.created_at.strftime("%d %m %Y")
  end

end
