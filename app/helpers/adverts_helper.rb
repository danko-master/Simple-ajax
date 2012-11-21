module AdvertsHelper
  def cities
    City.get_capital_and_city
  end
  def pgt
    City.get_pgt
  end
  def village
    City.get_village_center
  end
  def areas
    Area.get_areas
  end
end
