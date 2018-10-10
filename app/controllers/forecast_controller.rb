require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather
    @lat = params.fetch("user_latitude").strip
    @lng = params.fetch("user_longitude").strip

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    key = ENV['DARK_SKY_KEY'].to_s
    api = "https://api.darksky.net/forecast/"+ key + "/" + @lat.to_s + "," +  @lng.to_s
    results = JSON.parse(open(api).read)
    @current_temperature = results.dig("currently", "temperature")

    @current_summary = results.dig("currently", "summary").to_s

    @summary_of_next_sixty_minutes = results.dig("minutely", "summary").to_s

    @summary_of_next_several_hours = results.dig("hourly", "summary").to_s

    @summary_of_next_several_days = results.dig("daily", "summary").to_s

    render("forecast/coords_to_weather.html.erb")
  end
end
