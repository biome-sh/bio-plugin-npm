# Biome Plugin NPM

Provides number of handy functions to use in your plan

## Usage

```
pkg_build_deps+=(biome/bio-plugin-npm)

do_setup_environment() {
  source "$(pkg_path_for biome/bio-plugin-npm)/lib/plugin.sh"

  # Set npm repository into studio cache
  do_npm_setup_cache

  # Make /usr/bin/env
  do_npm_link_env
}

do_after() {
  # Remove /usr/bin/env
  do_npm_unlink_env
}
```

Consider source [bio-plugin-npm](habitat/lib/plugin.sh)
