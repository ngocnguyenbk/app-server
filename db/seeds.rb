# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.connection.execute("SET FOREIGN_KEY_CHECKS = 0")
puts "--------TRUNCATE_ALL--------"
system "rails db:truncate_all"
puts "--------TRUNCATE_ALL DONE--------"

puts "--------CREATE DATABASE--------"
seed_files = Dir[Rails.root.join("db/fixtures/*.rb")].sort_by! {|s| s[/\d+/].to_i}
seed_files.each { |seed| load seed }
puts "--------CREATE DATABASE DONE--------"
ActiveRecord::Base.connection.execute("SET FOREIGN_KEY_CHECKS = 1")
