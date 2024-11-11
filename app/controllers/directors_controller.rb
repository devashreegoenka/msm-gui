class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

   def create_row 

    i = Director.new
    i.name = params.fetch("name_director")
    i.dob = params.fetch("dob_director")
    i.bio = params.fetch("bio_director")
    i.image = params.fetch("image_director")
    i.save

    redirect_to("/directors", allow_other_host: true)
  end 

  def update_director

    the_id = params.fetch("path_id")
    director = Director.where({ :id => the_id }).at(0)
    director.name = params.fetch("name_director")
    director.dob = params.fetch("dob_director")
    director.bio = params.fetch("bio_director")
    director.image = params.fetch("image_director")
    director.save

    redirect_to("/directors/#{director.id}", allow_other_host: true)
  end 

  def delete_this
    the_id = params.fetch("path_id")
    director = Director.where({ :id => the_id }).at(0)
  
    director.destroy
  
    redirect_to("/directors")
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end
