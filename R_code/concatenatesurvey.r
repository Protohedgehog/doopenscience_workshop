# this code will concatenate the survey files to have all data in one table.

# get all filenames in the folder survey

filenames = dir("../Survey_data")
#filenames

## read each file present and concatenate using rbind
concatenated= c()
for (i in filenames){
  N= read.csv(i, header=T)
  concatenated= rbind(concatenated, N)
}

