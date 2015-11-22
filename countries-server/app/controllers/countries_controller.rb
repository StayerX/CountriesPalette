class CountriesController < ApplicationController
  respond_to :json

  def index
    @countries = Country.find_with_join
    render json: @countries, each_serializer: CountrySerializer
  end

  private

  def country_params
    params.require(:country).permit(:longitude, :latitude)
  end
end
