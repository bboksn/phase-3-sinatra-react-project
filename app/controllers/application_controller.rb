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
  post "/contacts/new" do
  end
  post "/relationships" do
   r = Relationship.create(
      relation: params[:relation],
      desc: params[:desc]
    )
    r.to_json
  end
  #delete
  delete "/relationships/:id" do 
    r= Relationship.find(params[:id])
    r.destroy
  end

end
