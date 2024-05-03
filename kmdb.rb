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

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
#rails generate model Studio


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
warner_bros = Studio.new(studio_name: "Warner Bros.")
warner_bros.save

batman_begins = Movie.new(title: "Batman Begins", year_released: 2005, rated: "PG-13")
batman_begins["studio_id"]= warner_bros["id"]
batman_begins.save

the_dark_knight = Movie.new(title: "The Dark Knight", year_released: 2008, rated: "PG-13", studio_id: warner_bros)
the_dark_knight["studio_id"]= warner_bros["id"]
the_dark_knight.save

the_dark_knight_rises = Movie.new(title: "The Dark Knight Rises", year_released: 2012, rated: "PG-13", studio_id: warner_bros)
the_dark_knight_rises["studio_id"]= warner_bros["id"]
the_dark_knight_rises.save

# Insert actors manually
# Insert actors manually
actor1 = Actor.new("name" => "Christian Bale")
actor1.save

actor2 = Actor.new("name" => "Michael Caine")
actor2.save

actor3 = Actor.new("name" => "Liam Neeson")
actor3.save

actor4 = Actor.new("name" => "Katie Holmes")
actor4.save

actor5 = Actor.new("name" => "Gary Oldman")
actor5.save

actor6 = Actor.new("name" => "Heath Ledger")
actor6.save

actor7 = Actor.new("name" => "Aaron Eckhart")
actor7.save

actor8 = Actor.new("name" => "Maggie Gyllenhaal")
actor8.save

actor9 = Actor.new("name" => "Tom Hardy")
actor9.save

actor10 = Actor.new("name" => "Joseph Gordon-Levitt")
actor10.save

actor11 = Actor.new("name" => "Anne Hathaway")
actor11.save


# Insert roles manually
Role.new({ "movie_id" => batman_begins["id"], "actor_id" => actor1["id"], "character_name" => "Bruce Wayne" }).save
Role.new({ "movie_id" => batman_begins["id"],"actor_id" => actor2["id"], "character_name" => "Alfred" }).save
Role.new({ "movie_id" => batman_begins["id"],"actor_id" => actor3["id"], "character_name" => "Ra's Al Ghul" }).save
Role.new({ "movie_id" => batman_begins["id"],"actor_id" => actor4["id"], "character_name" => "Rachel Dawes" }).save
Role.new({ "movie_id" => batman_begins["id"],"actor_id" => actor5["id"], "character_name" => "Commissioner Gordon" }).save

Role.new({ "movie_id" => the_dark_knight["id"],"actor_id" => actor1["id"], "character_name" => "Bruce Wayne" }).save
Role.new({ "movie_id" => the_dark_knight["id"], "actor_id" => actor6["id"], "character_name" => "Joker" }).save
Role.new({ "movie_id" => the_dark_knight["id"],"actor_id" => actor7["id"], "character_name" => "Harvey Dent" }).save
Role.new({ "movie_id" => the_dark_knight["id"],"actor_id" => actor2["id"], "character_name" => "Alfred" }).save
Role.new({ "movie_id" => the_dark_knight["id"], "actor_id" => actor8["id"], "character_name" => "Rachel Dawes" }).save

Role.new({ "movie_id" => the_dark_knight_rises["id"], "actor_id" => actor1["id"], "character_name" => "Bruce Wayne" }).save
Role.new({  "movie_id" => the_dark_knight_rises["id"],"actor_id" => actor5["id"], "character_name" => "Commissioner Gordon" }).save
Role.new({  "movie_id" => the_dark_knight_rises["id"],"actor_id" => actor9["id"], "character_name" => "Bane" }).save
Role.new({  "movie_id" => the_dark_knight_rises["id"],"actor_id" => actor10["id"], "character_name" => "John Blake" }).save
Role.new({  "movie_id" => the_dark_knight_rises["id"],"actor_id" => actor11["id"], "character_name" => "Selina Kyle" }).save


# Prints a header for the movies output
puts ""
puts "Movies"
puts "========"
puts ""

# Query the movies data and loop through the results to display the movies output.
all_movies = Movie.all
# loop through movies
for movie in all_movies
    # read each row
    title = movie["title"]
    year = movie["year_released"]
    rated=movie["rated"]

    studio_id= movie["studio_id"]
    studio_name = Studio.where({"id"=> studio_id}).first.studio_name

    # display 
    puts "#{title}    #{year}   #{rated}      #{studio_name}"
  end
  

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
# Query the cast data and loop through the results to display the cast output for each movie
all_movies = Movie.all

# Loop through movies
for movie in all_movies
  # Read movie information
  title = movie["title"]

  # Find roles for the current movie
  movie_roles = Role.where({ "movie_id" => movie["id"] })

  # Loop through roles
  for role in movie_roles
    # Find actor information for the role
    actor = Actor.find(role["actor_id"])

    # Display cast output with movie name
    character_name = role["character_name"]
    actor_name = actor["name"]
    puts "#{title}  #{character_name}  #{actor_name}"
  end
end

