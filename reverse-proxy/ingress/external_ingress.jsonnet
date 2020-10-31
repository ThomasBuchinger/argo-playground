local Kube= (import "../../template/service_externalname.jsonnet") + (import "../../template/traefikroute.jsonnet");

function(
  public_url,
  internal_url,
  traefik_middleware,
  traefik_certprovider,

  ingress_class=null,
  pass_host_header=false,
  internal_port=80,
  internal_protocol=null,
  namespace="traefik"
)

[
  Kube.Service.new(internal_url),
  Kube.TraefikRoute.new(
    public_url,
    public_url,
    internal_url,
    traefik_middleware,
    traefik_certprovider,

    ingress_class=ingress_class,
    service_port=internal_port,
    scheme=internal_protocol,
    pass_host_header=(pass_host_header == 't'),
    entrypoints=["websecure"],
    annotations={},
    labels={},
    namespace=namespace
  )
]

    

