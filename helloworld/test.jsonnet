(import "../template/ingress.jsonnet") +
{
  $.kube.ingress.new("hello", "buc.local", "1.2.3.4", "hello")
}
