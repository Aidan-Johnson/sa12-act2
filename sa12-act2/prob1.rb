require 'httparty'
require 'json'

def get_user_repositories(username)
  url = "https://api.github.com/users/#{username}/repos"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end


def display(repository)
  name = repository['name']
  description = repository['description']
  stars = repository['stargazers_count']
  url = repository['html_url']

  puts 'Most Starred Repository info'
  puts '----------------------------'
  puts "Name:             #{name}"
  puts "Description:      #{description}"
  puts "Number of Stars:  #{stars}"
  puts "Url:              #{url}"
end

def most_stars(repositories)
  most_stars_repo = repositories.max_by {|repo| repo['stargazers_count']}
  most_stars_repo
end

username = 'Aidan-Johnson'
repositories = get_user_repositories(username)

most_stars_repo = most_stars(repositories)
display(most_stars_repo)
