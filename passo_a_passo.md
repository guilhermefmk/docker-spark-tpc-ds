
## submeter o job

### YARN
make submit-yarn-cluster app=data_analysis_book/tpcds_pyspark/tpcds_pyspark_run.py SPARK_CONF="spark.executor.memory=2g spark.executor.cores=2 spark.executor.instances=3 spark.sql.adaptive.enabled=false" queries="q1" output=q1/wo/teste
## entre no cluster e copie do hdfs para o file system
hdfs dfs -get /opt/spark/output/* /opt/spark/output/

### STANDALONE
#### WO (Without optimization)
make submit app=data_analysis_book/tpcds_pyspark/tpcds_pyspark_run.py SPARK_CONF="spark.sql.adaptive.enabled=false spark.executor.memory=4g spark.executor.cores=3 spark.executor.instances=3" queries="q27" output=q27/wo/wo
#### AQE
make submit app=data_analysis_book/tpcds_pyspark/tpcds_pyspark_run.py SPARK_CONF="spark.sql.adaptive.enabled=true spark.executor.memory=4g spark.executor.cores=3 spark.executor.instances=3" queries="q19" output=q19/aqe/aqe
#### CBO
make submit app=data_analysis_book/tpcds_pyspark/tpcds_pyspark_run.py SPARK_CONF="spark.sql.adaptive.enabled=false spark.executor.memory=4g spark.executor.cores=3 spark.executor.instances=3" queries="q19" output=q19/cbo/cbo cbo=true 

use_metastore=true
#### AQE+CBO
make submit app=data_analysis_book/tpcds_pyspark/tpcds_pyspark_run.py SPARK_CONF="spark.sql.adaptive.enabled=true spark.executor.memory=4g spark.executor.cores=3 spark.executor.instances=3" queries="q19" output=q19/cboaqe/cboaqe cbo=true 

use_metastore=true

## Tabela de Controle de Progresso

| Query | Sem Otimização | Com AQE | Com CBO | AQE + CBO | Notas/Observações |
|-------|----------------|---------|---------|----------|-------------------|
| q3    | ✅             | ✅      | ✅      | ✅       |                   |
| q19   | ✅             | ✅      | ✅      | ✅       |                   |
| q27   | ✅             | ✅      | ✅      | ✅       |                   |
| q42   | ✅             | ✅      | ✅      | ✅       |                   |
| q43   | ✅             | ✅      | ✅      | ✅       |                   |
| q52   | ✅             | ✅      | ✅      | ✅       |                   |
| q55   | ✅             | ✅      | ✅      | ✅       |                   |
| q67   | ✅             | ✅      | ✅      | ✅       |                   |
| q73   | ✅             | ✅      | ✅      | ✅       |                   |
| q98   | ❌             | ❌      | ❌      | ❌       |                   |

**Legenda:**
- ❌: Não executado
- ✅: Executado com sucesso
- 🕒: Em andamento
- ⚠️: Executado com problemas
