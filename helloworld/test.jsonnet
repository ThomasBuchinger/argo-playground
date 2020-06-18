local Kube= import "../template/ingress.jsonnet";
Kube.Ingress.new($ingress_name, $ingress_domain, $ingress_ip, $ingress_service_name)
