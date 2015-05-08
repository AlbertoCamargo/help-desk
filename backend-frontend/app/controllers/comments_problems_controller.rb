class CommentsProblemsController < ApplicationController
  
  before_action :find_comments_problem, except: [:new, :create]

  def new
    @comments_problem = CommentsProblem.new
  end

  def create
    problem_id = params[:comments_problem][:problem_id]
    if current_user.creator_cases?(problem_id, 'problem') || current_user.is_sa? || current_user.is_admin?
       @comments_problem = current_user.comments_problems.build(params_comments_problem)
      if @comments_problem.save
        redirect_to problem_path(problem_id)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    problem_id = params[:comments_problem][:problem_id]
    if current_user.creator_cases?(problem_id, 'problem') || current_user.is_sa? || current_user.is_admin?
      @comments_problem.assign_attributes(params_comments_problem)
      if @comments_problem.save
        redirect_to problem_path(problem_id)
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    @comments_problem.destroy
    redirect_to problem_path(params[:problem_id])
  end

  private
  def find_comments_problem 
    @comments_problem = CommentsProblem.find(params[:id])
  end

  def params_comments_problem
    params.require(:comments_problem).permit(:description, :problem_id)
  end
end
