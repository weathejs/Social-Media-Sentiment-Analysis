#Twitter with sentiment analysis

#The preliminary pacakages

library(twitteR)
library(ROAuth)
library(httr)
library(plyr)

#Authentication from twitter (basic)

api_key <- "Fscv52Oxjs0vJ8vD3Z917RWbb"
api_secret <- "v5LRMARYPQdjzZ7S3y9aqljImo36N1Y1sRu0cemhEdB7dnrouA"
access_token <- "627559879-qfhK75AgVmGMCMdjBl4EMw8AHQTksSSAit3ePAdt"
access_token_secret <- "8KRu97ltgJUIQupbQwruHI7HkH8uh8IMYvfyFr4DKycUL"

#New setup from twitter

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)