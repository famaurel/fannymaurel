class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def index
    @projects = Project.all.with_attached_images
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.images.attach(params[:project][:images])
    if @project.save
      flash[:notice] = "Project was successfully created"
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "The project was destroyed"
    redirect_to projects_path
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :subname, :type, :description)
    end
end
