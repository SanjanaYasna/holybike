Rails.application.routes.draw do
  root to: "stations#index"
  user :resources, only: [:create, :new, :update, :index] # create = registrations, new = login
  # maybe put login + registration as
  # new = form ()
  # Create is same as console create = save to db
  # update ??
  # index = read all users
  # new create user, but doesn't save
  #     --> use the temp user to check if a user in the db already exists with that user/password 
  #         --> authenticate
end