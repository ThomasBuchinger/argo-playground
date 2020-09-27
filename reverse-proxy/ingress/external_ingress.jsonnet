local Kube= (import "../../template/service_externalname.jsonnet") + (import "../../template/traefikroute.jsonnet");

function(
  public_url,
  internal_url,
  traefik_middleware,
  traefik_certprovider,

  ingress_class=null,
  internal_port=null,
  internal_protocol=null
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
    pass_host_header=false,
    entrypoints=["websecure"],
    annotations={},
    labels={}
  )
]

    

