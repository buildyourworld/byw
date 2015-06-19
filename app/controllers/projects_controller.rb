class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @hash = Gmaps4rails.build_markers(@projects) do |project, marker|
      marker.lat project.latitude
      marker.lng project.longitude
      marker.infowindow project.description
    end
  end
  def search
    @projects = Project.where(name: params[:search])
    render action: :index
  end
  #Category scopes render action: :index
    def architecture
      @projects = Project.architecture
      render action: :index
    end
    def business
      @projects = Project.business
      render action: :index      
    end
    def charity
      @projects = Project.charity
      render action: :index      
    end
    def demonstration
      @projects = Project.demonstration
      render action: :index      
    end
    def environment
      @projects = Project.environment
      render action: :index
    end
    def musique
      @projects = Project.musique
      render action: :index      
    end
    def sports
      @projects = Project.sports
      render action: :index      
    end
    def technology
      @projects = Project.technology
      render action: :index      
    end      
    def emergency
      @projects = Project.emergency
      render action: :index        
    end  

  # GET /projects/1
  # GET /projects/1.json
  def show
    @hash = Gmaps4rails.build_markers(@project) do |project, marker|
      marker.lat project.latitude
      marker.lng project.longitude
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.skills.build
    @project.tools.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { redirect_to new_project_path }
        flash[:alert] = @project.errors
        #format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :image, :city, :latitude, :longitude, :category_id, skills_attributes: [:id, :name, :_destroy], tools_attributes: [:id, :name, :_destroy])
    end
end
