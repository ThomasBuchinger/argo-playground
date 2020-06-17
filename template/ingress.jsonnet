{
  ingress: {
    apiVersion: "networking.k8s.io/v1beta1",
    kind: "Ingress",
    metadata: {
      name: $._config.ingress.name
    },
    spec: {
      rules: [
        {
          host: std.format("%s.%s", ($._config.ingress.name, $._config.ingress.domain)),
          http: {
            paths: [
              {
                path: "/",
                backend: {
                  serviceName: $._config.ingress.service_name,
                  servicePort: $._config.ingress.service_port
                }
              }
            ]
          }
        },
        {
          host: std.format("%s.%s.%s", ($._config.ingress.name, $._config.ingress.ip, "nip.io")),
          http: {
            paths: [
              {
                path: "/",
                backend: {
                  serviceName: $._config.ingress.service_name,
                  servicePort: $._config.ingress.service_port
                }
              }
            ]
          }
        }
      ]      
    }
  }
}
