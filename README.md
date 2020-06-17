# ArgoCD Apps
Addon Applications for Kubernetes. Everything that is not important enough to make it into the default.

May rely on Inrgess and PersistentStorage.

## HelloWorld
Hello World Status Page. Theoretically provides status on the cluster setup, but we do have a dashboard anyway...

## Jaeger
Default Jaeger installation for the cluster. Deployed as CustomResource (https://operatorhub.io/operator/jaeger)

## Istio
Istio CR for the Operator (https://operatorhub.io/operator/istio) and cluster specific settings

## Kiali
Kiali CR for the Operator (https://operatorhub.io/operator/kiali) and configuration to external Jaeger
