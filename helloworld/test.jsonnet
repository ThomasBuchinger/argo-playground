(import "../template/ingress.jsonnet") +
{
  _config:: {
    inress: {
      service_name: hello,
      service_port: 80,
      ip: 1.2.3.4,
      domain: "buc.local",
      name: "jsonnet",
    }
  }
}
