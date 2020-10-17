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
        labels={},
        namespace=null
      ): {
      
      apiVersion: "traefik.containo.us/v1alpha1",
      kind: "IngressRoute",
      metadata: {
        name: name + "-route",
        labels: labels,
        annotations: annotations + ( if std.isString(ingress_class) then { "kubernetes.io/ingress.class": ingress_class } else {}),
      } + ( if std.isString(namespace) then { namespace: namespace } else {}),
      spec: {
        entryPoints: entrypoints,
        routes: [
          {
            kind: "Rule",
            match:  match_type+"(`" + rule +"`)",
            services: [
              {
                name: std.strReplace(service_name, ".", "-"),
                port: if std.isNumber(service_port) then service_port else std.parseInt(service_port),
                passHostHeader: pass_host_header
              }
              + ( if std.isString(scheme)       then { scheme: scheme     } else {}),
            ],
            middlewares: [
              {
                name: middleware
              }
            ]
          }
        ],
        tls: {
          certResolver: cert_resolver
        }

      }
    }
  }
}

