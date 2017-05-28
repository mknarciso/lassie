class Testimony < ActiveRecord::Base
    #attr_accessible :content, :in_response_to_id, :tweet_id
    
    
    def tweetJSON(message)
        #message = bodyRequest['question']
        current_tweet = $twitter.update(message)
	    $best_answer[current_tweet] = nil
	    resposta = "https://twitter.com/ai_lassie/status/" + current_tweet.id.to_s
	    resposta
    end
    
    def self.tweet(message)
        current_tweet = $twitter.update(message)
	    $best_answer[current_tweet] = nil
    end
    
    # 0 requests
    # Fazer $mention = $client.mentions antes
    def self.replies(tweet_id)
	    repliesList = []
	    # pegar mais
	    for mention in $mentions do
		    if mention.in_reply_to_status_id == tweet_id
			    repliesList.push(mention)
		    end
	    end
	    return repliesList
    end

# 0 requests
    def self.send_answer(question, answer)
        resposta = answer.full_text
        json = "{\"add\":{\"qnaPairs\":[{\"answer\":" + resposta[10, resposta.length] + ",\"question\":" + question.full_text + "}]}}"
        json
        #puts(json)
    end

# 1 request
    def self.update_rank
	    delete_elements = []
	    $mentions = $twitter.mentions
    	$best_answer.each do |question, answer|
    		repliesList = self.replies(question.id)
    		for rep in repliesList do
    			if answer == nil || rep.favorite_count > answer.favorite_count
    				answer = rep
    			end
    		end
    		$best_answer[question] = answer
    
    		if Time.now - question.created_at >= $TIME_LIMIT_SEC
    			delete_elements.push(question)
    			if !answer.nil?
    			    self.send_answer(question, answer)
    			end
    		end
    	end
    
    	for element in delete_elements do
    		$best_answer.delete(element)
    	end
    	
    	puts($best_answer)
    	
    end
end
