local Kube= import "../template/ingress.jsonnet";
Kube.Ingress.new(std.extVar("ingress_name"), std.extVar("ingress_domain"), std.extVar("ingress_ip"), std.extVar("ingress_service_name"), std.extVar("ingress_service_port"))
