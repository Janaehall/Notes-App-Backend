# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'betterlorem'

user = User.create(name: "nae nae")

5.times do 
  tags = []
  4.times do 
    tags.push(Tag.find_or_create_by(name: BetterLorem.w(1, true, true)))
  end
  Note.create(title: BetterLorem.w(5, true, true), content: BetterLorem.p(1, true), user_id: user.id, tags: tags )
end




