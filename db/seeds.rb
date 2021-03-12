User.destroy_all
Activity.destroy_all
Problem.destroy_all
Solution.destroy_all
UserActivity.destroy_all
Bookmark.destroy_all

User.reset_pk_sequence
Activity.reset_pk_sequence
Problem.reset_pk_sequence
Solution.reset_pk_sequence
UserActivity.reset_pk_sequence
Bookmark.reset_pk_sequence
 

#user 
user1 = User.create(name: "Diana", username: "diana", password: "sqkrz", birthday:1900-05-24)
user2 = User.create(name: "Yuri", username: "yuri", password:"abc123", birthday: 2000-12-12) 

#activity
audiobook = Activity.create(name: "Listen or read positive material on daily basis 📚", description: " Spend 20 minutes with an audio book, a podcast or a book that boosts your optimism. Try reading or listening to 'The Luck Factor by Richard Wiseman', 'The Four Agreements by Don Miguel Ruiz' will help you shift your self-doubts into optimism and into thinking constructively about your challenge.")
caffein = Activity.create(name: "Cut out caffeine ✂️ ☕️ ", description: "Too much caffeine actually cause fatigue in some people. Gradually cut back on coffee, tea, soft drinks and any medications contain caffeine. Stopping suddenly can cause caffeine withdrawal and more fatigue.")
celebrate = Activity.create(name: "Celebrate the small step and win 🎉", description: "When you've taken one small step forward and you are done with it then you have a win. Example: finish presenting this project:D. Celebrate it!! Go out have bubble tea or your favorite food for dinner. This will renew, recharge your motivation and push self-doubts aside.")
eatwell = Activity.create(name: "Eat well-balanced meals 🥗", description: "Your energy levels are determined by what you eat, because your body converts the fats, proteins, and carbohydrates you eat into daily energy. Therefore, if your diet is less than ideal, it could be a cause of constant fatigue. ")
exercise = Activity.create(name: "Exercise 💪", description: "Exercising can help you feel competent and confident in your body, which in turn promotes mental wellbeing.")
expert = Activity.create(name: "Consult with a Mental Health Counselor 👩‍⚕️", description: "If you feel tired and 'down' for more than a few weeks, please seek an advice of your primary care phisician.")
friend = Activity.create(name: "Connect with family & friends 👨‍👩‍👧‍👦 ", description: "57% of people turns to friends or family to help them manage their stress. Lean into the important people in your life & ask for hepl when you need it.")
journal = Activity.create(name: "Write a journal 📝", description: "A journal can help you to remember the positive things, the successes you have had and how you have overcome obstacles if you are prone to remembering things with a negative slant.")
hobby = Activity.create(name: "Invest in some new hobbies 💃 🕺", description: "A hobby can be a great way to spend the free time that you might have spent worrying. How does a painting or dance class sound to you ;) ? ")
meditation = Activity.create(name: "Meditate 𑁍 ", description: "Meditation can teach us how to change a rash, reactive mindset into a more considered, responsive, and productive one. Just 20 minutes of daily meditation is sufficient to keep anger at bay for the entire day.")
music = Activity.create(name: "Listen to upbeat music 🎧 ", description: "An upbeat tune can change an atmosphere instantly and create a more positive vibe. Listening to upbeat, happy music alters brain chemistry and can improve your mood.")
setgoal= Activity.create(name: "Set Goals 🥅 ", description: " When you're depressed, you may feel like you can't accomplish anything. Setting small daily goals like making the bed, doing the dishes every other day. By completing small contrary acts you’ll feel better about your abilities and in turn feel better about yourself." )
sleep = Activity.create(name: "Get to bed early 😴", description: "Most adults need 7 to 9 hours of sleep each night. A good night's sleep makes you able to tackle the day's stress more easily.")
supplements = Activity.create(name: "Take B-complex Vitamins, Omega-3 fatty acids 💊", description: "These supplements promote stress & anxiety reduction.")
yoga = Activity.create(name: "Take a yoga class 🧘‍♂️", description: "Yoga is a mind-body practice that combines physical poses, controlled breathing, and meditation or relaxation. Yoga may help reduce stress, lower blood pressure and lower your heart rate.")
walk = Activity.create(name: "Go for a quick walk 🚶", description: " Did you know taking regular 20 minutes walks helps boots energy & reduce fatigue ???")
water = Activity.create(name: "Drink plenty of water 💦", description: "Lack of water can cause you to experience periods of fatigue and low energy as your body tries to function without enough water.")

#user_activity
user_activity1 = UserActivity.create(user_id: user1.id, activity_id: audiobook.id, date: Date.today)
user_activity2 = UserActivity.create(user_id: user1.id, activity_id: eatwell.id, date: 2020-12-10)

#problem
problem1 = Problem.create(problem_type: "I am stressed")
problem2 = Problem.create(problem_type: "I am tired")
problem3 = Problem.create(problem_type: "I am having self-doubt")
problem4 = Problem.create(problem_type: "I am sad")
problem5 = Problem.create(problem_type: "I am depressed")
problem6 = Problem.create(problem_type: "I am angry")

#solution
solution0 = Solution.create(problem_id: problem1.id, activity_id: hobby.id)
solution1 = Solution.create(problem_id: problem1.id, activity_id: exercise.id)
solution2 = Solution.create(problem_id: problem1.id, activity_id: friend.id)
solution3 = Solution.create(problem_id: problem1.id, activity_id: sleep.id)
solution4 = Solution.create(problem_id: problem1.id, activity_id: supplements.id)
solution5 = Solution.create(problem_id: problem1.id, activity_id: yoga.id)
solution6 = Solution.create(problem_id: problem2.id, activity_id: water.id)
solution7 = Solution.create(problem_id: problem2.id, activity_id: walk.id)
solution8 = Solution.create(problem_id: problem2.id, activity_id: eatwell.id)
solution9 = Solution.create(problem_id: problem2.id, activity_id: caffein.id)
solution10 = Solution.create(problem_id: problem2.id, activity_id: yoga.id)
solution11 = Solution.create(problem_id: problem3.id, activity_id: audiobook.id)
solution12 = Solution.create(problem_id: problem3.id, activity_id: friend.id)
solution13 = Solution.create(problem_id: problem3.id, activity_id: journal.id)
solution14 = Solution.create(problem_id: problem3.id, activity_id: celebrate.id)
solution15 = Solution.create(problem_id: problem3.id, activity_id: exercise.id)
solution16 = Solution.create(problem_id: problem4.id, activity_id: friend.id)
solution17 = Solution.create(problem_id: problem4.id, activity_id: exercise.id)
solution18 = Solution.create(problem_id: problem4.id, activity_id: music.id)
solution19 = Solution.create(problem_id: problem4.id, activity_id: audiobook.id)
solution20 = Solution.create(problem_id: problem5.id, activity_id: audiobook.id)
solution21 = Solution.create(problem_id: problem5.id, activity_id: expert.id)
solution22 = Solution.create(problem_id: problem5.id, activity_id: friend.id)
solution23 = Solution.create(problem_id: problem5.id, activity_id: setgoal.id)
solution24 = Solution.create(problem_id: problem6.id, activity_id: walk.id)
solution25 = Solution.create(problem_id: problem6.id, activity_id: yoga.id)
solution26 = Solution.create(problem_id: problem6.id, activity_id: meditation.id)

#bookmark
bookmark1 = Bookmark.create(user_id: user1.id, activity_id: yoga.id)
bookmark2 = Bookmark.create(user_id: user2.id, activity_id: eatwell.id)

puts "all done"

