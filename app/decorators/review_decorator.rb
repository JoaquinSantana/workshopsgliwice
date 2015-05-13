class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    user.firstname + ' ' + user.lastname
  end

  def published_at
    object.published_at.strftime("%A, %B %e")
  end

end
