local Kube= (import "../../template/service_externalname.jsonnet") + (import "../../template/traefikroute.jsonnet");

std.manifestYamlStream(
  [
    Kube.Service.new(std.extVar("internal_url")),
    Kube.TraefikRoute.new(
      std.extVar("public_url"),
      std.extVar("public_url"),
      std.extVar("internal_url"),
      std.extVar("traefik_middleware"),
      std.extVar("traefik_certprovider"),
      ingress_class=std.extVar("ingress_class"),

      service_port=std.extVar("internal_port"),
      scheme=std.extVar("internal_protocol"),
      pass_host_header=false,
      entrypoints=["websecure"],
      annotations={},
      labels={}
    )
  ]
)

# Kube.TraefikRoute.new(
#   "public_url",
#   "public_url",
#   "internal_url",
#   "traefik_middleware",
#   "traefik_certprovider",
#   ingress_class="ingress_class",
#   scheme= "http"
# )