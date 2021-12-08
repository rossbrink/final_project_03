class TasksController < ApplicationController
  def index
    matching_tasks = Task.all

    @list_of_tasks = matching_tasks.order({ :created_at => :desc })

    render({ :template => "tasks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tasks = Task.where({ :id => the_id })

    @the_task = matching_tasks.at(0)

    render({ :template => "tasks/show.html.erb" })
  end

  def create
    the_task = Task.new
    the_task.name = params.fetch("query_name")
    the_task.skills_count = params.fetch("query_skills_count")

    if the_task.valid?
      the_task.save
      redirect_to("/tasks", { :notice => "Task created successfully." })
    else
      redirect_to("/tasks", { :notice => "Task failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_task = Task.where({ :id => the_id }).at(0)

    the_task.name = params.fetch("query_name")
    the_task.skills_count = params.fetch("query_skills_count")

    if the_task.valid?
      the_task.save
      redirect_to("/tasks/#{the_task.id}", { :notice => "Task updated successfully."} )
    else
      redirect_to("/tasks/#{the_task.id}", { :alert => "Task failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_task = Task.where({ :id => the_id }).at(0)

    the_task.destroy

    redirect_to("/tasks", { :notice => "Task deleted successfully."} )
  end
end