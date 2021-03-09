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
activity1 = Activity.create(name:"Hydrate", description: "abcdefg" )
activity2 = Activity.create(name:"Go for a walk", description: "because the weather is nice outside" )
activity3 = Activity.create(name: "Yoga", description: "release stress")

#problem
problem1 = Problem.create(problem_type: "stressed")
problem2 = Problem.create(problem_type: "tired")

#solution
solution1 = Solution.create(problem_id: problem1.id, activity_id: activity1.id)
solution2 = Solution.create(problem_id: problem2.id, activity_id: activity2.id)
solution3 = Solution.create(problem_id: problem2.id, activity_id: activity3.id)

puts "all done"