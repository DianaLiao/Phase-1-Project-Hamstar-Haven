# Hamstar Haven - FI School Phase 1 Project
## Summary
This CLI app contains a database where users can create a login to:

- browse a list of activities aimed towards self-care
- browse suggested activities based on specific problems (e.g. "I am stressed")
- access a log of completed activities (as marked by user)
- bookmark activities for easy access
- maintain and update a small user profile containing
  - preferred name to be used in greetings
  - a link to a "happy place", which can be opened directly from the main menu

## Installation
1. Fork and clone repo to local machine
2. Install dependencies with '$ bundle install'
3. Use Rake task 'rake db:seed' to create a clean install of pre-loaded activities
4. Use Rake task 'rake run' to start the app
Note: database is currently seeded with two users

## How to use
The inputs will vary from entering strings to selecting from a menu with arrow keys.

### Login/Registration
The app will ask upon starting for you to log in with a previously established username and password, or create a login. 

### Browsing Activities
There are three ways to access the activities in the database.
- browsing through a list of all activities in the database
- browsing through a list of user-bookmarked activities 
- browsing curated suggestions based on user mood

When an activity is selected, a longer description will appear, as well as options to mark it as complete and save/remove from bookmarks.

### Retrieving Information
The user can access their completed activity history in two formats:
- a list printed to the screen with the activity name and date of completion
- a sorted list of activity names and the number of times they have been marked as complete

### Updating and Deleting Information
Currently, there are ways to:
- update user information
  - preferred name
  - avatar - an emoji or string of text to be displayed in the app
  - motto
  - "happy place" - a url of a web page of the user's choosing
- delete all logged activities
- remove activities from bookmark list

### Small Features to Cheer You Up!
The main menu also leads to two additional features:
- Random inspirational quote: The app will retrieve a random quote from [ZenQuotes.io](https://zenquotes.io)
- Go to your happy place: The app will open your default browser and the link set in the user's profile

### Background
This app was created by @yuringn and @DianaLiao as part of a project assignment for the Flatiron School Software Engineering program. In addition to the gems placed in a template from our instructors, use was also made of the [tty-prompt](https://github.com/piotrmurach/tty-prompt), [launchy](https://github.com/copiousfreetime/launchy), and [REST Client](https://github.com/rest-client/rest-client) gems.

### License
The project is available as open source under the terms of the MIT License.