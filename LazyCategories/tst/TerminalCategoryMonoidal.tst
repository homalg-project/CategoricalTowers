###############################################################
# Test the symmetric rigid (co)closed correspondences between
# the terminal category with multiple objects and its opposite.
###############################################################

gap> START_TEST("TerminalCategoryMonoidal.tst");

gap> LoadPackage("LazyCategories", false);
true

gap> T := TerminalCategoryWithMultipleObjects();;

gap> L := LazyCategory( T : primitive_operations := true, optimize := 0 );;

##############################################
# MonoidalCategoriesTensorProductAndUnitTest
##############################################

gap> a := "a" / T / L;;
gap> b := "b" / T / L;;

gap> MonoidalCategoriesTensorProductAndUnitTest( L, a, b );;
gap> MonoidalCategoriesTensorProductAndUnitTest( L, a, b : only_primitive_operations := true );;

gap> z := ZeroObject( L );;

gap> MonoidalCategoriesTensorProductAndUnitTest( L, z, b );;
gap> MonoidalCategoriesTensorProductAndUnitTest( L, z, b : only_primitive_operations := true );;

gap> MonoidalCategoriesTensorProductAndUnitTest( L, a, z );;
gap> MonoidalCategoriesTensorProductAndUnitTest( L, a, z : only_primitive_operations := true );;

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

gap> MonoidalCategoriesTest( L, a, b, c, alpha, beta );;
gap> MonoidalCategoriesTest( L, a, b, c, alpha, beta : only_primitive_operations := true );;

gap> z := ZeroObject( L );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> MonoidalCategoriesTest( L, z, a, a, alpha, beta );;
gap> MonoidalCategoriesTest( L, z, a, a, alpha, beta : only_primitive_operations := true );;

gap> MonoidalCategoriesTest( L, a, z, z, beta, alpha );;
gap> MonoidalCategoriesTest( L, a, z, z, beta, alpha : only_primitive_operations := true );;

##############################################
# AdditiveMonoidalCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> l := [ "b" / T / L, "c" / T / L, "d" / T / L ];;

gap> AdditiveMonoidalCategoriesTest( L, a, l : only_primitive_operations := true );;
gap> AdditiveMonoidalCategoriesTest( L, a, l );;

##############################################
# BraidedMonoidalCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> b := "b" / T / L;;

gap> BraidedMonoidalCategoriesTest( L, a, b );;
gap> BraidedMonoidalCategoriesTest( L, a, b : only_primitive_operations := true );;

gap> BraidedMonoidalCategoriesTest( L, b, a );;
gap> BraidedMonoidalCategoriesTest( L, b, a : only_primitive_operations := true );;

gap> z := ZeroObject( L );;

gap> BraidedMonoidalCategoriesTest( L, z, a );;
gap> BraidedMonoidalCategoriesTest( L, z, a : only_primitive_operations := true );;

gap> BraidedMonoidalCategoriesTest( L, a, z );;
gap> BraidedMonoidalCategoriesTest( L, a, z : only_primitive_operations := true );;

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

gap> ClosedMonoidalCategoriesTest( L, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> ClosedMonoidalCategoriesTest( L, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

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

gap> ClosedMonoidalCategoriesTest( L, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> ClosedMonoidalCategoriesTest( L, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

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

gap> CoclosedMonoidalCategoriesTest( L, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CoclosedMonoidalCategoriesTest( L, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

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

gap> CoclosedMonoidalCategoriesTest( L, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CoclosedMonoidalCategoriesTest( L, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

##############################################
# RigidSymmetricClosedMonoidalCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> b := "b" / T / L;;
gap> c := "c" / T / L;;
gap> d := "d" / T / L;;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricClosedMonoidalCategoriesTest( L, a, b, c, d, alpha );;
gap> RigidSymmetricClosedMonoidalCategoriesTest( L, a, b, c, d, alpha : only_primitive_operations := true );;

gap> z := ZeroObject( L );;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricClosedMonoidalCategoriesTest( L, z, b, c, z, alpha );;
gap> RigidSymmetricClosedMonoidalCategoriesTest( L, z, b, c, z, alpha : only_primitive_operations := true );;

##############################################
# RigidSymmetricCoclosedMonoidalCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> b := "b" / T / L;;
gap> c := "c" / T / L;;
gap> d := "d" / T / L;;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricCoclosedMonoidalCategoriesTest( L, a, b, c, d, alpha );;
gap> RigidSymmetricCoclosedMonoidalCategoriesTest( L, a, b, c, d, alpha : only_primitive_operations := true );;

gap> z := ZeroObject( L );;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricCoclosedMonoidalCategoriesTest( L, a, b, c, d, alpha );;
gap> RigidSymmetricCoclosedMonoidalCategoriesTest( L, a, b, c, d, alpha : only_primitive_operations := true );;

##############################################

gap> STOP_TEST("TerminalCategoryMonoidal.tst", 1);
