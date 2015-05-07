class HomesController < ApplicationController

  layout :false
  
  def index
    @problems = current_user.is_customer? ? current_user.problems.order(updated_at: :desc) : Problem.order(updated_at: :desc)
    @incidents = current_user.is_customer? ? current_user.incidents.order(updated_at: :desc) : Incident.order(updated_at: :desc)
    @requests = current_user.is_customer? ? current_user.requests.order(updated_at: :desc) : Request.order(updated_at: :desc)
    @problem = Problem.new
    @request = Request.new
    @incident = Incident.new
  end
end
