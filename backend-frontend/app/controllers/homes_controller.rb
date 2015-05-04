class HomesController < ApplicationController

  layout :false
  
  def index
    @problems = current_user.is_customer? ? current_user.problems : Problem.all
    @incidents = current_user.is_customer? ? current_user.incidents : Incident.all
    @requests = current_user.is_customer? ? current_user.requests : Request.all
    @problem = Problem.new
  end
end
