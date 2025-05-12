# Surrealdb

SurrealDB is a multi-model Database that allows you to store and manage date in relational, document, graph, time-series, vector & search and key-value models in one place.

- you can use SurrealDB as a Graph, Document, Time-Series, or Vector database, all designed to be queried with our SurrealQL query language. This allows you to design a database that fits the shape and requirements of your data.
- The advantage of using SurrealDB lies in its ability to adapt to your needs, rather than forcing you to adopt a rigid data structure or spreading your data across different databases, which can lead to data inconsistency and duplication.

## Features In KubeBlocks

| Topology            | Horizontal<br/>scaling | Vertical <br/>scaling | Expand<br/>volume | Restart   | Stop/Start | Configure | Expose | Switchover |
|---------------------|------------------------|-----------------------|-------------------|-----------|------------|-----------|--------|------------|
| Tikv/Rocksdb/Memory | Yes          | Yes                   | Yes               | Yes       | Yes        | Yes       | N/A    | N/A   |

- Tikv Mode: pd and tikv components are combined in the cluster.
- Rocksdb Mode: surrealdb cluster is deployed based on rocksdb as storage
- Memory Mode: surrealdb cluster is deployed based on memory as storage

### Backup and Restore

| Feature     | Method | Description |
|-------------|--------|------------|
| N/A | N/A | N/A |

### Versions

| Versions |
|----------|
| 2.2.0    |
| 2.2.1    |

## Prerequisites

- Kubernetes cluster >= v1.21
- `kubectl` installed, refer to [K8s Install Tools](https://kubernetes.io/docs/tasks/tools/)
- Helm, refer to [Installing Helm](https://helm.sh/docs/intro/install/)
- KubeBlocks installed and running, refer to [Install Kubeblocks](../docs/prerequisites.md)
- Surrealdb Addon Enabled, refer to [Install Addons](../docs/install-addon.md)

## Examples

### Create

Create a Surrealdb cluster based on tikv as storage:

```bash
kubectl apply -f examples/surrealdb/cluster-tikv.yaml
```

Create a Surrealdb cluster based on rocksdb as storage:

```bash
kubectl apply -f examples/surrealdb/cluster-rocksdb.yaml
```

Create a Surrealdb cluster based on memory as storage:

```bash
kubectl apply -f examples/surrealdb/cluster-memory.yaml
```

### Horizontal scaling

#### [Scale-out](scale-out.yaml)

Horizontal scaling out `surreal` component in cluster `surreal-cluster` by adding ONE more replica:

```bash
kubectl apply -f examples/surrealdb/scale-out.yaml
```

After applying the operation, you will see a new pod created. You can check the progress of the scaling operation with following command:

```bash
kubectl describe ops surreal-scale-out
```

#### [Scale-in](scale-in.yaml)

Horizontal scaling in  `surreal` component in cluster `surreal-cluster` by deleting ONE replica:

```bash
kubectl apply -f examples/surrealdb/scale-in.yaml
```

#### Scale-in/out using Cluster API

Alternatively, you can update the `replicas` field in the `spec.componentSpecs.replicas` section to your desired non-zero number.

```yaml
# snippet of cluster.yaml
apiVersion: apps.kubeblocks.io/v1
kind: Cluster
spec:
  componentSpecs:
    - name: surreal
      replicas: 1 # Set the number of replicas to your desired number
```

### [Vertical scaling](verticalscale.yaml)

Vertical scaling up or down specified components requests and limits cpu or memory resource in the cluster:

```bash
kubectl apply -f examples/surrealdb/verticalscale.yaml
```

#### Scale-up/down using Cluster API

Alternatively, you may update `spec.componentSpecs.resources` field to the desired resources for vertical scale.

```yaml
# snippet of cluster.yaml
apiVersion: apps.kubeblocks.io/v1
kind: Cluster
spec:
  componentSpecs:
    - name: surreal
      replicas: 1
      resources:
        requests:
          cpu: "1"       # Update the resources to your need.
          memory: "2Gi"  # Update the resources to your need.
        limits:
          cpu: "2"       # Update the resources to your need.
          memory: "4Gi"  # Update the resources to your need.
```

### [Expand volume](volumeexpand.yaml)

Volume expansion is the ability to increase the size of a Persistent Volume Claim (PVC) after it's created. It is introduced in Kubernetes v1.11 and goes GA in Kubernetes v1.24. It allows Kubernetes users to simply edit their PersistentVolumeClaim objects  without requiring any downtime at all if possible.

> [!NOTE]
> Make sure the storage class you use supports volume expansion.

Check the storage class with following command:

```bash
kubectl get storageclass
```

If the `ALLOWVOLUMEEXPANSION` column is `true`, the storage class supports volume expansion.

To increase size of volume storage with the specified components in the cluster:

```bash
kubectl apply -f examples/surrealdb/volumeexpand.yaml
```

After the operation, you will see the volume size of the specified component is increased to `30Gi` in this case. Once you've done the change, check the `status.conditions` field of the PVC to see if the resize has completed.

```bash
kubectl get pvc -l app.kubernetes.io/instance=surreal-cluster -n demo
```

#### Volume expansion using Cluster API

Alternatively, you may update the `spec.componentSpecs.volumeClaimTemplates.spec.resources.requests.storage` field to the desired size.

```yaml
# snippet of cluster.yaml
apiVersion: apps.kubeblocks.io/v1
kind: Cluster
spec:
  componentSpecs:
    - name: tikv
      volumeClaimTemplates:
        - name: data
          spec:
            storageClassName: "<you-preferred-sc>"
            accessModes:
              - ReadWriteOnce
            resources:
              requests:
                storage: 30Gi  # specify new size, and make sure it is larger than the current size
```

### [Restart](restart.yaml)

Restart the specified components in the cluster

```bash
kubectl apply -f examples/surrealdb/restart.yaml
```

### [Stop](stop.yaml)

Stop the cluster and release all the pods of the cluster, but the storage will be reserved

```bash
kubectl apply -f examples/surrealdb/stop.yaml
```

#### Stop using Cluster API

Alternatively, you may stop the cluster by setting the `spec.componentSpecs.stop` field to `true`.

```yaml
# snippet of cluster.yaml
apiVersion: apps.kubeblocks.io/v1
kind: Cluster
spec:
  componentSpecs:
    - name: surreal
      stop: true  # set stop `true` to stop the component
      replicas: 1
```

### [Start](start.yaml)

Start the stopped cluster

```bash
kubectl apply -f examples/surrealdb/start.yaml
```

#### Start using Cluster API

Alternatively, you may start the cluster by setting the `spec.componentSpecs.stop` field to `false`.

```yaml
# snippet of cluster.yaml
apiVersion: apps.kubeblocks.io/v1
kind: Cluster
spec:
  componentSpecs:
    - name: surreal
      stop: false  # set to `false` (or remove this field) to start the component
      replicas: 1
```

### FAQ

#### How to Access Surreal Cluster

##### With Direct Pod Access

you can use the SurrealDB install script. This script securely downloads the latest version for the platform and CPU type. 
It attempts to install SurrealDB into the /usr/local/bin folder, falling back to a user-specified folder if necessary.

```bash
curl -sSf https://install.surrealdb.com | sh
```

To connect to the Surreal cluster, you can use the following command to get the service for connection:

```bash
kubectl get svc -l app.kubernetes.io/instance=surreal-cluster -n demo
```

And the excepted output is like below:

```text
NAME              TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)               AGE
surreal-pd        ClusterIP   10.99.243.157    <none>        2379/TCP,2380/TCP     25m
surreal-surreal   ClusterIP   10.102.51.152    <none>        8000/TCP              22m
surreal-tikv      ClusterIP   10.109.108.127   <none>        20160/TCP,20180/TCP   25m
```

You can connect to the Surreal cluster using the `CLUSTER-IP` and `PORT` By `Surreal CLI`

```bash
surreal sql --conn 'http://10.102.51.152:8000' --user root --pass surreal
```