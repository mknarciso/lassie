class WebhookController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json
    def api
        query = get_params[:result][:resolvedQuery]
        #intent = get_params[:result][:action]
        #par = get_params[:result][:parameters]
        #if !intent.empty?
            
        
        qna = QnaMaker.new
        hash = '{"question": "' + query + '", "top": 1}'
        my_hash = JSON.parse(hash)
        puts "\n\n\n\n"
        puts my_hash
        answer = JSON.parse(qna.generateAnswer(JSON.generate(my_hash)))
        puts answer
        stringAnswer = CGI.unescapeHTML(answer["answers"].first["answer"]).encode("utf-8")
        puts answer["answers"].first["score"]
        if(answer["answers"].first["score"] < 30)
            stringAnswer = "No good match found in the KB"
        end
        
        if stringAnswer == "No good match found in the KB"
            testmony = Testimony.new
            resString = testmony.tweetJSON(query)
            stringAnswer = 'I still dont have this answer. However, I called my ninjas to answer it! Check it out: ' + resString
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
