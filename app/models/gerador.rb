class Gerador
  def generateEntities()
    all = Resource.all;
    #count = 0
    all.each do |a|
      #if count == 30
        sleep 3
       # count = 0
      #end
      entity = a["title"];
      response = HTTParty.post("https://api.api.ai/v1/entities/00329b72-22e2-46bf-93a2-cfdb1f8744e0/entries?v=20150910",
                    :body => {:value => entity}.to_json,
                    :headers => {
                      'Authorization' => 'Bearer 576ae82f2a97432db10fe86b6bc425aa',
                      'Content-Type' => 'application/json'}
      )
      puts response
    end
  end
  
  
end