class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/contacts" do
    Contact.all.to_json(include: :relationship)
  end

end
