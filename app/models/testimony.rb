class Testimony < ActiveRecord::Base
    #attr_accessible :content, :in_response_to_id, :tweet_id
    
    
    def self.tweetJSON(bodyRequest)
        message = bodyRequest['question']
        current_tweet = $twitter.update(message)
	    $best_answer[current_tweet] = nil
	    resposta = "https://twitter.com/" + $user + "/status/" + current_tweet
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
    			send_answer(question, answer)
    		end
    	end
    
    	for element in delete_elements do
    		$best_answer.delete(element)
    	end
    	
    	puts($best_answer)
    	
    end

# 1 request per $UPDATE_TIME_SEC sec
    def self.keep_updating
    	#ENV['TZ'] = 'UTC'
    	ENV['TZ'] = 'America/Sao_Paulo'
    	scheduler = Rufus::Scheduler.new
    
    	scheduler.every $UPDATE_TIME_SEC do
    		self.update_rank
    	end
    end
end
