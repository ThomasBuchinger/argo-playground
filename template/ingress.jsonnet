{
  ingress: {
    apiVersion: "networking.k8s.io/v1beta1",
    kind: "Ingress",
    metadata:
      name: $._config.inrgess.name
    spec:
      rules: [
        {
          host: std.format("%s.%s", $._config.inrgess.name, $._config.inrgess.domain),
          http:
            paths: [
              {
                path: "/",
                backend:
                  serviceName: $._config.inrgess.service_name,
                  servicePort: $._config.inrgess.service_port
              }
            ]
        },
        {
          host: std.format("%s.%s.%s", $._config.inrgess.name, $._config.inrgess.ip, "nip.io"),
          http:
            paths: [
              {
                path: "/",
                backend:
                  serviceName: $._config.inrgess.service_name,
                  servicePort: $._config.inrgess.service_port
              }
            ]
        }
      ]
    }
  }
}
