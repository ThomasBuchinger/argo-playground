{
  Service:: {
    new(fqdn, namespace=null, annotations={}): {
      apiVersion: "v1",
      kind: "Service",
      metadata: {
        name: std.strReplace(fqdn, ".", "-"),
        annotations: annotations
      } + ( if std.isString(namespace) then { namespace: namespace } else {}),
      spec: {
        type: "ExternalName",
        externalName: fqdn
      }
    }
  }
}
