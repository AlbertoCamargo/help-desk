class CommentsProblemsController < ApplicationController
  
  before_action :find_comments_problem, except: [:new, :create, :edit]

  def new
    respond_to do |format|
      @comments_problem = CommentsProblem.new
      format.js
    end
  end

  def create
    respond_to do |format|
      problem_id = params[:comments_problem][:problem_id]
      if current_user.creator_cases?(problem_id, 'problem') || current_user.is_sa? || current_user.is_admin?
         @comments_problem = current_user.comments_problems.build(params_comments_problem)
        if @comments_problem.save
          change_state(@comments_problem, 'active')
        end
      end
      format.js
    end
  end

  def edit
    respond_to do |format|
      @comments_problem = CommentsProblem.find(params[:id])
      format.js
    end
  end

  def update
    respond_to do |format|
      problem_id = params[:comments_problem][:problem_id]
      if current_user.creator_cases?(problem_id, 'problem') || current_user.is_sa? || current_user.is_admin?
        @comments_problem.assign_attributes(params_comments_problem)
        @comments_problem.save
      end
      format.js
    end
  end

  def destroy
    change_state(@comments_problem, 'unanswered') if @comments_problem.problem.has_one_comment?
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

  def change_state(comments_problem, state)
    problem = comments_problem.problem
    problem.assign_attributes(state: state)
    problem.save
  end
end
