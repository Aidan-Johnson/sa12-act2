require 'httparty'
require 'json'

def get_time_data(area, location)
  url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def display(area, location, time)
  formatted_time = Time.parse(time).strftime("%Y-%m-%d %H:%M:%S")
  puts "The current time in #{area}/#{location} is #{formatted_time}"
end

area = 'Europe'
location = 'London'

time_data = get_time_data(area, location)
current_time = time_data['datetime']
display(area, location, current_time)
