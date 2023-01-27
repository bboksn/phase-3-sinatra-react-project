puts "🌱 Seeding spices..."

# Seed your database here
friend= Relationship.create(relation:"friend",desc:"cool")
Contact.create(pfp_url:"https://hi",f_name:"ben",l_name:"jamin",phone_number:1234567890,relationship_id:friend.id)
Contact.create(pfp_url:"https://image",f_name:"shmen",l_name:"jamin",phone_number:1334567890,relationship_id:friend.id)
coworker = Relationship.create(relation:"coworker",desc:"the people I work with")
Contact.create(pfp_url:"https://image",f_name:"john",l_name:"doe",phone_number:5555555555,relationship_id:coworker.id)


puts "✅ Done seeding!"
