# this code will concatenate the survey files to have all data in one table.

# get all filenames in the folder survey
library (dplyr)
require (twitteR)

Folderdata= ("../Bet_system")
setwd(Folderdata)
filenames = dir()
#filenames

## read each file present and concatenate using rbind
concatenated= c()
for (i in filenames[]){
    print(i)
  N= read.csv(i, header=T, colClasses = c(rep("character",3), rep( "numeric", 8)))
  concatenated= rbind(concatenated, N)
}

names(concatenated)

concatenated = concatenated %>%
    replace(is.na(.), 0) %>%
    mutate(sum = rowSums(.[c(6,8,10)]) - rowSums(.[c(7,9,11)])) %>%
    mutate (winner = ifelse(sum>0, "France", "Ireland"))


 #   sum (concatenated[,6], concatenated[,8], concatenated[,10])- sum (concatenated[,7], concatenated[,9], concatenated[,11])

#install.packages("twitteR")
setup_twitter_oauth("tk5IRs1bKELnNYCg5EjthIJce",
                    "PZvUg8EvErqOyyEElrQKaeWjs1TjkDDQ03tpdHl6pv1Jgh8KY5", access_token=NULL, access_secret=NULL)


text1="noneyeet"
b=lookupUsers(concatenated[,2],includeNA=TRUE)
for (i in c(1: nrow(concatenated))){
    

# 



if (is.null(b[[i]])) {
    Twitteraccount = paste(concatenated[i,1])
    
}else{Twitteraccount =paste0("@",concatenated[i,2])}

print(Twitteraccount )

text = 
  paste0(Twitteraccount, " from ", paste(concatenated[i,3]), " bet at #berlinminiwow that ",  concatenated$winner[i], " will win today.")
print(text)  
if (text != text1){tweet (text)}


}