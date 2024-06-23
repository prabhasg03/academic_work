library(Rhipe)

rhint(TRUE, TRUE);
map < -expression({lapply(map.values, function(mapper)...)})
reduce < -expression(
pre={...},
reduce={...},
post={...}, }
x < - rhmr(
map=map, reduce=reduce,
ifolder=inputPath,
ofolder=outputPath,
inout=c('text', 'text'),
jobname='a job name'))
rhex(z)
