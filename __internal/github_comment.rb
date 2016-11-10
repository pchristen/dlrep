
require 'octokit'

token   = ENV["CSPLIB_ROBOT_TOKEN"]
prnum   = ENV["TRAVIS_PULL_REQUEST"]
comment = ENV["GITHUB_COMMENT"]

puts "Logging in"

client = Octokit::Client.new(:access_token => token)

puts "Logged in"

user = client.user
puts user.login

client.add_comment("dlrep/dlrep", prnum, comment)

puts "Posted comment"
