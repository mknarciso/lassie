$best_answer = {}
$user = "ai_lassie"
$TIME_LIMIT_SEC = 60.0
$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = "a0VTwoHoq0lhDSF7Pfq5cghBF"
  config.consumer_secret     = "5MoDb23gem1tdhEAPF9Eoa9ZibrJmktlvilVKYw82w4ZpA4CjC"
  config.access_token        = "868591411301580801-QRxtAOIoYNhcc3hpbVbV5a34bVf3KyI"
  config.access_token_secret = "eXLVcwDUOmNuhak6I9xnGfEejEGRyj4AI5JrsN9eHfkdH"
end