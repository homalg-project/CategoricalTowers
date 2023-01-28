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
./codecov -Z -v -s ../ -F FiniteCocompletion || (sleep 30; ./codecov -Z -v -s ../ -F FiniteCocompletion || (sleep 30; ./codecov -Z -v -s ../ -F FiniteCocompletion))
./codecov -Z -v -s ../ -F PreSheaves || (sleep 30; ./codecov -Z -v -s ../ -F PreSheaves || (sleep 30; ./codecov -Z -v -s ../ -F PreSheaves))
./codecov -Z -v -s ../ -F CategoryConstructor || (sleep 30; ./codecov -Z -v -s ../ -F CategoryConstructor || (sleep 30; ./codecov -Z -v -s ../ -F CategoryConstructor))
./codecov -Z -v -s ../ -F Toposes || (sleep 30; ./codecov -Z -v -s ../ -F Toposes || (sleep 30; ./codecov -Z -v -s ../ -F Toposes))
./codecov -Z -v -s ../ -F Locales || (sleep 30; ./codecov -Z -v -s ../ -F Locales || (sleep 30; ./codecov -Z -v -s ../ -F Locales))
./codecov -Z -v -s ../ -F SubcategoriesForCAP || (sleep 30; ./codecov -Z -v -s ../ -F SubcategoriesForCAP || (sleep 30; ./codecov -Z -v -s ../ -F SubcategoriesForCAP))
./codecov -Z -v -s ../ -F LazyCategories || (sleep 30; ./codecov -Z -v -s ../ -F LazyCategories || (sleep 30; ./codecov -Z -v -s ../ -F LazyCategories))
./codecov -Z -v -s ../ -F ZariskiFrames || (sleep 30; ./codecov -Z -v -s ../ -F ZariskiFrames || (sleep 30; ./codecov -Z -v -s ../ -F ZariskiFrames))
./codecov -Z -v -s ../ -F IntrinsicCategories || (sleep 30; ./codecov -Z -v -s ../ -F IntrinsicCategories || (sleep 30; ./codecov -Z -v -s ../ -F IntrinsicCategories))
./codecov -Z -v -s ../ -F CategoriesWithAmbientObjects || (sleep 30; ./codecov -Z -v -s ../ -F CategoriesWithAmbientObjects || (sleep 30; ./codecov -Z -v -s ../ -F CategoriesWithAmbientObjects))
./codecov -Z -v -s ../ -F IntrinsicModules || (sleep 30; ./codecov -Z -v -s ../ -F IntrinsicModules || (sleep 30; ./codecov -Z -v -s ../ -F IntrinsicModules))
./codecov -Z -v -s ../ -F ExteriorPowersCategories || (sleep 30; ./codecov -Z -v -s ../ -F ExteriorPowersCategories || (sleep 30; ./codecov -Z -v -s ../ -F ExteriorPowersCategories))
