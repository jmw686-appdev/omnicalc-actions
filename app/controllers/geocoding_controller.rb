require 'open-uri'

class GeocodingController < ApplicationController
  def street_to_coords
    @street_address = params.fetch("user_street_address")
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address
    data = JSON.parse(open(url).read)
    parsed = data.fetch("results").at(0).fetch("geometry").fetch("location")
    @latitude = parsed.fetch("lat").to_s

    @longitude = parsed.fetch("lng").to_s

    render("geocoding/street_to_coords.html.erb")
  end
end
