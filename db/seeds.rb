User.create!(name:"Rajeev Ramakrishnan",email:"rajeevriitm@gmail.com",
  password:"sadsad",password_confirmation:"sadsad")
50.times do |n|
  name=Faker::Name.name
  email = "Rajeev-#{n+1}@railstutorial.org"
  User.create!(name:name,email:email,password:"password",password_confirmation:"password")
end
users=User.order(:created_at).take(6)
30.times do
  users.each do |user|
    content=Faker::Lorem.paragraph(sentence_count= 10)
    title=Faker::Lorem.paragraph(sentence_count= 1)
    user.thoughts.create!(content: content,title: title,category: ["Home","Personal","Diary","Notes"].sample)
  end
end
