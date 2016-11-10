require 'octokit'

token   = ENV["GH_TOKEN"]
prnum   = ENV["TRAVIS_PULL_REQUEST"]
comment = ENV["GITHUB_COMMENT"]

client = Octokit::Client.new(:access_token => token)
client.add_comment("dlrep/dlrep", prnum, comment)
