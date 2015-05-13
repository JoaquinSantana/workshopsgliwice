class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
  expose(:users)
  expose_decorated(:user)
  expose_decorated(:reviews) { user.reviews.last(5) }

  def index
  end

  def show
  end
end
