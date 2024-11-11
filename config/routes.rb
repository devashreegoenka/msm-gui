Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/insert_director", { :controller => "directors", :action => "create_row" })
  post("/update_director/:path_id", { :controller => "directors", :action => "update_director" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete_this"})
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  post("/insert_movie", { :controller => "movies", :action => "create_row" })
  post("/update_movie/:path_id", { :controller => "movies", :action => "update_movie" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete_this"})
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/insert_actor", { :controller => "actors", :action => "create_row" })
  post("/update_actor/:path_id", { :controller => "actors", :action => "update_actor" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete_this"})
  get("/actors/:path_id", { :controller => "actors", :action => "show" })



end
