puts "🌱 Seeding spices..."

# Seed your database here
r= Relationship.create(relation:"friend",desc:"cool")
Contact.create(pfp_url:"https://hi",f_name:"ben",l_name:"jamin",phone_number:1234567890,relationship_id:r.id)

puts "✅ Done seeding!"
