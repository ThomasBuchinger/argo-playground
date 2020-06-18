local Kube= import "../template/ingress.jsonnet";
Kube.Ingress.new($ingress.name, $ingress.domain, $ingress.ip, $ingress.service_name)
