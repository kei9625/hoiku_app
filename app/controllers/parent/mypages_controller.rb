class Parent::MypagesController < ApplicationController
  before_action :authenticate_parent!

  def show
    @parent = current_parent
  end

  def edit
  end
end
