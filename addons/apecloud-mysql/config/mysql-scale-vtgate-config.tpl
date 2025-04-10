[vtgate]
gateway_initial_tablet_timeout=30s
healthcheck_timeout=2s
srv_topo_timeout=1s
grpc_keepalive_time=10s
grpc_keepalive_timeout=10s
tablet_refresh_interval=1m
read_write_splitting_policy=random
read_write_splitting_ratio=100
read_after_write_consistency=SESSION
read_after_write_timeout=30.0
enable_buffer=true
buffer_size=10000
buffer_window=30s
buffer_max_failover_duration=60s
buffer_min_time_between_failovers=60s
mysql_auth_server_impl=mysqlbased
mysql_auth_server_static_file=
mysql_server_require_secure_transport=false
enable_logs=true
enable_query_log=true
ddl_strategy=direct
enable_display_sql_execution_vttablets=false
enable_read_write_split_for_read_only_txn=false
enable_interception_for_dml_without_where=true

{{- if eq (index $ "TLS_ENABLED") "true" }}
mysql_server_ssl_ca=/etc/pki/tls/ca.pem
mysql_server_ssl_cert=/etc/pki/tls/cert.pem
mysql_server_ssl_key=/etc/pki/tls/key.pem
# tls
{{- else }}
mysql_server_ssl_ca=
mysql_server_ssl_cert=
mysql_server_ssl_key=
{{- end }}
