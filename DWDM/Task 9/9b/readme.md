# Task 9(b)
Apply preprocessing techniques on dataset Weather.arff and normalize Weather table data using Knowledge flow
# Description
The knowledge flow provides an alternative way to the explorer as a graphical front end to
WEKA‟s algorithm. Knowledge flow is a working progress. So, some of the functionality from
explorer is not yet available. So, on the other hand there are the things that can be done in
knowledge flow, but not in explorer. Knowledge flow presents a dataflow interface to WEKA.
The user can select WEKA components from a toolbar placed them on a layout campus and
connect them together in order to form a knowledge flow for processing and analyzing the data.
# Procedure
- Open Start -> Programs -> Weka-3-9 -> Weka-3-9
- Open the Knowledge Flow.
- Select the Data Source component and add Arff Loader into the knowledge layout canvas.
- Select the Filters component and add Attribute Selection and Normalize into the knowledge
layout canvas.
- Select the Data Sinks component and add Arff Saver into the knowledge layout canvas.
- Right click on ArffLoader and select Configure option then the new window will be opened
and select Weather.arff
- Right click on Arff Loader and select Dataset option then establish a link between ArffLoader and Attribute Selection.
- Right click on Attribute Selection and select Dataset option then establish a link between
Attribute Selection and Normalize.
- Right click on Attribute Selection and select Configure option and choose the best attribute
for Weather data.
- Right click on Normalize and select Dataset option then establish a link between Normalize
and Arff Saver.
- Right click on Arff Saver and select Configure option then new window will be opened and
set the path, enter .arff in look in dialog box to save normalize data.
- Right click on Arff Loader and click on Start Loading option then everything will be
executed one by one.
- Check whether output is created or not by selecting the preferred path.
- Rename the data name as weather_normalized.arff
- Double click on weather_normalized.arff then automatically the output will be opened in MS-Excel.
