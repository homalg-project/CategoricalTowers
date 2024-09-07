###############################################################
# Test the symmetric rigid (co)closed correspondences between
# the terminal category with multiple objects and its opposite.
###############################################################

gap> START_TEST("TerminalCategoryMonoidal.tst");

gap> LoadPackage("LazyCategories", false);
true

#
gap> T := TerminalCategoryWithMultipleObjects();;
gap> L := LazyCategory( T : primitive_operations := true, optimize := 0 );;
gap> opposite := Opposite( L, "Opposite with all operations" );;
gap> opposite_primitive := Opposite( L, "Opposite with primitive operations" : only_primitive_operations := true );;

##############################################
# MonoidalCategoriesTensorProductOnObjectsAndTensorUnitTest
##############################################

gap> a := "a" / T / L;;
gap> b := "b" / T / L;;

gap> MonoidalCategoriesTensorProductOnObjectsAndTensorUnitTest( L, opposite, a, b );;
gap> MonoidalCategoriesTensorProductOnObjectsAndTensorUnitTest( L, opposite_primitive, a, b );;

gap> z := ZeroObject( L );;

gap> MonoidalCategoriesTensorProductOnObjectsAndTensorUnitTest( L, opposite, z, b );;
gap> MonoidalCategoriesTensorProductOnObjectsAndTensorUnitTest( L, opposite_primitive, z, b );;

gap> MonoidalCategoriesTensorProductOnObjectsAndTensorUnitTest( L, opposite, a, z );;
gap> MonoidalCategoriesTensorProductOnObjectsAndTensorUnitTest( L, opposite_primitive, a, z );;

##############################################
# MonoidalCategoriesTest
##############################################

gap> aT := "a" / T;;
gap> bT := "b" / T;;
gap> cT := "c" / T;;
gap> dT := "d" / T;;

gap> a := aT / L;;
gap> b := bT / L;;
gap> c := cT / L;;
gap> d := dT / L;;

gap> alpha := MorphismConstructor( aT, "f_ab", bT ) / L;;
gap> beta := MorphismConstructor( cT, "f_cd", dT ) / L;;

gap> MonoidalCategoriesTest( L, opposite, a, b, c, alpha, beta );;
gap> MonoidalCategoriesTest( L, opposite_primitive, a, b, c, alpha, beta );;

gap> z := ZeroObject( L );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> MonoidalCategoriesTest( L, opposite, z, a, a, alpha, beta );;
gap> MonoidalCategoriesTest( L, opposite_primitive, z, a, a, alpha, beta );;

gap> MonoidalCategoriesTest( L, opposite, a, z, z, beta, alpha );;
gap> MonoidalCategoriesTest( L, opposite_primitive, a, z, z, beta, alpha );;

##############################################
# AdditiveMonoidalCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> l := [ "b" / T / L, "c" / T / L, "d" / T / L ];;

gap> AdditiveMonoidalCategoriesTest( L, opposite_primitive, a, l );;
gap> AdditiveMonoidalCategoriesTest( L, opposite, a, l );;

##############################################
# BraidedMonoidalCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> b := "b" / T / L;;

gap> BraidedMonoidalCategoriesTest( L, opposite, a, b );;
gap> BraidedMonoidalCategoriesTest( L, opposite_primitive, a, b );;

gap> BraidedMonoidalCategoriesTest( L, opposite, b, a );;
gap> BraidedMonoidalCategoriesTest( L, opposite_primitive, b, a );;

gap> z := ZeroObject( L );;

gap> BraidedMonoidalCategoriesTest( L, opposite, z, a );;
gap> BraidedMonoidalCategoriesTest( L, opposite_primitive, z, a );;

gap> BraidedMonoidalCategoriesTest( L, opposite, a, z );;
gap> BraidedMonoidalCategoriesTest( L, opposite_primitive, a, z );;

##############################################
# ClosedMonoidalCategoriesTest
##############################################

gap> aT := "a" / T;;
gap> bT := "b" / T;;
gap> cT := "c" / T;;
gap> dT := "d" / T;;

gap> a := aT / L;;
gap> b := bT / L;;
gap> c := cT / L;;
gap> d := dT / L;;

gap> uT := TensorUnit( T );;

gap> a_product_bT := TensorProduct( aT, bT );;
gap> c_product_dT := TensorProduct( cT, dT );;

gap> hom_abT := InternalHom( aT, bT );;
gap> hom_cdT := InternalHom( cT, dT );;

gap> alphaT := MorphismConstructor( aT, "f_ab", bT );;
gap> betaT := MorphismConstructor( cT, "f_cd", dT );;
gap> gammaT := MorphismConstructor( a_product_bT, "f_abu", uT );;
gap> deltaT := MorphismConstructor( c_product_dT, "f_cdu", uT );;
gap> epsilonT := MorphismConstructor( uT, "f_uhomab", hom_abT );;
gap> zetaT := MorphismConstructor( uT, "f_uhomcd", hom_cdT );;

gap> alpha := AsMorphismInLazyCategory( a, alphaT, b );;
gap> beta := AsMorphismInLazyCategory( c, betaT, d );;
gap> gamma := AsMorphismInLazyCategory( TensorProduct( a, b ), gammaT, TensorUnit( L ) );;
gap> delta := AsMorphismInLazyCategory( TensorProduct( c, d ), deltaT, TensorUnit( L ) );;
gap> epsilon := AsMorphismInLazyCategory( TensorUnit( L ), epsilonT, InternalHom( a, b ) );;
gap> zeta := AsMorphismInLazyCategory( TensorUnit( L ), zetaT, InternalHom( c, d ) );;

gap> ClosedMonoidalCategoriesTest( L, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> ClosedMonoidalCategoriesTest( L, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;

gap> zT := ZeroObject( T );;
gap> z := zT / L;;

gap> z_product_aT := TensorProduct( zT, aT );;
gap> a_product_zT := TensorProduct( aT, zT );;

gap> hom_zaT := InternalHom( zT, aT );;
gap> hom_azT := InternalHom( aT, zT );;

gap> alphaT := MorphismConstructor( zT, "f_za", aT );;
gap> betaT := MorphismConstructor( aT, "f_az", zT );;
gap> gammaT := MorphismConstructor( z_product_aT, "f_zau", uT );;
gap> deltaT := MorphismConstructor( a_product_zT, "f_azu", uT );;
gap> epsilonT := MorphismConstructor( uT, "f_uhomza", hom_zaT );;
gap> zetaT := MorphismConstructor( uT, "f_uhomaz", hom_azT );;

gap> alpha := AsMorphismInLazyCategory( z, alphaT, a );;
gap> beta := AsMorphismInLazyCategory( a, betaT, z );;
gap> gamma := AsMorphismInLazyCategory( TensorProduct( z, a ), gammaT, TensorUnit( L ) );;
gap> delta := AsMorphismInLazyCategory( TensorProduct( a, z ), deltaT, TensorUnit( L ) );;
gap> epsilon := AsMorphismInLazyCategory( TensorUnit( L ), epsilonT, InternalHom( z, a ) );;
gap> zeta := AsMorphismInLazyCategory( TensorUnit( L ), zetaT, InternalHom( a, z ) );;

gap> ClosedMonoidalCategoriesTest( L, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> ClosedMonoidalCategoriesTest( L, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;

##############################################
# CoclosedMonoidalCategoriesTest
##############################################

gap> aT := "a" / T;;
gap> bT := "b" / T;;
gap> cT := "c" / T;;
gap> dT := "d" / T;;

gap> a := aT / L;;
gap> b := bT / L;;
gap> c := cT / L;;
gap> d := dT / L;;

gap> uT := TensorUnit( T );;

gap> a_product_bT := TensorProduct( aT, bT );;
gap> c_product_dT := TensorProduct( cT, dT );;

gap> cohom_abT := InternalCoHom( aT, bT );;
gap> cohom_cdT := InternalCoHom( cT, dT );;

gap> alphaT := MorphismConstructor( aT, "f_ab", bT );;
gap> betaT := MorphismConstructor( cT, "f_cd", dT );;
gap> gammaT := MorphismConstructor( uT, "f_uab", a_product_bT );;
gap> deltaT := MorphismConstructor( uT, "f_ucd", c_product_dT );;
gap> epsilonT := MorphismConstructor( cohom_abT, "f_cohomabu", uT );;
gap> zetaT := MorphismConstructor( cohom_cdT, "f_cohomcdu", uT);;

gap> alpha := AsMorphismInLazyCategory( a, alphaT, b );;
gap> beta := AsMorphismInLazyCategory( c, betaT, d );;
gap> gamma := AsMorphismInLazyCategory( TensorUnit( L ), gammaT, TensorProduct( a, b ) );;
gap> delta := AsMorphismInLazyCategory( TensorUnit( L ), deltaT, TensorProduct( c, d ) );;
gap> epsilon := AsMorphismInLazyCategory( InternalCoHom( a, b ), epsilonT, TensorUnit( L ) );;
gap> zeta := AsMorphismInLazyCategory( InternalCoHom( c, d ), zetaT, TensorUnit( L ) );;

gap> CoclosedMonoidalCategoriesTest( L, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CoclosedMonoidalCategoriesTest( L, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;

gap> zT := ZeroObject( T );;
gap> z := zT / L;;

gap> z_product_aT := TensorProduct( zT, aT );;
gap> a_product_zT := TensorProduct( aT, zT );;

gap> cohom_zaT := InternalCoHom( zT, aT );;
gap> cohom_azT := InternalCoHom( aT, zT );;

gap> alphaT := MorphismConstructor( zT, "f_za", aT );;
gap> betaT := MorphismConstructor( aT, "f_az", zT );;
gap> gammaT := MorphismConstructor( uT, "f_uza", z_product_aT );;
gap> deltaT := MorphismConstructor( uT, "f_uaz", a_product_zT );;
gap> epsilonT := MorphismConstructor( cohom_zaT, "f_cohomzau", uT );;
gap> zetaT := MorphismConstructor( cohom_azT, "cohomazu", uT );;

gap> alpha := AsMorphismInLazyCategory( z, alphaT, a );;
gap> beta := AsMorphismInLazyCategory( a, betaT, z );;
gap> gamma := AsMorphismInLazyCategory( TensorUnit( L ), gammaT, TensorProduct( z, a ) );;
gap> delta := AsMorphismInLazyCategory( TensorUnit( L ), deltaT, TensorProduct( a, z ) );;
gap> epsilon := AsMorphismInLazyCategory( InternalCoHom( z, a ), epsilonT, TensorUnit( L ) );;
gap> zeta := AsMorphismInLazyCategory( InternalCoHom( a, z ), zetaT, TensorUnit( L ) );;

gap> CoclosedMonoidalCategoriesTest( L, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CoclosedMonoidalCategoriesTest( L, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;

##############################################
# RigidSymmetricClosedMonoidalCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> b := "b" / T / L;;
gap> c := "c" / T / L;;
gap> d := "d" / T / L;;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricClosedMonoidalCategoriesTest( L, opposite, a, b, c, d, alpha );;
gap> RigidSymmetricClosedMonoidalCategoriesTest( L, opposite_primitive, a, b, c, d, alpha );;

gap> z := ZeroObject( L );;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricClosedMonoidalCategoriesTest( L, opposite, z, b, c, z, alpha );;
gap> RigidSymmetricClosedMonoidalCategoriesTest( L, opposite_primitive, z, b, c, z, alpha );;

##############################################
# RigidSymmetricCoclosedMonoidalCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> b := "b" / T / L;;
gap> c := "c" / T / L;;
gap> d := "d" / T / L;;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricCoclosedMonoidalCategoriesTest( L, opposite, a, b, c, d, alpha );;
gap> RigidSymmetricCoclosedMonoidalCategoriesTest( L, opposite_primitive, a, b, c, d, alpha );;

gap> z := ZeroObject( L );;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricCoclosedMonoidalCategoriesTest( L, opposite, a, b, c, d, alpha );;
gap> RigidSymmetricCoclosedMonoidalCategoriesTest( L, opposite_primitive, a, b, c, d, alpha );;

##############################################

gap> STOP_TEST("TerminalCategoryMonoidal.tst", 1);
