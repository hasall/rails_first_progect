# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# bin/rails db:reset db:migrate db:seed
City.new(name:'city1').save
City.new(name:'city2').save

User.new(name:'user1', city_id: 1).save
User.new(name:'user2', city_id: 1).save
User.new(name:'user3', city_id: 2).save

Item.new(name:'item1', user_id: 1).save
Item.new(name:'item2', user_id: 1).save
Item.new(name:'item3', user_id: 1).save
Item.new(name:'item4', user_id: 2).save
Item.new(name:'item5', user_id: 2).save
Item.new(name:'item6', user_id: 2).save
Item.new(name:'item7', user_id: 2).save
Item.new(name:'item8', user_id: 2).save

Booking.new(date_from: '01-01-2000, 01:02:03', date_to: '02-01-2000, 01:02:03', item_id: 1, user_id: 2).save
Booking.new(date_from: '01-01-2000, 01:02:03', date_to: '02-01-2000, 01:02:03', item_id: 2, user_id: 2).save
Booking.new(date_from: '01-01-2000, 01:02:03', date_to: '02-01-2000, 01:02:03', item_id: 3, user_id: 2).save
Booking.new(date_from: '01-01-2000, 01:02:03', date_to: '02-01-2000, 01:02:03', item_id: 4, user_id: 1).save

Review.new(message:'textitem1', user_id: 2, reviewable_type: 'Item', reviewable_id: 1).save
Review.new(message:'textitem2', user_id: 2, reviewable_type: 'Item', reviewable_id: 2).save
Review.new(message:'textitem3', user_id: 2, reviewable_type: 'Item', reviewable_id: 3).save
Review.new(message:'textitem5', user_id: 1, reviewable_type: 'Item', reviewable_id: 4).save
Review.new(message:'textuser1', user_id: 2, reviewable_type: 'User', reviewable_id: 1).save


# def create(model_name, **params)
#   FactoryBot.create(model_name, params)
# end
# create(:city, name: 'city1' )
# create(:city, name: 'city2' )
#
# create(:user, city: city1)
# create(:user, city: city2)
# create(:user, city: city2)
#
# create(:item, user: user1)
# create(:item, user: user1)
# create(:item, user: user1)
# create(:item, user: user2)
# create(:item, user: user2)
# create(:item, user: user2)
# create(:item, user: user2)
# create(:item, user: user2)
#
# create(:booking, item: item1,  user: user2)
# create(:booking, item: item2,  user: user2)
# create(:booking, item: item3,  user: user2)
# create(:booking, item: item4,  user: user1)
#
# create(:review, reviewable: item1, reviewable_type: 'Item', user: user2)
# create(:review, reviewable: item2, reviewable_type: 'Item', user: user2)
# create(:review, reviewable: item3, reviewable_type: 'Item', user: user2)
# create(:review, reviewable: user1, reviewable_type: 'User', user: user2)
# create(:review, reviewable: item4, reviewable_type: 'Item', user: user1)
