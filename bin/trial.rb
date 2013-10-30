require_relative '../config/environment'

# client = Octokit::Client.new :netrc => true
# client.login

client = Octokit::Client.new \
  :login    => 'mikespangler',
  :password => 'github55'

user = client.user
user.login

# puts "FLATIRON REPO NAMES"
# user.rels[:organizations].get.data[0][:rels][:repos].head.data.each do |repo|
# #   puts "#{repo.name} | #{repo.full_name}"
# # end

repos = client.list_repos.collect do |repo|
  repo.name
end

puts repos

org_repos = client.organization_repositories('flatiron-school').collect do |repo|
  repo.name
end


puts ""
puts org_repos

# client.organization_events('flatiron-school').each do |repo|
#   puts "#{repo.name} | #{repo.full_name}"
# end


binding.pry
# user is a sawyer agent object
# repos are sawyer resource objects
# 
