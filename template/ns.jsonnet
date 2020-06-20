{
  Ns:: {
    new(name, istio_enabled=false): {
      apiVersion: "v1",
      kind: "Namespace",
      metadata: {
        name: name
        labels: if istio_enabled then { istio-injection: enabled } else {}
      }
    }
  }
}
