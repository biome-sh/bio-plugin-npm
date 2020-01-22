# shellcheck shell=bash

# Bio Plugin NPM
# Provides number of handy functions to use in your plan
#
# Variables:
# None
#
# Functions
# `do_npm_setup_cache` - caches npm repository into studio cache
# `do_npm_link_env` - creates /usr/bin/env
# `do_npm_unlink_env` - removes /usr/bin/env if we're created it

do_npm_setup_cache() {
    mkdir -p                           "/hab/cache/artifacts/studio_cache/npm"
    set_buildtime_env npm_config_cache "/hab/cache/artifacts/studio_cache/npm"
}

# Many scripts relay on /usr/bin/env
do_npm_link_env() {
    build_line "Linking $(pkg_path_for core/coreutils)/bin/env to /usr/bin/env"

    mkdir -p /usr/bin
    ln -svf "$(pkg_path_for core/coreutils)/bin/env" /usr/bin/env
}

do_npm_unlink_env() {
    if [[ $(readlink /usr/bin/env) = "$(pkg_path_for coreutils)/bin/env" ]]; then
        build_line "Removing the symlink we created for '/usr/bin/env'"
        rm /usr/bin/env
    fi
}
