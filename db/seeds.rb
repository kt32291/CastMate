# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


jobs = [
  { user_id: 1, role_id: 9276, theatre_id: 3},
  { user_id: 1, role_id: 8093, theatre_id: 15},
  { user_id: 1, role_id: 7647, theatre_id: 17},
  { user_id: 1, role_id: 7703, theatre_id: 35}
]


jobs.each do |job|
  j = Job.new
  j.user_id = job[:user_id]
  j.role_id = job[:role_id]
  j.theatre_id = job[:theatre_id]
  j.save
end
