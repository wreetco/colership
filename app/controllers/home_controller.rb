class HomeController < ApplicationController
  def index
    # the homepage has to display the featured cars, 4 of them for the home
    @featured = Shoppe::Product.where(:featured => true).order('created_at').limit(4)
  end
end
