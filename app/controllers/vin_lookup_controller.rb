class VinLookupController < ApplicationController
  require 'edmunds'

  before_filter :allow_cors

  def allow_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def getCarByVin
    res = Edmunds::VinLookup::getCarByVin(params[:vin], ENV['EDMUNDS_API_KEY'])
    render :json => res
  end # end getCarByVin method


end # end VinLookup controller
