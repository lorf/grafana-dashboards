# Grafana Kubernetes dashboards

* [k8s-containers.json](k8s-containers.json) - Kubernetes containers in depth.
  It's loosely based on
  [kubernetes-app](https://github.com/grafana/kubernetes-app) K8s Containers
  dashboard fixing many of it's bugs. Requiremets:
   * Grafana 5.3.0
   * Prometheus
   * Metrics from Kubernetes built-in cAdvisor.
* [k8s-cluster-converted.json](k8s-cluster-converted.json) - Kubernetes cluster
  overview. Converted from
  [kubernetes-app](https://github.com/grafana/kubernetes-app) K8s Cluster
  dashboard to use standalone. Requirements:
   * Grafana 5.0.0
   * Prometheus
   * Metrics from node-exporter. It either should be installed on server or
     deployed to the cluster as a DaemonSet, e.g. using
     [this](https://github.com/helm/charts/tree/master/stable/prometheus-node-exporter)
     helm chart.
   * Metrics from
     [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics).
     It should be
     [deployed](https://github.com/kubernetes/kube-state-metrics#kubernetes-deployment)
     to cluster.
* [k8s-deployments-converted.json](k8s-deployments-converted.json) - Kubernetes
  deployments overview. Converted from
  [kubernetes-app](https://github.com/grafana/kubernetes-app) K8s Deployments
  dashboard to use standalone. Requirements:
   * Grafana 5.0.0
   * Prometheus
   * Metrics from node-exporter. It either should be installed on server or
     deployed to the cluster as a DaemonSet, e.g. using
     [this](https://github.com/helm/charts/tree/master/stable/prometheus-node-exporter)
     helm chart.
   * Metrics from
     [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics).
     It should be
     [deployed](https://github.com/kubernetes/kube-state-metrics#kubernetes-deployment)
     to cluster.
