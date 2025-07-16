build:
	docker compose build

build-yarn:
	docker compose -f docker-compose.yarn.yml build

build-yarn-nc:
	docker compose -f docker-compose.yarn.yml build --no-cache

build-nc:
	docker compose build --no-cache

build-progress:
	docker compose build --no-cache --progress=plain

down:
	docker compose down --volumes --remove-orphans

down-yarn:
	docker compose -f docker-compose.yarn.yml down --volumes --remove-orphans

run:
	make down && docker compose up

run-scaled:
	make down && docker compose up --scale spark-worker=3

run-d:
	make down && docker compose up -d

run-yarn:
	make down-yarn && docker compose -f docker-compose.yarn.yml up

run-yarn-scaled:
	make down-yarn && docker compose -f docker-compose.yarn.yml up --scale spark-yarn-worker=3

stop:
	docker compose stop

stop-yarn:
	docker compose -f docker-compose.yarn.yml stop

submit:
	$(eval CONF_ARGS := $(foreach conf,$(subst $(space), ,$(SPARK_CONF)),--conf $(conf)))
	$(eval OUTPUT_DIR := $(if $(output),/opt/spark/output/$(output),/opt/spark/output/$(shell date +%Y%m%d%H%M%S)_$(if $(queries),$(queries),all).csv))
	docker exec da-spark-master mkdir -p $(shell dirname $(OUTPUT_DIR))
	docker exec da-spark-master spark-submit --master spark://spark-master:7077 --deploy-mode client \
		--conf spark.log.level=error \
		$(if $(cbo),--conf spark.sql.catalogImplementation=hive,) \
		$(CONF_ARGS) \
		--packages ch.cern.sparkmeasure:spark-measure_2.12:0.24 \
		./apps/$(app) \
		-d /opt/spark/data/tpcds_10 \
		-o $(OUTPUT_DIR) \
		$(if $(queries),-q $(queries),) \
		$(if $(cbo),$(if $(use_metastore),--run_using_metastore,--create_metastore_tables_and_compute_statistics),) \
		$(if $(log),> ./output/$(shell date +%Y%m%d%H%M%S)_$(if $(queries),$(queries),all).log 2>&1,)
	@echo "Output written to $(OUTPUT_DIR)"
		
submit-da-book:
	make submit app=data_analysis_book/$(app)

submit-yarn-test:
	docker exec da-spark-yarn-master spark-submit --master yarn --deploy-mode cluster ./examples/src/main/python/pi.py

submit-yarn-cluster:
	$(eval CONF_ARGS := $(foreach conf,$(subst $(space), ,$(SPARK_CONF)),--conf $(conf)))
	docker exec da-spark-yarn-master spark-submit --master yarn --deploy-mode cluster \
		--conf spark.log.level=error \
		$(CONF_ARGS) \
		--packages ch.cern.sparkmeasure:spark-measure_2.12:0.24 \
		./apps/$(app) -d /opt/spark/data/tpcds_10 \
		-o $(if $(output),/opt/spark/output/$(output),/opt/spark/output/$(shell date +%Y%m%d%H%M%S)_$(if $(queries),$(queries),all).csv) \
		$(if $(queries),-q $(queries),)


space := $(subst ,, )

copy-from-hdfs:
	docker exec da-spark-yarn-master hdfs dfs -get /opt/spark/output/* /opt/spark/output/

hdfs-clean-output:
	docker exec da-spark-yarn-master hdfs dfs -rm -r -f /opt/spark/output/*

rm-results:
	rm -r book_data/results/*

rm-output:
	sudo rm -r output/*
