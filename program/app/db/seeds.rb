# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Melbourne = City.new
Melbourne.name = "melbourne"
Melbourne.time = Time.current
Melbourne.offset = 10
Melbourne.default = true
Melbourne.time_status = ""
Melbourne.time_difference = 0
Melbourne.save

Chicago = City.new
Chicago.name = "chicago"
Chicago.time = Time.current
Chicago.offset = -5
Chicago.default = false
Chicago.time_status = ""
Chicago.time_difference = 0
Chicago.save

SaoPaulo = City.new
SaoPaulo.name = "saopaulo"
SaoPaulo.time = Time.current
SaoPaulo.offset = -3
SaoPaulo.default = false
SaoPaulo.time_status = ""
SaoPaulo.time_difference = 0
SaoPaulo.save