class PagesController < ApplicationController
  
  def home
    @reach_plan = Plan.find(1)
  end
  
end