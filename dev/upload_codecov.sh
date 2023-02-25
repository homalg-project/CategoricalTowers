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
./codecov -Z -v -s ../ -F Algebroids || (sleep 60; ./codecov -Z -v -s ../ -F Algebroids || (sleep 60; ./codecov -Z -v -s ../ -F Algebroids))
./codecov -Z -v -s ../ -F CategoriesWithAmbientObjects || (sleep 60; ./codecov -Z -v -s ../ -F CategoriesWithAmbientObjects || (sleep 60; ./codecov -Z -v -s ../ -F CategoriesWithAmbientObjects))
./codecov -Z -v -s ../ -F CategoryConstructor || (sleep 60; ./codecov -Z -v -s ../ -F CategoryConstructor || (sleep 60; ./codecov -Z -v -s ../ -F CategoryConstructor))
./codecov -Z -v -s ../ -F CatReps || (sleep 60; ./codecov -Z -v -s ../ -F CatReps || (sleep 60; ./codecov -Z -v -s ../ -F CatReps))
./codecov -Z -v -s ../ -F DiscreteCategories || (sleep 60; ./codecov -Z -v -s ../ -F DiscreteCategories || (sleep 60; ./codecov -Z -v -s ../ -F DiscreteCategories))
./codecov -Z -v -s ../ -F ExteriorPowersCategories || (sleep 60; ./codecov -Z -v -s ../ -F ExteriorPowersCategories || (sleep 60; ./codecov -Z -v -s ../ -F ExteriorPowersCategories))
./codecov -Z -v -s ../ -F FiniteCocompletion || (sleep 60; ./codecov -Z -v -s ../ -F FiniteCocompletion || (sleep 60; ./codecov -Z -v -s ../ -F FiniteCocompletion))
./codecov -Z -v -s ../ -F FunctorCategories || (sleep 60; ./codecov -Z -v -s ../ -F FunctorCategories || (sleep 60; ./codecov -Z -v -s ../ -F FunctorCategories))
./codecov -Z -v -s ../ -F GradedCategories || (sleep 60; ./codecov -Z -v -s ../ -F GradedCategories || (sleep 60; ./codecov -Z -v -s ../ -F GradedCategories))
./codecov -Z -v -s ../ -F InternalModules || (sleep 60; ./codecov -Z -v -s ../ -F InternalModules || (sleep 60; ./codecov -Z -v -s ../ -F InternalModules))
./codecov -Z -v -s ../ -F IntrinsicCategories || (sleep 60; ./codecov -Z -v -s ../ -F IntrinsicCategories || (sleep 60; ./codecov -Z -v -s ../ -F IntrinsicCategories))
./codecov -Z -v -s ../ -F IntrinsicGradedModules || (sleep 60; ./codecov -Z -v -s ../ -F IntrinsicGradedModules || (sleep 60; ./codecov -Z -v -s ../ -F IntrinsicGradedModules))
./codecov -Z -v -s ../ -F IntrinsicModules || (sleep 60; ./codecov -Z -v -s ../ -F IntrinsicModules || (sleep 60; ./codecov -Z -v -s ../ -F IntrinsicModules))
./codecov -Z -v -s ../ -F LazyCategories || (sleep 60; ./codecov -Z -v -s ../ -F LazyCategories || (sleep 60; ./codecov -Z -v -s ../ -F LazyCategories))
./codecov -Z -v -s ../ -F Locales || (sleep 60; ./codecov -Z -v -s ../ -F Locales || (sleep 60; ./codecov -Z -v -s ../ -F Locales))
./codecov -Z -v -s ../ -F PreSheaves || (sleep 60; ./codecov -Z -v -s ../ -F PreSheaves || (sleep 60; ./codecov -Z -v -s ../ -F PreSheaves))
./codecov -Z -v -s ../ -F SubcategoriesForCAP || (sleep 60; ./codecov -Z -v -s ../ -F SubcategoriesForCAP || (sleep 60; ./codecov -Z -v -s ../ -F SubcategoriesForCAP))
./codecov -Z -v -s ../ -F Toposes || (sleep 60; ./codecov -Z -v -s ../ -F Toposes || (sleep 60; ./codecov -Z -v -s ../ -F Toposes))
./codecov -Z -v -s ../ -F ZariskiFrames || (sleep 60; ./codecov -Z -v -s ../ -F ZariskiFrames || (sleep 60; ./codecov -Z -v -s ../ -F ZariskiFrames))
