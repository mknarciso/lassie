class Gerador
  def generateEntities()
    all = Resource.all;
    all.each do |a|
      entity = a["title"];
      POST https://api.api.ai/v1/entities?v=20150910

Headers:
Authorization: Bearer YOUR_DEVELOPER_ACCESS_TOKEN
Content-Type: application/json; charset=utf-8

POST body:
{
    "name": "Appliances",
    "entries": [{
        "value": "Coffee Maker",
        "synonyms": ["coffee maker", "coffee machine",  "coffee"]
    }, {
        "value": "Thermostat",
        "synonyms": ["Thermostat", "heat", "air conditioning"]
    }, {
        "value": "Lights",
        "synonyms": ["lights", "light", "lamps"]
    }, {
        "value": "Garage door",
        "synonyms": ["garage door", "garage"]
    }]
}
      
      
    end
  end
  
  
end