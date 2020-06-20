local Kube= (import "../template/ingress.jsonnet") + (import "../template/ns.jsonnet");
Kube.Ns.new("istio-system")
