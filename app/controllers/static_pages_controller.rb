class StaticPagesController < ApplicationController
  def index
    @user = current_user if user_signed_in?
  end

  def about
  end

  def contact
  end

  def help
  end
end
