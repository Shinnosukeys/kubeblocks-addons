# kubeblocks-addons
KubeBlocks add-ons.

[![codecov](https://codecov.io/gh/apecloud/kubeblocks-addons/graph/badge.svg?token=NGTPFMY8NG)](https://codecov.io/gh/apecloud/kubeblocks-addons)

## Add-on Tutorial
> NOTE: This tutorial is applicable for KubeBlocks version 0.9.0.

* [Add-ons of KubeBlocks](https://kubeblocks.io/docs/preview/developer_docs/integration/add-ons-of-kubeblocks)
* [Add an add-on to KubeBlocks](https://kubeblocks.io/docs/preview/developer_docs/integration/how-to-add-an-add-on)
* [Backup and restore](https://kubeblocks.io/docs/preview/developer_docs/integration/backup-and-restore)
* [Parameter template](https://kubeblocks.io/docs/preview/developer_docs/integration/parameter-template)
* [Parameter configuration](https://kubeblocks.io/docs/preview/developer_docs/integration/parameter-configuration)
* [Configure monitoring](https://kubeblocks.io/docs/preview/developer_docs/integration/monitoring)
* [Multi-component configuration](https://kubeblocks.io/docs/preview/developer_docs/integration/multi-component)
* [Environment variables and placeholders](https://kubeblocks.io/docs/preview/developer_docs/integration/environment-variables-and-placeholders)

## Supported Add-ons
| NAME | VERSIOINS | DESCRIPTION | MAINTAINERS |
| ---- | ---- | ----------- | ----------- |
| apecloud-mysql | apecloud-mysql-8.0.30<br>wescale-0.2.7 | ApeCloud MySQL is a database that is compatible with MySQL syntax and achieves high availability through the utilization of the RAFT consensus protocol. | xuriwuyun |
| apecloud-postgresql | apecloud-postgresql-14.11.0 | ApeCloud PostgreSQL is a database that is compatible with PostgreSQL syntax and achieves high availability through the utilization of the RAFT consensus protocol. | ldming |
| clickhouse | clickhouse-22.9.4<br>clickhouse-24.8.3 | ClickHouse is an open-source column-oriented OLAP database management system. Use it to boost your database performance while providing linear scalability and hardware efficiency. | sophon-zt |
| elasticsearch | elasticsearch-7.10.1<br>elasticsearch-7.7.1<br>elasticsearch-7.8.1<br>elasticsearch-8.1.3<br>elasticsearch-8.8.2 | Elasticsearch is a distributed, RESTful search engine optimized for speed and relevance on production-scale workloads. | iziang |
| etcd | etcd-3.5.15<br>etcd-3.5.6 | Etcd is a strongly consistent, distributed key-value store that provides a reliable way to store data that needs to be accessed by a distributed system or cluster of machines. | free6om |
| greptimedb | greptimedb-0.3.2 | An open-source, cloud-native, distributed time-series database with PromQL/SQL/Python supported. | GreptimeTeam sh2 |
| influxdb | influxdb-2.7.4 | InfluxDB(TM) is an open source time-series database. It is a core component of the TICK (Telegraf, InfluxDB(TM), Chronograf, Kapacitor) stack. |  |
| kafka | kafka-broker-2.7.0<br>kafka-broker-3.3.2<br>kafka-combine-3.3.2<br>kafka-controller-3.3.2<br>kafka-exporter-1.6.0 | Apache Kafka is a distributed streaming platform designed to build real-time pipelines and can be used as a message broker or as a replacement for a log aggregation solution for big data applications. | caiq1nyu |
| llm | ggml-0.1.0<br>llm-0.2.7 | Large language models. | lynnleelhl |
| loki | loki-1.0.0 | Loki is a horizontally-scalable, highly-available, multi-tenant log aggregation system inspired by Prometheus. It is designed to be very cost effective and easy to operate. | Chen-speculation |
| mariadb | mariadb-10.6.15 | MariaDB is a high performance open source relational database management system that is widely used for web and application servers | yinmin |
| milvus | milvus-v2.3.2 | A cloud-native vector database, storage for next generation AI applications. | leon-inf |
| minio | minio-2024.6.29 | High Performance, Kubernetes Native Object Storage | fengluodb |
| mogdb | mogdb-5.0.5 | A Helm chart for Kubernetes | yabinji shanshanying |
| mongodb | mongodb-4.0.28<br>mongodb-4.2.24<br>mongodb-4.4.29<br>mongodb-5.0.28<br>mongodb-5.0.30<br>mongodb-6.0.16<br>mongodb-6.0.20<br>mongodb-7.0.12<br>mongodb-7.0.16<br>mongodb-8.0.4 | MongoDB is a document database designed for ease of application development and scaling. | xuriwuyun |
| mysql | mysql-5.7.44<br>mysql-8.0.30<br>mysql-8.0.31<br>mysql-8.0.32<br>mysql-8.0.33<br>mysql-8.0.34<br>mysql-8.0.35<br>mysql-8.0.36<br>mysql-8.0.37<br>mysql-8.0.38<br>mysql-8.0.39<br>mysql-8.4.0<br>mysql-8.4.1<br>mysql-8.4.2<br>mysql-mgr-8.0.30<br>mysql-mgr-8.0.31<br>mysql-mgr-8.0.32<br>mysql-mgr-8.0.33<br>mysql-mgr-8.0.34<br>mysql-mgr-8.0.35<br>mysql-mgr-8.0.36<br>mysql-mgr-8.0.37<br>mysql-mgr-8.0.38<br>mysql-mgr-8.0.39<br>mysql-mgr-8.4.0<br>mysql-mgr-8.4.1<br>mysql-mgr-8.4.2<br>mysql-orc-5.7.44<br>mysql-orc-8.0.30<br>mysql-orc-8.0.31<br>mysql-orc-8.0.32<br>mysql-orc-8.0.33<br>mysql-orc-8.0.34<br>mysql-orc-8.0.35<br>mysql-orc-8.0.36<br>mysql-orc-8.0.37<br>mysql-orc-8.0.38<br>mysql-orc-8.0.39<br>mysql-proxysql-2.4.4 | MySQL is a widely used, open-source relational database management system (RDBMS) | xuriwuyun |
| nebula | nebula-v3.5.0 | NebulaGraph is a popular open-source graph database that can handle large volumes of data with milliseconds of latency, scale up quickly, and have the ability to perform fast graph analytics. | Shanshan Ying Xuntao Cheng |
| neon | neon-broker-1.0.0<br>neon-compute-1.0.0<br>neon-pageserver-1.0.0<br>neon-safekeeper-1.0.0 | Neon is a serverless open-source alternative to AWS Aurora Postgres. It separates storage and compute and substitutes the PostgreSQL storage layer by redistributing data across a cluster of nodes. | skyrise |
| oceanbase-ce | oceanbase-ce-4.3.0 | OceanBase has served over 400 customers across the globe and has been supporting all mission critical systems in Alipay. | Powerfool shanshanying |
| opensearch | opensearch-2.7.0<br>opensearch-dashboard-2.7.0 | Open source distributed and RESTful search engine. | iziang |
| orchestrator | orchestrator-3.2.6 | Orchestrator is a MySQL high availability and replication management tool, runs as a service and provides command line access, HTTP API and Web interface. | kubeJocker |
| orioledb | orioledb-16.4.0 | OrioleDB is a new storage engine for PostgreSQL, bringing a modern approach to database capacity, capabilities and performance to the world's most-loved database platform. | 1aal |
| polardbx | polardbx-cdc-2.3.0<br>polardbx-cn-2.3.0<br>polardbx-dn-2.3.0<br>polardbx-gms-2.3.0 | PolarDB-X is a cloud native distributed SQL Database designed for high concurrency, massive storage, complex querying scenarios. | Vettal Wu |
| postgresql | postgresql-12.14.0<br>postgresql-12.14.1<br>postgresql-12.15.0<br>postgresql-14.7.2<br>postgresql-14.8.0<br>postgresql-15.7.0<br>postgresql-16.4.0 | A PostgreSQL (with Patroni HA) cluster definition Helm chart for Kubernetes | ldming |
| pulsar | pulsar-bookies-recovery-2.11.2<br>pulsar-bookies-recovery-3.0.2<br>pulsar-bookkeeper-2.11.2<br>pulsar-bookkeeper-3.0.2<br>pulsar-broker-2.11.2<br>pulsar-broker-3.0.2<br>pulsar-proxy-2.11.2<br>pulsar-proxy-3.0.2<br>pulsar-zookeeper-2.11.2<br>pulsar-zookeeper-3.0.2 | Apache Pulsar is an open-source, distributed messaging and streaming platform built for the cloud. | caiq1nyu |
| qdrant | qdrant-1.10.0<br>qdrant-1.5.0<br>qdrant-1.7.3<br>qdrant-1.8.1<br>qdrant-1.8.4 | High-performance, massive-scale Vector Database for the next generation of AI. | iziang |
| rabbitmq | rabbitmq-3.10.25<br>rabbitmq-3.11.28<br>rabbitmq-3.12.14<br>rabbitmq-3.13.2<br>rabbitmq-3.13.7<br>rabbitmq-3.8.14<br>rabbitmq-3.9.29 | RabbitMQ is a reliable and mature messaging and streaming broker. | xuriwuyun |
| redis | redis-7.0.6<br>redis-7.2.4<br>redis-7.2.7<br>redis-cluster-7.0.6<br>redis-cluster-7.2.4<br>redis-cluster-7.2.7<br>redis-sentinel-7.0.6<br>redis-sentinel-7.2.4<br>redis-sentinel-7.2.7<br>redis-twemproxy-0.5.0 | Redis is an in-memory database that persists on disk. The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, Bitmaps. | Y-Rookie |
| risingwave | risingwave-compactor-v1.0.0<br>risingwave-compute-v1.0.0<br>risingwave-connector-v1.0.0<br>risingwave-frontend-v1.0.0<br>risingwave-meta-v1.0.0 | RisingWave is a distributed SQL streaming database that enables cost-efficient and reliable processing of streaming data. | RisingWave Labs |
| starrocks-ce | starrocks-ce-be-1.0.0-alpha.0-3.2.2<br>starrocks-ce-be-1.0.0-alpha.0-3.3.0<br>starrocks-ce-fe-1.0.0-alpha.0-3.2.2<br>starrocks-ce-fe-1.0.0-alpha.0-3.3.0 | A Linux Foundation project, is the next-generation data platform designed to make data-intensive real-time analytics fast and easy. | yandongxiao iziang |
| tdengine | tdengine-3.0.5 | TDengine is an open source, high-performance, cloud native time-series database optimized for Internet of Things (IoT), Connected Cars, Industrial IoT and DevOps. | leon-inf |
| tidb | tidb-6.5.10<br>tidb-7.1.5<br>tidb-7.5.2<br>tidb-8.4.0<br>tidb-pd-6.5.10<br>tidb-pd-7.1.5<br>tidb-pd-7.5.2<br>tidb-pd-8.4.0<br>tikv-6.5.10<br>tikv-7.1.5<br>tikv-7.5.2<br>tikv-8.4.0 | TiDB is an open-source, cloud-native, distributed, MySQL-Compatible database for elastic scale and real-time analytics. | csuzhangxc cjc7373 |
| vanilla-postgresql | anilla-postgresql-12.15.0<br>anilla-postgresql-14.7.0<br>anilla-postgresql-15.6.1-138<br>anilla-postgresql-15.7.0 | Vanilla-PostgreSQL is compatible with the native PostgreSQL kernel, enabling it to quickly provide HA solutions for various variants based on the native PostgreSQL kernel. | kizuna-lek |
| victoria-metrics | ictoria-metrics-1.0.0 | VictoriaMetrics is a fast, cost-effective and scalable monitoring solution and time series database. | sophon-zt ButterBright |
| weaviate | weaviate-1.19.6 | Weaviate is an open-source vector database. It allows you to store data objects and vector embeddings from your favorite ML-models, and scale seamlessly into billions of data objects. | iziang |
| xinference | xinference-0.11.0<br>xinference-0.11.0-cpu | Xorbits Inference(Xinference) is a powerful and versatile library designed to serve language, speech recognition, and multimodal models. | lynnleelhl |
| yashandb | yashandb-23.1.1-100 | YashanDB is a new database system completely independently designed and developed by SICS. Based on classical database theories, it incorporates original Bounded Evaluation theory, Approximation theory, Parallel Scalability theory and Cross-Modal Fusion Computation theory, supports multiple deployment methods such as stand-alone/primary-standby, shared cluster, and distributed ones, covers OLTP/HTAP/OLAP transactions and analyzes mixed load scenarios, and is fully compatible with privatization and cloud infrastructure, providing clients with one-stop enterprise-level converged data management solutions to meet the needs of key industries such as finance, government, telecommunications and energy for high performance, concurrency and security. | JesseAtSZ shanshanying |
| zookeeper | zookeeper-3.4.14<br>zookeeper-3.6.4<br>zookeeper-3.7.2<br>zookeeper-3.8.4<br>zookeeper-3.9.2 | Apache ZooKeeper is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services. | kubeJocker kissycn |
