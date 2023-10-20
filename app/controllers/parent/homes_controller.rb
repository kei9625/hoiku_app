class Parent::HomesController < ApplicationController
  before_action :set_parent

  def index
  end

  private

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end
end