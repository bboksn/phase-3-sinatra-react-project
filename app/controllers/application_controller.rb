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
    r.to_json(include: :contacts)
  end
  #delete
  delete "/relationships/:id" do 
    r= Relationship.find(params[:id])
    r.destroy
    r.to_json
  end
  delete "/contacts/:id" do 
    c= Contact.find(params[:id])
    c.destroy
    c.to_json
  end
#patch 
patch '/contacts/:id' do
  c = Contact.find(params[:id])
  c.pfp_url = params[:pfp_url]
  c.f_name = params[:f_name]
  c.l_name = params[:l_name]
  c.phone_number = params[:phone_number]
  c.relationship_id = params[:relationship_id]
  c.save
  c.to_json
end
end
