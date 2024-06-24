#PART I 
import sys 
from pyspark.sql import SparkSession 
#A SparkSession can be used create DataFrame, register DataFrame as tables, execute SQL over tables, cache tables, and read parquet files. To create a SparkSession, use the following builder pattern 
from pyspark.sql.functions import count 
if __name__ =="__main___": 
  if len(sys.argv) != 2: 
    print("Usage: mnmcount <file>", file=sys.stderr) 
# Build a SparkSession using the SparkSession APIs. 
# If one does not exist, then create an instance. There can only be one SparkSession per JVM. 
spark = (SparkSession 
.builder 
.appName("PythonMnMCount") 
.getOrCreate()) 
# Get the M&M data set filename from the command-line arguments 
mnm_file = sys.argv[1] 
# Read the file into a Spark DataFrame using the CSV format by inferring the schema and specifying that the file contains a header, 
#which provides column names for comma-separated fields. 
mnm_df = (spark.read.format("csv") 
.option("header", "true") 
.option("inferSchema", "true") 
.load("/FileStore/tables/mnm_dataset.csv")) 
# We use the DataFrame high-level APIs. Note that we don't use RDDs at all. Because some of Spark's functions return the same object, we can chain function calls. 
# 1. Select from the DataFrame the fields "State", "Color", and "Count" 
# 2. Since we want to group each state and its M&M color count, we use groupBy() 
# 3. Aggregate counts of all colors and groupBy() State and Color 
# 4 orderBy() in descending order 
count_mnm_df = (mnm_df 
.select("State", "Color", "Count") 
.groupBy("State", "Color") 
.agg(count("Count").alias("Total")) 
.orderBy("Total", ascending=False)) 
# Show the resulting aggregations for all the states and colors; a total count of each color per state. 
# Note show() is an action, which will trigger the above query to be executed. 
count_mnm_df.show(n=60, truncate=False) 
print("Total Rows = %d" % (count_mnm_df.count())) 
# While the above code aggregated and counted for all the states, what if we just want to see the data for a single state, e.g., CA? 
# 1. Select from all rows in the DataFrame 
# 2. Filter only CA state 
#3. groupBy() State and Color as we did above 
#4. Aggregate the counts for each color 
# 5. orderBy() in descending order 
# Find the aggregate count for California by filtering 
ca_count_mnm_df = (mnm df 
.select("State", "Color", "Count") 
.where(mnm_df.State == "CA") .groupBy("State", "Color") 
.agg(count("Count").alias("Total")) 
.orderBy("Total", ascending=False)) 
# Show the resulting aggregation for California. As above, show() is an action that will trigger the execution of the entire computation. 
ca_count_mnm_df.show(n=10, truncate=False) 
#Stop the SparkSession 
spark.stop() 
## PART II 
count_mnm_df = (mnm_df 
.select("State", "Color", "Count") 
.groupBy("State", "Color") 
.agg(count("Count") 
.alias("Total")) 
.orderBy("Total", ascending=False)) 
## PART III 
count_mnm_df.show(5) 
## PART IV 
from pyspark.sql import SparkSession 
# Create a SparkSession 
spark = (SparkSession 
.builder 
.appName("SparkSQLExampleApp") 
.getOrCreate()) 
# Path to data set 
csv_file = "/databricks-datasets/learning-spark-v2/flights/departuredelays.csv" 
# Read and create a temporary view 
# Infer schema (note that for larger files you 
# may want to specify the schema) 
df = (spark.read.format("csv") 
.option("inferSchema", "true") 
.option("header", "true") 
.load(csv_file)) 
df.createOrReplaceTempView("us_delay_flights_tbl") 
## PART V 
་་་ 
schema = "`date` STRING, 'delay' INT, `distance' INT, `origin' STRING, 'destination` STRING" spark.sql("""SELECT distance, origin, destination 
FROM us_delay_flights_tbl WHERE distance> 1000 ORDER BY distance DESC""").show(10) 
## PART VI 
file = """""/databricks-datasets/learning-spark-v2/flights/summary-data/parquet/2010-summary.parquet/""'" df = spark.read.format("parquet").load(file) 
df.show() 
