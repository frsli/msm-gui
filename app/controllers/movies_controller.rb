class MoviesController < ApplicationController
  def create
    new_movie = Movie.new

    new_movie.title = params.fetch("form_title")
    new_movie.year = params.fetch("form_year")
    new_movie.duration = params.fetch("form_duration")
    new_movie.description = params.fetch("form_description")
    new_movie.image = params.fetch("form_image")
    new_movie.director_id = params.fetch("form_director_id")

    new_movie.save

    redirect_to("/movies")
  end

  def update
    the_id = params.fetch("path_id")
    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)
    the_movie.title = params.fetch("form_title")
    the_movie.year = params.fetch("form_year")
    the_movie.duration = params.fetch("form_duration")
    the_movie.description = params.fetch("form_description")
    the_movie.image = params.fetch("form_image")
    the_movie.director_id = params.fetch("form_director_id")

    the_movie.save

    redirect_to("/movies/#{the_id}")
  end

  def delete
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    the_movie = matching_movies.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end

  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
