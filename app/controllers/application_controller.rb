class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  #read
  get "/contacts" do
    Contact.all.to_json(include: :relationship)
  end
  get "/relationships" do
    Relationship.all.to_json(include: :contacts)
  end
  get "/relationships/:relation" do
    Relationship.where(relation: params[:relation]).to_json(include: :contacts)
  end
  #create
  get "/contacts/new" do
  end
  get "/relationships/new" do
    Relationship.all.to_json(include: :contacts)
  end

end
