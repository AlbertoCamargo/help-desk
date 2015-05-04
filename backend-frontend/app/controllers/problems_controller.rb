class ProblemsController < ApplicationController
  
	before_action :find_problem, except: [:show, :new, :create]

  def show
    @problem = current_user.is_customer? ? current_user.problems.find(params[:id]) : Problem.find(params[:id])
    if @problem
      @solutions_problems = @problem.solutions_problems 
      @solutions_problem = SolutionsProblem.new
    end
  end

  def new
    @problem = Problem.new
  end

  def create 
    respond_to do |format|
      @problem = current_user.problems.build(problem_params)
      if @problem.save
        @url = :home
        #redirect_to :home, notice: 'El problema se ha creado satisfactoriamente'
      end
        #flash.now[:notice] = 'Error al crear el problema'
        #redirect_to :home
      format.js
    end
  end

  def edit
  end

  def update
	  @problem.assign_attributes(problem_params)
	  if @problem.save
	  	redirect_to :home, notice: 'El problema se ha actualizado correctamente'
	  else
	  	flash.now[:notice] = 'Error al actualizar el problema'
	  	render :edit
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
