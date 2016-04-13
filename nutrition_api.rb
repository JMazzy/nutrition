require "HTTParty"

class NutritionAPI
  KEY = "DQTsYwZAqhsAlpqz2YbXmsXa2Z3eVwylM2KPfAKg"
  BASE_URL = "http://api.nal.usda.gov/ndb/reports/?api_key=#{KEY}"
  REQUEST_TYPES = ["ndbno"]
  LIST_TYPES = { food: "f", all_nutrients: "n", special_nutrients: "ns", standard_release_nutrients: "nr", food_group: "g" }

  def self.getList(list_type)
    list = HTTParty.get("#{BASE_URL}&lt=#{LIST_TYPES[list_type]}")
    p list
  end

  def self.request(request_type, request_value)
    response = HTTParty.get("#{BASE_URL}&#{request_type}=#{request_value}")
    p response
  end
end

NutritionAPI.getList(:food)
