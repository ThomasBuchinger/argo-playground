{
  TraefikRoute:: {
    new(
        name,
        rule,
        service_name,
        middleware,
        cert_resolver,

        service_port=null,
        scheme=null,
        ingress_class=null,
        match_type="Host",
        pass_host_header=false,
        entrypoints=["websecure"],
        annotations={},
        labels={}
      ): {
      
      apiVersion: "v1",
      kind: "Namespace",
      metadata: {
        name: name + "-route",
        labels: labels,
        annotations: annotations + ( if std.isString(ingress_class) then { "kubernetes.io/ingress.class": ingress_class } else {}),
      },
      spec: {
        entryPoints: entrypoints,
        routes: [
          {
            kind: "Rule",
            match:  match_type+"(`" + rule +"`)",
            services: [
              {
                name: service_name,
                passHostHeader: pass_host_header
              }
              + ( if std.isString(scheme)       then { scheme: scheme     } else {})
              + ( if std.isString(service_port) then { port: service_port } else {}),
            ],
            middlewares: [ { name: middleware }],
            tls: {
              certResolver: cert_resolver
            }
          }
        ]

      }
    }
  }
}

