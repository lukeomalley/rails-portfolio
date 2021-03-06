# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @project_items = Project.all
  end

  def new
    @project_item = Project.new
  end

  def create
    @project_item = Project.new(params.require(:project).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @project_item.save
        format.html { redirect_to projects_path, notice: 'Your project is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @project_item = Project.find(params[:id])
  end

  def edit
    @project_item = Project.find(params[:id])
  end

  def destroy
    # Perform the lookup
    @project_item = Project.find(params[:id])

    # Destroy/Delete the record
    @project_item.destroy

    # Redirect after the destroy
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Project was successfully destroyed.' }
    end
  end

  def update
    @project_item = Project.find(params[:id])
    respond_to do |format|
      if @project_item.update(params.require(:project).permit(:title, :subtitle, :body))
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
end
