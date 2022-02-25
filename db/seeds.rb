require "json"
require "open-uri"

puts "Cleaning database..."
Movie.destroy_all

puts "Creating movies..."


url = "http://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies_parsed = JSON.parse(movies_serialized)
movies = movies_parsed["results"]

movies.each do |movie|
   Movie.create(
     title: movie["title"],
     overview: movie["overview"],
     poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
     rating: movie["vote_average"])
end
