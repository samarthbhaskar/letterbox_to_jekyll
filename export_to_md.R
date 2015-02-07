## letterboxd export CSV to markdown
setwd("~/Dropbox/letterboxd_export/")

dat <- read.csv("letterboxd-samarthbhaskar-2015-02-08-08-41-utc/reviews.csv")

dat[1]

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
      post <-  (as.matrix(paste(yaml, date, rev)))
      d <- dat[,1]
      
      df <- data.frame(d, title, post)
      colnames(df) <- c("date","title","post")
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