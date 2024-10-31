Rails.application.routes.draw do
  root to: "stations#index"
  user :resources, only: [:create, :new, :update] # create = registrations, new = login
  # Create is same as consoel create = save to db
  # new create user, but doesn't save
  #     --> use the temp user to check if a user in the db already exists with that user/password 
  #         --> authenticate
end