class InventoryController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    # get the make list
    @makes = Array.new
    makes = Shoppe::Product.select(:make)
    makes.each do |r|
      models = Array.new
      mlist = Shoppe::Product.select(:model).where(:make => r.make)
      mlist.each do |m|
        models << m.model
      end
      @makes << {
        :make => r.make,
        :models => models
      }
    end
    # makes_json turns into a pre-defined js array of models for each make
    @makes_json = Hash.new # = JSON::pretty_generate(@makes)
    @makes.each do |make|
      @makes_json[make[:make]] = make[:models]
    end
    @makes_json = JSON::pretty_generate(@makes_json)
  end # end index

  def search
    @cars = Shoppe::Product.all.where(:make => params[:make], :model => params[:model])

  end # end search method


end
