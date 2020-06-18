{
  Ingress:: {
    new(name, domain, ip, service_name, service_port=80): {
      apiVersion: "networking.k8s.io/v1beta1",
      kind: "Ingress",
      metadata: {
        name: name
      },
      spec: {
        rules: [
          {
            host: std.format("%s.%s", [name, domain]),
            http: {
              paths: [
                {
                  path: "/",
                  backend: {
                    serviceName: service_name,
                    servicePort: service_port
                  }
                }
              ]
            }
          },
          {
            host: std.format("%s.%s.%s", [name, ip, "nip.io"]),
            http: {
              paths: [
                {
                  path: "/",
                  backend: {
                    serviceName: service_name,
                    servicePort: service_port
                  }
                }
              ]
            }
          }
        ]      
      }
    }
  }
}
