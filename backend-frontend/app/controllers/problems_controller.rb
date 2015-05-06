class ProblemsController < ApplicationController
  
	before_action :find_problem, only: [:update, :destroy]

  def show
    @problem = current_user.is_customer? ? current_user.problems.find(params[:id]) : Problem.find(params[:id])
    if @problem
      @solutions_problems = @problem.solutions_problems 
      @solutions_problem = SolutionsProblem.new
    end
  end

  def new
    respond_to do |format|
      @problem = Problem.new
      format.js
    end
  end

  def create 
    respond_to do |format|
      @problem = current_user.problems.build(problem_params)
      if @problem.save
        @url = :home
      end
      format.js
    end
  end

  def edit
    respond_to do |format|
      @problem = current_user.problems.find(params[:id])
      format.js
    end
  end

  def update
    respond_to do |format|
  	  @problem.assign_attributes(problem_params)
  	  if @problem.save
  	  	@url = :home
      end
      format.js
     end
  end

  def destroy
  	@problem.destroy
  	redirect_to :home, notice: 'Se ha eliminado correctamente el problema'
  end

  private
  def problem_params
  	params.require(:problem).permit(:title, :description)
  end

  def find_problem
  	@problem = current_user.problems.find(params[:id])
  end
end
