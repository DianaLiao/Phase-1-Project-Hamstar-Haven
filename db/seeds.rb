User.destroy_all
Activity.destroy_all
# User_Activity.destroy_all
# Bookmark.destroy_all

User.reset_pk_sequence
Activity.reset_pk_sequence
# User_Activity.reset_pk_sequence
# Bookmark.reset_pk_sequence
 

#user 
user1 = User.create(name: "Diana", username: "diana", password: "sqkrz", birthday:1900-05-24)
user2 = User.create(name: "Yuri", username: "yuri", password:"abc123", birthday: 2000-12-12)

#activity
activity1 = Activity.create(name:"Drink Water")
activity2 = Activity.create(name:"Go for a walk")

puts "all done"