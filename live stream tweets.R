library(streamR)

load("my_oauth.Rdata")
filterStream(file.name = "tweets.json",
            track = c("Ohio State"),
            language = "en",
            timeout = 1000,
            oauth = my_oauth)
tweets.df <- parseTweets("tweets.json", simplify = FALSE)