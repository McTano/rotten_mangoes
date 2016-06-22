# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
users << User.new(
  email: "definitelynotbatman@batman.com",
  firstname: "Bruce",
  lastname: "Wayne",
  password: "12345",
  password_confirmation: "12345")
users.each { |user| user.save! }

users << User.new(
  email: "theoneandonly@batman.com",
  firstname: "The",
  lastname: "Batman",
  password: "12345",
  password_confirmation: "12345")
users.each { |user| user.save! }

users << User.new(
  email: "dick@batman.com",
  firstname: "Dick",
  lastname: "Grayson",
  password: "12345",
  password_confirmation: "12345")
users.each { |user| user.save! }

users << User.new(
  email: "alfred@batman.com",
  firstname: "Alfred",
  lastname: "Pennyworth",
  password: "12345",
  password_confirmation: "12345")
users.each { |user| user.save! }

users << User.new(
  email: "oracle@batman.com",
  firstname: "Barbara",
  lastname: "Gordon",
  password: "12345",
  password_confirmation: "12345")

users << User.new(
  email: "brian@admin",
  firstname: "Brian",
  lastname: "The Destroyer",
  password: "12345",
  password_confirmation: "12345",
  admin: true)

users.each { |user| user.save }