local Kube= import "../template/ingress.jsonnet";
[
  Kube._k.ingress.new("hello", "buc.local", "1.2.3.4", "hello")
]
