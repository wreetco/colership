require 'json'
require 'open-uri'

module Edmunds
  class VinLookup
    def self.getCarByVin(vin, api_key)
      # set the base URL for the call at edmunds
      # jon looks weird, really freaks me the fuck out sometimes; triangle-faced
      # ex
        # https://api.edmunds.com/api/vehicle/v2/vins/2C4RVABG4CR391950?fmt=json&api_key=zhdwzygr8cayehhyxjqge8dj
      base_url = "https://api.edmunds.com/api/vehicle/v2/vins/#{vin}?fmt=json&api_key=#{api_key}"
      # hardcron it
      # base_url = "https://api.edmunds.com/api/vehicle/v2/vins/2C4RVABG4CR391950?fmt=json&api_key=zhdwzygr8cayehhyxjqge8dj
      # grab that jonson
      json = open(base_url).read
      # now let's parse it
      res = JSON.parse(json)
      # example res['make']['name']
      return json
    end # end getCarByVin methods
  end # end VinLookup class
end # end Edmunds module

# Edmunds::VinLookup::getCarByVin('2C4RVABG4CR391950', 'zhdwzygr8cayehhyxjqge8dj')
