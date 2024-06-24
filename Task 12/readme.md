# Task 12
Integrating Hadoop with other data analytic framework like R
# Procedure
- Open VMWare or linux os
- Create [1.r]() and [2.r]() files
- 1.r
```
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
```
- 2.r
```
library(Rhipe)

rhint(TRUE, TRUE);
map &lt; -expression({lapply(map.values, function(mapper)...)})
reduce &lt; -expression(
pre={...},
reduce={...},

post={...}, }
x &lt; - rhmr(
map=map, reduce=reduce,
ifolder=inputPath,
ofolder=outputPath,
inout=c(&#39;text&#39;, &#39;text&#39;),
jobname=&#39;a job name&#39;))
rhex(z)
```
- Enter below commands:
```
$ ${HADOOP_HOME}/bin/Hadoop jar
$ {HADOOP_HOME}/contrib/streaming/*.jar\
-inputformat org.apache.hadoop.mapred.TextInputFormat \
-input input_data.txt \
-output output \
-mapper /home/tst/src/map.R \
-reducer /home/tst/src/reduce.R \
-file /home/ts/src/map.R \
-file /home/tst/src/reduce.R
```
