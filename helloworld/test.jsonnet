(import "../template/ingress.jsonnet") +
[
  $._k.ingress.new("hello", "buc.local", "1.2.3.4", "hello")
]
