class FeedbacksController < ApplicationController
  before_action :get_project
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = Feedback.all.reverse_order
  end

  def show
  end

  def new
    @feedback = @project.feedbacks.new
  end

  def edit
  end

  def create
    @feedback = @project.feedbacks.new(feedback_params)
    if @feedback.save
      redirect_to project_path(@project), notice: 'Feedback was successfully posted.'
    else
      render :new
    end
  end

  def update
    if @feedback.update(feedback_params)
      flash[:notice] = "Project was updated"
      redirect_to project_path(@project)
    else
      flash[:notice] = "Project was not updated"
      render 'edit'
    end
  end

  def destroy
    @feedback.destroy
    redirect_to project_path(@project), notice: 'Feedback was successfully destroyed.'
  end

  private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def set_feedback
    @feedback = @project.feedbacks.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:author, :source, :content, :project_id)
  end
end
