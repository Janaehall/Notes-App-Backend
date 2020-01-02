# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'lorem'

user = User.create(name: "nae nae")

5.times do 
  tags = []
  4.times do 
    tags.push(Tag.find_or_create_by(name: Faker::Books::Lovecraft.words))
  end
  Note.create(title: Lorem::Base.new('words', 10).output, content: Lorem::Base.new('paragraphs', 1), user_id: user.id, tags: tags )
end




