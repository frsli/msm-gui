class ActorsController < ApplicationController

  def delete
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    the_actor = matching_actors.at(0)

    the_actor.destroy

    redirect_to("/actors")
  end

  def update
    the_id = params.fetch("path_id")
    matching_actors = Actor.where({ :id => the_id })
    new_actor = matching_actors.at(0)
    new_actor.name = params.fetch("form_name")
    new_actor.dob = params.fetch("form_dob")
    new_actor.bio = params.fetch("form_bio")
    new_actor.image = params.fetch("form_image")

    new_actor.save

    redirect_to("/actors/#{the_id}")
  end

  def create
    new_actor = Actor.new

    new_actor.name = params.fetch("form_name")
    new_actor.dob = params.fetch("form_dob")
    new_actor.bio = params.fetch("form_bio")
    new_actor.image = params.fetch("form_image")

    new_actor.save

    redirect_to("/actors")
  end

  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
