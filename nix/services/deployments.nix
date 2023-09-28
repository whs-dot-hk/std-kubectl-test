let
  inherit (inputs) kubenix;
in {
  test.test =
    (kubenix.evalModules {
      module = {kubenix, ...}: {
        imports = [
          kubenix.modules.k8s
        ];
        kubernetes.resources.pods = {
          test.spec.containers = {
            test.image = "nginx";
          };
        };
      };
    })
    .config
    .kubernetes
    .generated;
}
