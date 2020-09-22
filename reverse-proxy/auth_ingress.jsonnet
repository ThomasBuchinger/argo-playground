local Kube= import "../template/ingress.jsonnet";
Kube.Ingress.new(std.extVar("auth_name"), std.extVar("ingress_domain"), std.extVar("ingress_ip"), std.extVar("auth_service_name"), std.extVar("ingress_service_port"))
