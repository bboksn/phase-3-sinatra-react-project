puts "🌱 Seeding spices..."

# Seed your database here
friend= Relationship.create(relation:"friend",desc:"cool")
Contact.create(pfp_url:"https://hi",f_name:"ben",l_name:"jamin",phone_number:1234567890,relationship_id:friend.id)
Contact.create(pfp_url:"https://image",f_name:"shmen",l_name:"jamin",phone_number:1334567890,relationship_id:friend.id)
coworker = Relationship.create(relation:"coworker",desc:"the people I work with")
Contact.create(pfp_url:"https://image",f_name:"john",l_name:"doe",phone_number:5555555555,relationship_id:coworker.id)
Contact.create(pfp_url:"https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.dogsinsuits.us%2Fwp-content%2Fuploads%2F2019%2F05%2Fjasper.png&f=1&nofb=1&ipt=0df0e7b5e91b28278365eff02307fd4a1b794a58059ee5a91f40c87944a2452e&ipo=images",f_name:"dog",l_name:"johnson",phone_number:6666666666,relationship_id:coworker.id)



puts "✅ Done seeding!"
