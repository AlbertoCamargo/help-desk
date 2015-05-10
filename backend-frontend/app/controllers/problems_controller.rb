class ProblemsController < ApplicationController
  before_action :find_problem, only: [:update, :destroy, :finished, :open]

  def show
    @problem = current_user.is_customer? ? current_user.problems.find(params[:id]) : Problem.find(params[:id])
    if @problem
      @comments_problems = @problem.comments_problems
      @comments_problem = CommentsProblem.new
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
      @problem.save
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
  	  @problem.save
      format.js
     end
  end

  def destroy
  	@problem.destroy
  	redirect_to :home
  end

  def finished
    change_state(@problem, 'answered')
    redirect_to problem_path(params[:id])
  end

  def open
    change_state(@problem, 'active')
    redirect_to problem_path(params[:id])
  end

  private
  def problem_params
  	params.require(:problem).permit(:title, :description)
  end

  def find_problem
  	@problem = current_user.problems.find(params[:id])
  end

  def change_state(problem, state)
    problem.assign_attributes(state: state)
    problem.save
  end
end
