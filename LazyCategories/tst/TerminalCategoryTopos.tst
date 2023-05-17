###############################################################
# Test the (co)cartesian (co)closed correspondences between
# the terminal category with multiple objects and its opposite.
###############################################################

gap> START_TEST("TerminalCategoryTopos.tst");

gap> LoadPackage("LazyCategories", false);
true
gap> LoadPackage("Toposes", false);
true

#
gap> T := TerminalCategoryWithMultipleObjects();;
gap> L := LazyCategory( T : primitive_operations := true, optimize := 0 );;
gap> opposite := Opposite( L, "Opposite with all operations" );;
gap> opposite_primitive := Opposite( L, "Opposite with primitive operations" : only_primitive_operations := true );;

##############################################
# CartesianCategoriesTest
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

gap> CartesianCategoriesTest( L, opposite, a, b, c, alpha, beta );;
gap> CartesianCategoriesTest( L, opposite_primitive, a, b, c, alpha, beta );;

gap> z := ZeroObject( L );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> CartesianCategoriesTest( L, opposite, z, a, a, alpha, beta );;
gap> CartesianCategoriesTest( L, opposite_primitive, z, a, a, alpha, beta );;

gap> CartesianCategoriesTest( L, opposite, a, z, z, beta, alpha );;
gap> CartesianCategoriesTest( L, opposite_primitive, a, z, z, beta, alpha );;

##############################################
# CoartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> a := aT / L;;
gap> b := bT / L;;
gap> c := cT / L;;
gap> d := dT / L;;

gap> alpha := MorphismConstructor( aT, "f_ab", bT ) / L;;
gap> beta := MorphismConstructor( cT, "f_cd", dT ) / L;;

gap> CocartesianCategoriesTest( L, opposite, a, b, c, alpha, beta );;
gap> CocartesianCategoriesTest( L, opposite_primitive, a, b, c, alpha, beta );;

gap> z := ZeroObject( L );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> CocartesianCategoriesTest( L, opposite, z, a, a, alpha, beta );;
gap> CocartesianCategoriesTest( L, opposite_primitive, z, a, a, alpha, beta );;

gap> CocartesianCategoriesTest( L, opposite, a, z, z, beta, alpha );;
gap> CocartesianCategoriesTest( L, opposite_primitive, a, z, z, beta, alpha );;

##############################################
# BraidedCartesianCategoriesTest
##############################################

gap> aT := "a" / T;;
gap> bT := "b" / T;;

gap> a := aT / L;;
gap> b := bT / L;;

gap> BraidedCartesianCategoriesTest( L, opposite, a, b );;
gap> BraidedCartesianCategoriesTest( L, opposite_primitive, a, b );;

gap> BraidedCartesianCategoriesTest( L, opposite, b, a );;
gap> BraidedCartesianCategoriesTest( L, opposite_primitive, b, a );;

gap> z := ZeroObject( L );;

gap> BraidedCartesianCategoriesTest( L, opposite, z, a );;
gap> BraidedCartesianCategoriesTest( L, opposite_primitive, z, a );;

gap> BraidedCartesianCategoriesTest( L, opposite, a, z );;
gap> BraidedCartesianCategoriesTest( L, opposite_primitive, a, z );;

##############################################
# CodistributiveCocartesianCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> l := [ "b" / T / L, "c" / T / L, "d" / T / L ];;

gap> CodistributiveCocartesianCategoriesTest( L, opposite_primitive, a, l );;
gap> CodistributiveCocartesianCategoriesTest( L, opposite, a, l );;

##############################################
# DistributiveCartesianCategoriesTest
##############################################

gap> a := "a" / T / L;;
gap> l := [ "b" / T / L, "c" / T / L, "d" / T / L ];;

gap> DistributiveCartesianCategoriesTest( L, opposite_primitive, a, l );;
gap> DistributiveCartesianCategoriesTest( L, opposite, a, l );;

##############################################
# BraidedCocartesianCategoriesTest
##############################################

gap> aT := "a" / T;;
gap> bT := "b" / T;;

gap> a := aT / L;;
gap> b := bT / L;;

gap> BraidedCocartesianCategoriesTest( L, opposite, a, b );;
gap> BraidedCocartesianCategoriesTest( L, opposite_primitive, a, b );;

gap> BraidedCocartesianCategoriesTest( L, opposite, b, a );;
gap> BraidedCocartesianCategoriesTest( L, opposite_primitive, b, a );;

gap> z := ZeroObject( L );;

gap> BraidedCocartesianCategoriesTest( L, opposite, z, a );;
gap> BraidedCocartesianCategoriesTest( L, opposite_primitive, z, a );;

gap> BraidedCocartesianCategoriesTest( L, opposite, a, z );;
gap> BraidedCocartesianCategoriesTest( L, opposite_primitive, a, z );;

##############################################
# CartesianClosedCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> a := aT / L;;
gap> b := bT / L;;
gap> c := cT / L;;
gap> d := dT / L;;

gap> tT := TerminalObject( T );;

gap> a_product_bT := DirectProduct( aT, bT );;
gap> c_product_dT := DirectProduct( cT, dT );;

gap> exp_abT := Exponential( aT, bT );;
gap> exp_cdT := Exponential( cT, dT );;

gap> alphaT := MorphismConstructor( aT, "f_ab", bT );;
gap> betaT := MorphismConstructor( cT, "f_cd", dT );;
gap> gammaT := MorphismConstructor( a_product_bT, "f_abt", tT );;
gap> deltaT := MorphismConstructor( c_product_dT, "f_cdt", tT );;
gap> epsilonT := MorphismConstructor( tT, "f_texpab", exp_abT );;
gap> zetaT := MorphismConstructor( tT, "f_texpcd", exp_cdT );;

gap> alpha := AsMorphismInLazyCategory( a, alphaT, b );;
gap> beta := AsMorphismInLazyCategory( c, betaT, d );;
gap> gamma := AsMorphismInLazyCategory( DirectProduct( a, b ), gammaT, TerminalObject( L ) );;
gap> delta := AsMorphismInLazyCategory( DirectProduct( c, d ), deltaT, TerminalObject( L ) );;
gap> epsilon := AsMorphismInLazyCategory( TerminalObject( L ), epsilonT, Exponential( a, b ) );;
gap> zeta := AsMorphismInLazyCategory( TerminalObject( L ), zetaT, Exponential( c, d ) );;

gap> CartesianClosedCategoriesTest( L, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( L, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;

gap> zT := ZeroObject( T );;
gap> z := zT / L;;

gap> z_product_aT := DirectProduct( zT, aT );;
gap> a_product_zT := DirectProduct( aT, zT );;

gap> exp_zaT := Exponential( zT, aT );;
gap> exp_azT := Exponential( aT, zT );;

gap> alphaT := MorphismConstructor( zT, "f_za", aT );;
gap> betaT := MorphismConstructor( aT, "f_az", zT );;
gap> gammaT := MorphismConstructor( z_product_aT, "f_zat", tT );;
gap> deltaT := MorphismConstructor( a_product_zT, "f_azt", tT );;
gap> epsilonT := MorphismConstructor( tT, "f_texpza", exp_zaT );;
gap> zetaT := MorphismConstructor( tT, "f_texpaz", exp_azT );;

gap> alpha := AsMorphismInLazyCategory( z, alphaT, a );;
gap> beta := AsMorphismInLazyCategory( a, betaT, z );;
gap> gamma := AsMorphismInLazyCategory( DirectProduct( z, a ), gammaT, TerminalObject( L ) );;
gap> delta := AsMorphismInLazyCategory( DirectProduct( a, z ), deltaT, TerminalObject( L ) );;
gap> epsilon := AsMorphismInLazyCategory( TerminalObject( L ), epsilonT, Exponential( z, a ) );;
gap> zeta := AsMorphismInLazyCategory( TerminalObject( L ), zetaT, Exponential( a, z ) );;

gap> CartesianClosedCategoriesTest( L, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( L, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;

##############################################
# CocartesianCoclosedCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> a := aT / L;;
gap> b := bT / L;;
gap> c := cT / L;;
gap> d := dT / L;;

gap> iT := InitialObject( T );;

gap> a_product_bT := Coproduct( aT, bT );;
gap> c_product_dT := Coproduct( cT, dT );;

gap> coexp_abT := Coexponential( aT, bT );;
gap> coexp_cdT := Coexponential( cT, dT );;

gap> alphaT := MorphismConstructor( aT, "f_ab", bT );;
gap> betaT := MorphismConstructor( cT, "f_cd", dT );;
gap> gammaT := MorphismConstructor( iT, "f_iab", a_product_bT );;
gap> deltaT := MorphismConstructor( iT, "f_icd", c_product_dT );;
gap> epsilonT := MorphismConstructor( coexp_abT, "f_coexpabi", iT );;
gap> zetaT := MorphismConstructor( coexp_cdT, "f_coexpcdi", iT );;

gap> alpha := AsMorphismInLazyCategory( a, alphaT, b );;
gap> beta := AsMorphismInLazyCategory( c, betaT, d );;
gap> gamma := AsMorphismInLazyCategory( InitialObject( L ), gammaT, Coproduct( a, b ) );;
gap> delta := AsMorphismInLazyCategory( InitialObject( L ), deltaT, Coproduct( c, d ) );;
gap> epsilon := AsMorphismInLazyCategory( Coexponential( a, b ), epsilonT, InitialObject( L ) );;
gap> zeta := AsMorphismInLazyCategory( Coexponential( c, d ), zetaT, InitialObject( L ) );;

gap> CocartesianCoclosedCategoriesTest( L, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CocartesianCoclosedCategoriesTest( L, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;

gap> zT := ZeroObject( T );;
gap> z := zT / L;;

gap> z_product_aT := Coproduct( zT, aT );;
gap> a_product_zT := Coproduct( aT, zT );;

gap> coexp_zaT := Coexponential( zT, aT );;
gap> coexp_azT := Coexponential( aT, zT );;

gap> alphaT := MorphismConstructor( zT, "f_za", aT );;
gap> betaT := MorphismConstructor( aT, "f_az", zT );;
gap> gammaT := MorphismConstructor( iT, "f_iza", z_product_aT );;
gap> deltaT := MorphismConstructor( iT, "f_iaz", a_product_zT );;
gap> epsilonT := MorphismConstructor( coexp_zaT, "f_coexpzai", iT );;
gap> zetaT := MorphismConstructor( coexp_azT, "coexpazi", iT );;

gap> alpha := AsMorphismInLazyCategory( z, alphaT, a );;
gap> beta := AsMorphismInLazyCategory( a, betaT, z );;
gap> gamma := AsMorphismInLazyCategory( InitialObject( L ), gammaT, Coproduct( z, a ) );;
gap> delta := AsMorphismInLazyCategory( InitialObject( L ), deltaT, Coproduct( a, z ) );;
gap> epsilon := AsMorphismInLazyCategory( Coexponential( z, a ), epsilonT, InitialObject( L ) );;
gap> zeta := AsMorphismInLazyCategory( Coexponential( a, z ), zetaT, InitialObject( L ) );;

gap> CocartesianCoclosedCategoriesTest( L, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CocartesianCoclosedCategoriesTest( L, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;

##############################################

gap> STOP_TEST("TerminalCategoryTopos.tst", 1);
