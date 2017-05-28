class WebhookController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json
    def api
        query = get_params[:result][:resolvedQuery]
        qna = QnaMaker.new
        hash = '{"question": "' + query + '", "top": 1}'
        my_hash = JSON.parse(hash)
        puts "\n\n\n\n"
        puts my_hash
        ans = JSON.generate(my_hash)
        puts ans
        ans2 = qna.generateAnswer(ans)
        puts ans2
        answer = JSON.parse(ans2)
        puts answer
        stringAnswer = CGI.unescapeHTML(answer["answers"].first["answer"]).encode("utf-8")
        
        if stringAnswer == "No good match found in the KB"
            testmony = Testimony.new
            resString = testmony.tweetJSON(query)
            stringAnswer = 'I still dont have this answer. However, I called my ninjas to answer it! Check it out: ' + resString
            #parsedHash = JSON.parse(resHash)
            #return JSON.generate(parsedHash)
        end    
        respond_to do |format|
            format.json {
                msg = { :speech => stringAnswer, :displayText => answer["answers"].first["answer"], :source => "api-rails-sample" }
                render :json => msg
            }
        end
        
    end
    
    private
        def get_params
            params.require(:webhook).permit! 
        end
        
        #def get_answer
        #   params.require(:answer).permit! 
        #end
#{
#    "id"=>"d0701386-7d00-4f97-9b35-54e81d2ab531", 
#    "timestamp"=>"2017-05-28T01:27:59.332Z", 
#    "lang"=>"pt-br", 
#    "result"=>{
#        "source"=>"agent", 
#        "resolvedQuery"=>"como faço uma derivada", 
#        "speech"=>"", 
#        "action"=>"", 
#        "actionIncomplete"=>false, 
#        "parameters"=>{"topic"=>"derivada"}, 
#        "contexts"=>nil, 
#        "metadata"=>{
#            "intentId"=>"791ba4f2-7374-4e1f-a8d2-265ddf2441b7", 
#            "webhookUsed"=>"true", 
#            "webhookForSlotFillingUsed"=>"false", 
#            "intentName"=>"doubt"
#            
#        }, 
#        "fulfillment"=>{
#            "speech"=>"", 
#            "messages"=>[{"type"=>0, "speech"=>""}]
#        }, 
#        "score"=>1.0
#        
#    }, 
#    "status"=>{"code"=>200, "errorType"=>"success"}, 
#    "sessionId"=>"4d7b9e8b-26c4-4b04-8c60-018030776be0"
#    
#}        
        
        
end
