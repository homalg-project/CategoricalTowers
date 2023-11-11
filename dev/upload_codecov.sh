#!/bin/bash

set -e

# get GPG key
curl -O https://keybase.io/codecovsecurity/pgp_keys.asc
# verify fingerprint
if ! gpg --import --import-options show-only --with-fingerprint pgp_keys.asc | grep "2703 4E7F DB85 0E0B BC2C  62FF 806B B28A ED77 9869"; then
    echo "Downloaded GPG key has wrong fingerprint"
    exit 1
fi
# import key into special keyring used by gpgv below
gpg --no-default-keyring --keyring ~/.gnupg/trustedkeys.kbx --import pgp_keys.asc

# get uploader with signatures
curl -O https://uploader.codecov.io/latest/linux/codecov
curl -O https://uploader.codecov.io/latest/linux/codecov.SHA256SUM
curl -O https://uploader.codecov.io/latest/linux/codecov.SHA256SUM.sig

# verify
gpgv codecov.SHA256SUM.sig codecov.SHA256SUM
shasum -a 256 -c codecov.SHA256SUM

# execute
chmod +x codecov
while ! ./codecov -Z -v -s ../ -F Algebroids; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F CategoriesWithAmbientObjects; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F ToolsForCategoricalTowers; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F CatReps; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F ExteriorPowersCategories; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F FiniteCocompletions; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F FpCategories; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F FunctorCategories; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F GradedCategories; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F InternalModules; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F IntrinsicCategories; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F IntrinsicGradedModules; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F IntrinsicModules; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F LazyCategories; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F Locales; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F PreSheaves; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F QuotientCategories; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F SubcategoriesForCAP; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F Toposes; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
while ! ./codecov -Z -v -s ../ -F ZariskiFrames; do
    echo "Codecov upload failed, retrying in 60s"
    sleep 60
done
