
## submeter o job
make submit-yarn-cluster app=data_analysis_book/tpcds_pyspark/tpcds_pyspark_run.py queries="q1,q2,q3"

make submit-yarn-cluster app=data_analysis_book/tpcds_pyspark/tpcds_pyspark_run.py SPARK_CONF="spark.executor.memory=2g spark.executor.cores=2 spark.executor.instances=3 spark.sql.adaptive.enabled=false" queries="q1" output=q1/wo/teste

make submit app=data_analysis_book/tpcds_pyspark/tpcds_pyspark_run.py SPARK_CONF="spark.executor.memory=4g spark.executor.cores=3 spark.executor.instances=3 spark.sql.adaptive.enabled=false" queries="q1" output=q1/wo/teste

## entre no cluster e copie do hdfs para o file system
hdfs dfs -get /opt/spark/output/* /opt/spark/output/