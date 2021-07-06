# R-scales
R functions to help with scoring and cleaning scales

# Load the function

The function can be loaded into R using:

`devtools::source_url("https://raw.github.com/kitdouble/R-scales/master/scoreScales.R")`



## scoreScales function

This function is designed to streamline the scoring of surveys from Qualtrics or elsewhere by allowing for the input of a single scoring key across subscales. For example a key (1,1,1,-1,2,2,3,3) can be imputed for subscales that share a common naming prefix and they will be scored separately as three subscales. Negative values in they key are reverse scored. The function will work with up to 10 subscales. The Cronbach's alpha for all subscales is printed alongside the total scores for each subscale.


### Parameters

**data**: The name of the dataframe    
**prefix**: The shared prefix for the scale e.g. "Q1_" or "Neur".   
**key**: Scoring key for all items in all subscales in order of column index. Numbers refer to different subscales and negative values are reverse scored e.g. c(1,-1,2,2,3,3) will score 3 subscales with the second item of the first subscale reverse scored.   
**rev.score.max**: A numerical value which is the reverse scored items are subtracted. Defaults to the maximum response on the scale + 1.    
**fun**: Two values are possible "mean" will take the average of the items and "sum" will take the sum.   
**names**: A list of the subscales column names. Should correspond to the numerical value given to a subscale e.g. the first name should correspond to the 1 value in the key.   
**ignore.na**: Should missing values be ignored or should they return an NA for the subscale in which they appear.   
**rel.table**: A file path where a reliability table should be saved. If a file already exists at the path, then the current scales reliabilities will be appended (so a running table can be made).    
**append**: Should the total scores be appended to the original dataframe or should they be returned as an object on their own.   

Example

`mydata <- scoreScales(data = mydata, prefix = "NEUR_", key =  c(1, 1,1,2,-1,-2,1,3,3,-3), rev.score.max = 7, fun = "mean", names = c("Scale1", "Scale2", "Scale3"), ignore.na = F, append = F, rel.table = "~/Desktop/reliabilities.csv")`
