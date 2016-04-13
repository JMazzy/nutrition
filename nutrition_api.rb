require "httparty"

class NutritionAPI
  KEY = "DQTsYwZAqhsAlpqz2YbXmsXa2Z3eVwylM2KPfAKg"
  BASE_URL = "http://api.nal.usda.gov/ndb/"
  REQUEST_TYPES = ["ndbno"]
  LIST_TYPES = { food: "f", all_nutrients: "n", special_nutrients: "ns", standard_release_nutrients: "nr", food_group: "g" }

  def self.getList(list_type)
    list = HTTParty.get("#{BASE_URL}list?lt=#{LIST_TYPES[list_type]}&api_key=#{KEY}")
    p list
  end

  def self.request(request_type, request_value)
    response = HTTParty.get("#{BASE_URL}/reports/?#{request_type}=#{request_value}&api_key=#{KEY}")
    p response
  end
end

NutritionAPI.getList(:food)
NutritionAPI.request("ndbno", "01001")
