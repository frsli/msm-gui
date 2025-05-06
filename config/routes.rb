Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/directors/create_director", { :controller => "directors", :action => "create" })
  post("/directors/update_director/:path_id", { :controller => "directors", :action => "update" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  post("/movies/create_movie", { :controller => "movies", :action => "create" })
  post("/movies/update_movie/:path_id", { :controller => "movies", :action => "update" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/actors/create_actor", { :controller => "actors", :action => "create" })
  post("/actors/update_actor/:path_id", { :controller => "actors", :action => "update" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
