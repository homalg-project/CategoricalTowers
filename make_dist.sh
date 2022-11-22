#!/bin/bash

set -e

packages="FiniteCocompletion PreSheaves "

base_dir="$PWD"

for pkg in ${packages}; do
  ./release-gap-package --skip-existing-release --srcdir ${base_dir}/${pkg} --webdir ${base_dir}/gh-pages/${pkg} --update-script ${base_dir}/gh-pages/update.g $@
done
