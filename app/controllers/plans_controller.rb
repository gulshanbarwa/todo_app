class PlansController < ApplicationController
  def show
    @plan = current_user.plans.find(params[:id])
  end
end