# OLIO Technical Task

This project is a response to the Olio Technical Task found [here](http://olioex.github.io/rails-coding-task). The key requirements extracted from the brief are:

1. The list of posts should be refreshed on each page load.
1. A list of posts should be displayed
1. There should be an option to like a post. Likes are global and there is no user system for this sample app.
1. The app should be simple to set up for someone who isn't a day to day Rails developer, and who's machine isn't set up for Rails development.
1. The task should be completed in a few hours.

## Meeting the brief
Completing the brief while observing the time restraints resulted in some trade-offs. They include:

1. Keeping the setup simple
To avoid having a long setup process I decided to use SQLite 3 as the database. This should allow the system to run out of the box on most systems, without installing a database server.
Sidekiq, with Redis, would normally be my first choice for background jobs, however, a simple setup rules this out. Because of this, I've used Rails Active job, which runs synchronously but could easily be hooked up to run asynchronously.

2. Refreshing the list
When the job fetches the list of posts it stores them locally, creating or updating records as required. 

3. Likes
Likes are stored locally in the database, and a list of liked posts is stored in a cookie to display a "Like" or "Unlike" button depending on the user. It also allows for a fresh session by opening an incognito browser window.
Local like and the like count from the server are combined to create the total likes. 


## Requirements

This project has been designed to run on any machine that would run a Rails app.  Requirements are:

* Ruby 2.3+
* Sqlite 3 (install on most systems by default

## Setup
1. Clone this repo `git@github.com:jamespearson/techtest-olio.git`
2. Change directory `cd techtest-olio`
3. Run `bundle install` to install dependencies
4. Run `bundle exec rails db:migrate` to setup the database
5. Run `bundle exec rails s` for start the server on http://localhost:3000

## Tests
------
* Run RSpec `rspec`

