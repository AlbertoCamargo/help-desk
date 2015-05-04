class IncidentsController < ApplicationController
  
  before_action :find_incident, except: [:show, :new, :create]

  def show
    @incident = current_user.is_customer? ? current_user.incidents.find(params[:id]) : Incident.find(params[:id])
    if @incident
      @solutions_incidents = @incident.solutions_incidents 
      @solutions_incident = SolutionsIncident.new
    end
  end

  def new
    @incident = Incident.new
  end

  def create
    respond_to do |format|
      @incident = current_user.incidents.build(params_incident)
      if @incident.save
        @url = :home
        #redirect_to :home, notice: 'El incidente se ha creado correctamente'
      end
        #flash.now[:notice] = 'Error el crear el incidente'
        #render :new
      format.js
    end
  end

  def edit
  end

  def update
    @incident.assign_attributes(params_incident)
    if @incident.save
      redirect_to :home, notice: 'Se ha actualizado correctamente el incidente'
    else
      flash.now[:notcie] = 'Error al actualizar el incidente'
      render :edit
    end
  end

  def destroy
    @incident.destroy
    redirect_to :home, notice: 'Se ha eliminado correctamente el incidente'
  end

  private 
  def params_incident
    params.require(:incident).permit(:title, :description)
  end

  def find_incident
    @incident = current_user.incidents.find(params[:id])
  end
end
