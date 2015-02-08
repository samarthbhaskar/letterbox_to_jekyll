## letterboxd export CSV to markdown
setwd("~/Dropbox/letterbox_to_jekyll/")

dat <- read.csv("letterboxd-samarthbhaskar-2015-02-08-08-41-utc/reviews.csv")

postify <- function(dat){ 

      yaml <- 
          paste("---
layout: post
title:", dat[,2])
    
      date <- paste("
date: ", dat[,1], "
---
")
    
      rev <- dat[,6]
      
      title <- dat[,2]
      
      url <- paste0("
[LetterboxD review link](", dat[,4],")

")
      
      post <-  (as.matrix(paste(yaml, date, url, rev)))
      
      d <- dat[,1]
      
      
      df <- data.frame(d, title, post, url)
      colnames(df) <- c("date","title","post", "url")
      return(df)
}


all_posts <- postify(dat)

setwd("reviews/")

for(i in 1:nrow(all_posts)){
write.table(
    all_posts[i,3],
    file=paste0(all_posts[i,1], "-", all_posts[i,2],".markdown"),
    quote=FALSE,
    row.names=FALSE,
    col.names=FALSE
  )
}