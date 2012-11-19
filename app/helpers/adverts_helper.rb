module AdvertsHelper
  def cities
    City.get_capital_and_city
  end
  def areas
    Area.get_areas
  end
end
