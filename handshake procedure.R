requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "Fscv52Oxjs0vJ8vD3Z917RWbb"
consumerSecret <- "v5LRMARYPQdjzZ7S3y9aqljImo36N1Y1sRu0cemhEdB7dnrouA"

my_oauth <- OAuthFactory$new(consumerKey = consumerKey,
                             consumerSecret = consumerSecret,
                             requestURL = requestURL,
                             accessURL = accessURL,
                             authURL = authURL)
my_oauth$handshake(cainfo = system.file("CurlSSL","cacert.pem", package = "RCurl"))
