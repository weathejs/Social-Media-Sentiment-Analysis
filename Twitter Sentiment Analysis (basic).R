
tweets = searchTwitter("#ghoe", n=200, lang='en') 
Tweets.text = lapply(tweets,function(t)t$getText())
Tweets.text = sapply(Tweets.text, function(row) iconv(row, "latin1", "ASCII", sub=""))

pos = scan('/Users/jarrett/Documents/R/positive-words.txt', what='character', comment.char=';')
neg = scan('/Users/jarrett/Documents/R/negative-words.txt', what='character', comment.char=';')


score.sentiment = function(sentences, pos.words, neg.words){
  scores = lapply(sentences, function(sentence, pos.words, neg.words) {
    
    # clean up sentences, remove puncutation 
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    
    sentence = tolower(sentence)
    # split into words. str_split is in the stringr package
    word.list = strsplit(sentence, '\\s+')
    # sometimes a list() is one level of hierarchy too much
    words = unlist(word.list)
    
    # compare our words to the dictionaries of positive & negative terms
    # match() returns the position of the matched term or NA
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    
    #turns to TRUE/FALSE
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
    #TRUE/FALSE will be treated as 1/0 by sum():
    #super simple way to calculate score: needs improvement 
    score = sum(pos.matches) - sum(neg.matches) #score is # positive words - # negative words
    return(score)
  }, pos.words, neg.words)
  
  #puts tweets and its sentiment score into table
  df = data.frame(
    text = sentences 
  )
  df$score = scores 
  return(df)
}

analysis = score.sentiment(Tweets.text, pos, neg)

mean(as.numeric(analysis$score))