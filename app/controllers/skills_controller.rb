class SkillsController < ApplicationController
  def index
    matching_skills = Skill.all

    @list_of_skills = matching_skills.order({ :created_at => :desc })

    render({ :template => "skills/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_skills = Skill.where({ :id => the_id })

    @the_skill = matching_skills.at(0)

    render({ :template => "skills/show.html.erb" })
  end

  def create
    the_skill = Skill.new
    the_skill.task_id = params.fetch("query_task_id")
    the_skill.provider_id = @current_provider.id

    if the_skill.valid?
      the_skill.save
      redirect_to("/provider/#{the_skill.provider_id}/edit", { :notice => "Skill created successfully." })
    else
      redirect_to("/provider/#{the_skill.provider_id}/edit", { :notice => "Skill failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_skill = Skill.where({ :id => the_id }).at(0)

    the_skill.task_id = params.fetch("query_task_id")
    the_skill.provider_id = params.fetch("query_provider_id")

    if the_skill.valid?
      the_skill.save
      redirect_to("/skills/#{the_skill.id}", { :notice => "Skill updated successfully."} )
    else
      redirect_to("/skills/#{the_skill.id}", { :alert => "Skill failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_skill = Skill.where({ :id => the_id }).at(0)

    the_skill.destroy

    redirect_to("/provider/#{the_skill.provider_id}/edit", { :notice => "Skill deleted successfully."} )
  end
end
