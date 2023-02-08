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
  post "/contacts" do
    rel = Relationship.where(["relation = ?","params[:relationship_id]"])
    #rel = Relationship.find_by relation: params[:relationship_id]
    #rel_id = rel.ids
    c= Contact.create(
      pfp_url: params[:pfp_url],
      f_name: params[:f_name],
      l_name: params[:l_name],
      phone_number: params[:phone_number],
      relationship_id: params[:relationship_id]
    )
    c.to_json
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
  delete "/contacts/:id" do 
    c= Contact.find(params[:id])
    c.destroy
  end

end
