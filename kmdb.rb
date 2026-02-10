# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# My Summary

# Delete Data	
# Model.destroy_all	
# Deletes existing rows to prevent duplicates.

# Create Row	
# thing = Thing.new or thing.save
# Inserts columns as a new row into the table.

# Find One	
# Model.find_by({ "id" => 1 })	
# Returns a single row matching criteria.

# Read Value	
# row["column_name"]	
# Reads a specific column value from a row.

# Fetch All	
# Model.all	
# Returns an array of all rows for looping.

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Studios
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

warner = Studio.find_by({ "name" => "Warner Bros." })

# Movies
begins = Movie.new
begins["title"] = "Batman Begins"
begins["year_released"] = 2005
begins["rated"] = "PG-13"
begins["studio_id"] = warner["id"]
begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = warner["id"]
dark_knight.save

rises = Movie.new
rises["title"] = "The Dark Knight Rises"
rises["year_released"] = 2012
rises["rated"] = "PG-13"
rises["studio_id"] = warner["id"]
rises.save

# Actors
bale = Actor.new
bale["name"] = "Christian Bale"
bale.save

caine = Actor.new
caine["name"] = "Michael Caine"
caine.save

neeson = Actor.new
neeson["name"] = "Liam Neeson"
neeson.save

holmes = Actor.new
holmes["name"] = "Katie Holmes"
holmes.save

oldman = Actor.new
oldman["name"] = "Gary Oldman"
oldman.save

ledger = Actor.new
ledger["name"] = "Heath Ledger"
ledger.save

eckhart = Actor.new
eckhart["name"] = "Aaron Eckhart"
eckhart.save

gyllenhaal = Actor.new
gyllenhaal["name"] = "Maggie Gyllenhaal"
gyllenhaal.save

hardy = Actor.new
hardy["name"] = "Tom Hardy"
hardy.save

levitt = Actor.new
levitt["name"] = "Joseph Gordon-Levitt"
levitt.save

hathaway = Actor.new
hathaway["name"] = "Anne Hathaway"
hathaway.save

# Roles (Linking them together)
# Use the variables 'begins', 'dark_knight', 'rises' and actor variables
# Begins
role1 = Role.new
role1["movie_id"] = begins["id"]
role1["actor_id"] = bale["id"]
role1["character_name"] = "Bruce Wayne"
role1.save

role2 = Role.new
role2["movie_id"] = begins["id"]
role2["actor_id"] = caine["id"]
role2["character_name"] = "Alfred"
role2.save

role3 = Role.new
role3["movie_id"] = begins["id"]
role3["actor_id"] = neeson["id"]
role3["character_name"] = "Ra's Al Ghul"
role3.save

role4 = Role.new
role4["movie_id"] = begins["id"]
role4["actor_id"] = holmes["id"]
role4["character_name"] = "Rachel Dawes"
role4.save

role5 = Role.new
role5["movie_id"] = begins["id"]
role5["actor_id"] = oldman["id"]
role5["character_name"] = "Commissioner Gordon"
role5.save

 # Dark Knight
 
role6 = Role.new
role6["movie_id"] = dark_knight["id"]
role6["actor_id"] = bale["id"]
role6["character_name"] = "Bruce Wayne"
role6.save

role7 = Role.new
role7["movie_id"] = dark_knight["id"]
role7["actor_id"] = ledger["id"]
role7["character_name"] = "Joker"
role7.save

role8 = Role.new
role8["movie_id"] = dark_knight["id"]
role8["actor_id"] = eckhart["id"]
role8["character_name"] = "Harvey Dent"
role8.save

role9 = Role.new
role9["movie_id"] = dark_knight["id"]
role9["actor_id"] = caine["id"]
role9["character_name"] = "Alfred"
role9.save

role10 = Role.new
role10["movie_id"] = dark_knight["id"]
role10["actor_id"] = gyllenhaal["id"]
role10["character_name"] = "Rachel Dawes"
role10.save

# Rises

role11 = Role.new
role11["movie_id"] = rises["id"]
role11["actor_id"] = bale["id"]
role11["character_name"] = "Bruce Wayne"
role11.save

role12 = Role.new
role12["movie_id"] = rises["id"]
role12["actor_id"] = oldman["id"]
role12["character_name"] = "Commissioner Gordon"
role12.save

role13 = Role.new
role13["movie_id"] = rises["id"]
role13["actor_id"] = hardy["id"]
role13["character_name"] = "Bane"
role13.save

role14 = Role.new
role14["movie_id"] = rises["id"]
role14["actor_id"] = levitt["id"]
role14["character_name"] = "John Blake"
role14.save

role15 = Role.new
role15["movie_id"] = rises["id"]
role15["actor_id"] = hathaway["id"]
role15["character_name"] = "Selina Kyle"
role15.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Movies Report
movies = Movie.all
for movie in movies
  studio = Studio.find_by({ "id" => movie["studio_id"] })
  puts "#{movie["title"].ljust(22)} #{movie["year_released"]} #{movie["rated"].ljust(6)} #{studio["name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!


# Top Cast Report
roles = Role.all
for role in roles
  movie = Movie.find_by({ "id" => role["movie_id"] })
  actor = Actor.find_by({ "id" => role["actor_id"] })
  puts "#{movie["title"].ljust(22)} #{actor["name"].ljust(20)} #{role["character_name"]}"
end

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
# TODO!

# Query the actor data to find Christian Bale
# .find_by returns a single row and allows us to read columns from that row 
agent_actor = Actor.find_by({ "name" => "Christian Bale" })

# Display the result
puts agent_actor["name"]
