# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dir.entries(Rails.root.join("db/samples")).select{|s| s.length > 3}.each do |sample|
  Project.create name: sample, attachment: File.open(Rails.root.join("db/samples/#{sample}"))
end
