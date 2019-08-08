# Gentics Mesh Helm Chart (Work In Progress)

This repository contains a Gentics Mesh Helm Chart for K8S.

## Work in Progress

This chart is based on https://github.com/cschockaert/getmesh-chart by Clément Schockaert and is currently work in progress. Please only use it as a reference for creating your own charts.

## TODO

* Better management of keystore, actually keystore is located in config folder (in order to share it with other replicas instances)
you have to manually create it, or let mesh create it but share keystore with other instances (with nfs volume like uploads for eg)

* Test MASTER mode only, actually this chart will create 1 master node and 2 replicas nodes, it's because there is some conflict when using
multiples master at the same time via mesh-ui and an unique service.

* Improve backup system (perhaps with the use of a dedicated node)

* Add more documentation

## Deployments

* mesh-ui
* mesh-backup-explorer

## StatefulSet

* mesh-replicas
* mesh-master

## Cron Jobs

* mesh-backup-job

## Dependencies

* elasticsearch stable chart

## Chart Information

The chart will create one master node (stateful set mesh-master, persistent volume for DATA).
It will create x replicas node (stateful set mesh-replicas, could be deployment instead of stateful set) theses replicas are ALWAYS starting with empty folder data
so they sync their data with the master node.

A _PV_ and _PVC_ will be created that points to a NFS server. You have to configure it in values to get this working.

The `default-distributed-db-config.json` is modified with master node name and other nodes are put to replicas.

The mesh-ui deployment is only active on master service via ingress: mesh.RELEASE-NAME.yourdomain.net

Replicas instances are accessible on replica service or with ingress: mesh-replicas.RELEASE-NAME.yourdomain.net
