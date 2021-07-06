scoreScales <- function(data = mydata, prefix, key, rev.score.max, fun = "mean", names, ignore.na, append = T){
  # Select scale
  df <- data[,grepl(paste("^", prefix, sep = ""), colnames(data))]
  
 # Check inputs
  nscales = max(abs(key))
  
  if(length(key) != ncol(df)) 
stop(paste("Key length is not the same as number of columns with prefix (",ncol(df), ")", sep = ""))
  
  if(length(names) != nscales) 
    stop("Names list is not the same length the same as number of columns with prefix")
  

    if(missing(rev.score.max)) {
    rev.score.max=max(df[,1], na.rm = T)+1
  }
  
  
  
  # Separate into sub-scales
  sub1 <- abs(key)== 1
  if(nscales >1) sub2 <- abs(key)== 2
  if(nscales >2) sub3 <- abs(key)== 3
  if(nscales >3) sub4 <- abs(key)== 4
  if(nscales >4) sub5 <- abs(key)== 5
  if(nscales >5) sub6 <- abs(key)== 6
  if(nscales >6) sub7 <- abs(key)== 7
  if(nscales >7) sub8 <- abs(key)== 8
  if(nscales >8) sub9 <- abs(key)== 9
  if(nscales >9) sub10 <- abs(key)== 10
  
  # Reverse Score
  df[,key < 0] <- rev.score.max - df[,key < 0]
  
  # Calculate totals
  if(fun == "mean") {
    x1 <- rowMeans(df[,sub1], na.rm = ignore.na)
    if(nscales >1)   x2 <- rowMeans(df[,sub2], na.rm = ignore.na)
    if(nscales >2)   x3 <- rowMeans(df[,sub3], na.rm = ignore.na)
    if(nscales >3)   x4 <- rowMeans(df[,sub4], na.rm = ignore.na)
    if(nscales >4)   x5 <- rowMeans(df[,sub5], na.rm = ignore.na)
    if(nscales >5)   x6 <- rowMeans(df[,sub6], na.rm = ignore.na)
    if(nscales >6)   x7 <- rowMeans(df[,sub7], na.rm = ignore.na)
    if(nscales >7)   x8 <- rowMeans(df[,sub8], na.rm = ignore.na)
    if(nscales >8)   x9 <- rowMeans(df[,sub9], na.rm = ignore.na)
    if(nscales >9)   x10 <- rowMeans(df[,sub10], na.rm = ignore.na)
    
  } else if(fun == "sum"){
    
    x1 <- rowSums(df[,sub1], na.rm = ignore.na)
    if(nscales >1)   x2 <- rowSums(df[,sub2], na.rm = ignore.na)
    if(nscales >2)   x3 <- rowSums(df[,sub3], na.rm = ignore.na)
    if(nscales >3)   x4 <- rowSums(df[,sub4], na.rm = ignore.na)
    if(nscales >4)   x5 <- rowSums(df[,sub5], na.rm = ignore.na)
    if(nscales >5)   x6 <- rowSums(df[,sub6], na.rm = ignore.na)
    if(nscales >6)   x7 <- rowSums(df[,sub7], na.rm = ignore.na)
    if(nscales >7)   x8 <- rowSums(df[,sub8], na.rm = ignore.na)
    if(nscales >8)   x9 <- rowSums(df[,sub9], na.rm = ignore.na)
    if(nscales >9)   x10 <- rowSums(df[,sub10], na.rm = ignore.na)
    
  }
  
  # Combine
  if(nscales == 1) x <- cbind(x1)
  if(nscales == 2) x <- cbind(x1,x2)
  if(nscales == 3) x <- cbind(x1,x2,x3)
  if(nscales == 4) x <- cbind(x1,x2,x3,x4)
  if(nscales == 5) x <- cbind(x1,x2,x3,x4,x5)
  if(nscales == 6) x <- cbind(x1,x2,x3,x4,x5,x6)
  if(nscales == 7) x <- cbind(x1,x2,x3,x4,x5,x6,x7)
  if(nscales == 8) x <- cbind(x1,x2,x3,x4,x5,x6,x7,x8)
  if(nscales == 9) x <- cbind(x1,x2,x3,x4,x5,x6,x7,x8,x9)
  if(nscales == 10) x <- cbind(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10)
  
  # Set column names
  x <- as.data.frame(x)
  colnames(x) <- names
  
  
  # Print reliability
  require(psych)
  
  a1 <- psych::scoreItems(keys = rep(1,sum(sub1, na.rm = TRUE)), items = df[,sub1])$alpha
  if(nscales >1) a2 <- psych::scoreItems(keys = rep(1,sum(sub2, na.rm = TRUE)), items = df[,sub2])$alpha
  if(nscales >2) a3 <- psych::scoreItems(keys = rep(1,sum(sub3, na.rm = TRUE)), items = df[,sub3])$alpha
  if(nscales >3) a4 <- psych::scoreItems(keys = rep(1,sum(sub4, na.rm = TRUE)), items = df[,sub4])$alpha
  if(nscales >4) a5 <- psych::scoreItems(keys = rep(1,sum(sub5, na.rm = TRUE)), items = df[,sub5])$alpha
  if(nscales >5) a6 <- psych::scoreItems(keys = rep(1,sum(sub6, na.rm = TRUE)), items = df[,sub6])$alpha
  if(nscales >6) a7 <- psych::scoreItems(keys = rep(1,sum(sub7, na.rm = TRUE)), items = df[,sub7])$alpha
  if(nscales >7) a8 <- psych::scoreItems(keys = rep(1,sum(sub8, na.rm = TRUE)), items = df[,sub8])$alpha
  if(nscales >8) a9 <- psych::scoreItems(keys = rep(1,sum(sub9, na.rm = TRUE)), items = df[,sub9])$alpha
  if(nscales >9) a10 <-psych::scoreItems(keys = rep(1,sum(sub10, na.rm = TRUE)), items = df[,sub10])$alpha
  
  
  if(nscales == 1) a <- cbind(a1)
  if(nscales == 2) a <- cbind(a1,a2)
  if(nscales == 3) a <- cbind(a1,a2,a3)
  if(nscales == 4) a <- cbind(a1,a2,a3,a4)
  if(nscales == 5) a <- cbind(a1,a2,a3,a4,a5)
  if(nscales == 6) a <- cbind(a1,a2,a3,a4,a5,a6)
  if(nscales == 7) a <- cbind(a1,a2,a3,a4,a5,a6,a7)
  if(nscales == 8) a <- cbind(a1,a2,a3,a4,a5,a6,a7,a8)
  if(nscales == 9) a <- cbind(a1,a2,a3,a4,a5,a6,a7,a8,a9)
  if(nscales == 10) a <- cbind(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10)
  colnames(a) <- names
  print(a)
  
  # Append data
  if(append == T) x <- cbind(data, x) 
  
  return(x)
}
