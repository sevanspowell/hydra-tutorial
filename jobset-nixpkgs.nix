# nixpkgs-ci.nix

{ supportedSystems ? ["i686-linux" /*"x86_64-linux"*/ ] }:

with (import <nixpkgs/pkgs/top-level/release-lib.nix> { inherit supportedSystems; });

rec {
  # Simply assign a derivation to an attribute to have it built.
  hello_world_x = (pkgsFor "x86_64-linux").hello;

  # 'hydraJob' strips all non-essential attributes.
  # hello_world_2 = pkgs.lib.hydraJob pkgs_x86_64_linux.hello;

  # Generate one attribute per supported platform.
  # hello_world_3 = pkgs.lib.genAttrs supportedSystems (system: (pkgsFor system).hello);

} // mapTestOn {

  # Fancy shortcut to generate one attribute per supported platform.
  # hello = supportedSystems;

}
