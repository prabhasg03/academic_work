library(rmr)
map<-function(k,v){...}
reduce<-function(k,vv){...}
mapreduce(
input = "data.txt",
output ="output",
textinputformat = rawtextinputformat,
map = map,
reduce = reduce
)
