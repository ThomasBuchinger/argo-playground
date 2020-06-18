local Kube= import "../template/ingress.jsonnet";
Kube.Ingress.new("hello2", "buc.local", "1.2.3.4", "hello")
