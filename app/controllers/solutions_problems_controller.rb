class SolutionsProblemsController < ApplicationController
  
  before_action :find_solutions_problem, except: [:new, :create]

  def show
  end

  def new
    @solutions_problem = SolutionsProblem.new
  end

  def create
    @solutions_problem = current_user.solutions_problems.build(params_solutions_problem)
    if @solutions_problem.save
      #change_response_problem(params[:solutions_problem][:problem_id])
      redirect_to problem_path(params[:solutions_problem][:problem_id]), notice: 'La solucion del problema se ha creado correctamente'
    else
      flash.now[:notice] = 'Error al crear la solucion'
      render :new
    end
  end

  def edit
  end

  def update
    @solutions_problem.assign_attributes(params_solutions_problem)
    if @solutions_problem.save
      redirect_to problem_path(params[:solutions_problem][:problem_id]), notice: 'La solucion del problema se ha actualizado correctamente'
    else
      flash.now[:notice] = 'Error al actualizar la solucion'
      render :edit
    end
  end

  def destroy
    @solutions_problem.destroy
    redirect_to problem_path(params[:solutions_problem][:problem_id]), notice: 'La solucion del problema se ha eliminado correctamente'
  end

  private
  def find_solutions_problem
    @solutions_problem = SolutionsProblem.find(params[:id])
  end

  def params_solutions_problem
    params.require(:solutions_problem).permit(:description, :problem_id)
  end

  def change_response_problem(problem_id)
    incidend = Problem.find(problem_id)
    problem.assign_attributes(response: true)
    problem.save
  end
end
