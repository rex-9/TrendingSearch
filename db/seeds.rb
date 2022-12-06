# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "Admin", password: "password", role: "admin")
User.create(username: "Rex", password: "password")
User.create(username: "Sasa", password: "password")

Trend.create(keyword: "What is Ruby on Rails?")
Trend.create(keyword: "How handsome is Emil?")
Trend.create(keyword: "Will Rex have a chance to get hired by Helpjuice?")

UserTrend.create(user_id: 2, trend_id: 1)
UserTrend.create(user_id: 2, trend_id: 3)
UserTrend.create(user_id: 3, trend_id: 2)