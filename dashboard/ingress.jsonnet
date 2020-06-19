local Kube= import "../template/ingress.jsonnet";
Kube.Ingress.new("dashboard", "example.com", "10.2.3.4", "dashboard")
