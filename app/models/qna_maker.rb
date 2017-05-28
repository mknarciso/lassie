require 'net/http'

class QnaMaker
    def self.createKB(bodyRequest)
        uri = URI('https://westus.api.cognitive.microsoft.com/qnamaker/v2.0/knowledgebases/create')
        uri.query = URI.encode_www_form({
        })
        
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['SUBSCRIPTION_KEY']
        # Request body
        request.body = bodyRequest
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        response.body
        
    end
    
    def self.deleteKB(bodyRequest)
        uri = URI('https://westus.api.cognitive.microsoft.com/qnamaker/v2.0/knowledgebases/' + ENV['KNOWLEDGEBASEID'])
        uri.query = URI.encode_www_form({
        })
        
        request = Net::HTTP::Delete.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['SUBSCRIPTION_KEY']
        # Request body
        request.body = bodyRequest
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        
        response.body
    end
    
    def downloadKB(bodyRequest)
        uri = URI('https://westus.api.cognitive.microsoft.com/qnamaker/v2.0/knowledgebases/'  + ENV['KNOWLEDGEBASEID'])
        uri.query = URI.encode_www_form({
        })
        
        request = Net::HTTP::Get.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['SUBSCRIPTION_KEY']
        # Request body
        request.body = bodyRequest
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end

        response.body 
    end
    
    def generateAnswer(bodyRequest)
        uri = URI('https://westus.api.cognitive.microsoft.com/qnamaker/v2.0/knowledgebases/' + ENV['KNOWLEDGEBASEID']+ '/generateAnswer')
        uri.query = URI.encode_www_form({
        })
        
        request = Net::HTTP::Post.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['SUBSCRIPTION_KEY']
        # Request body
        request.body = bodyRequest
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        
        response.body
    end
    
    def publishKB(bodyRequest)
        uri = URI('https://westus.api.cognitive.microsoft.com/qnamaker/v2.0/knowledgebases/' + ENV['KNOWLEDGEBASEID'])
        uri.query = URI.encode_www_form({
        })
        
        request = Net::HTTP::Put.new(uri.request_uri)
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['SUBSCRIPTION_KEY']
        # Request body
        request.body = bodyRequest
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        
        response.body
    end
    
    def trainKB(bodyRequest)
        uri = URI('https://westus.api.cognitive.microsoft.com/qnamaker/v2.0/knowledgebases/' + ENV['KNOWLEDGEBASEID'] + '/train')
        uri.query = URI.encode_www_form({
        })
        
        request = Net::HTTP::Patch.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['SUBSCRIPTION_KEY']
        # Request body
        request.body = bodyRequest
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        
        response.body
    end
    
    def updateKB(bodyRequest)
        uri = URI('https://westus.api.cognitive.microsoft.com/qnamaker/v2.0/knowledgebases/' + ENV['KNOWLEDGEBASEID'])
        uri.query = URI.encode_www_form({
        })
        
        request = Net::HTTP::Patch.new(uri.request_uri)
        # Request headers
        request['Content-Type'] = 'application/json'
        # Request headers
        request['Ocp-Apim-Subscription-Key'] = ENV['SUBSCRIPTION_KEY']
        # Request body
        request.body = bodyRequest
        
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
        end
        
        response.body
    end
end
