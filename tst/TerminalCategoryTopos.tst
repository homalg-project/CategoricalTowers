###############################################################
# Test the (co)cartesian (co)closed correspondences between
# the terminal category with multiple objects and its opposite.
###############################################################

gap> START_TEST("TerminalCategoryTopos.tst");

gap> LoadPackage("CategoryConstructor", false);
true
gap> LoadPackage("Toposes", ">= 2022.04-29", false);
true

gap> T := TerminalCategoryWithMultipleObjects( );;

##############################################
# CartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;

gap> CartesianCategoriesTest( T, a, b, c, alpha, beta );;
gap> CartesianCategoriesTest( T, a, b, c, alpha, beta : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> CartesianCategoriesTest( T, z, a, a, alpha, beta );;
gap> CartesianCategoriesTest( T, z, a, a, alpha, beta : only_primitive_operations := true );;

gap> CartesianCategoriesTest( T, a, z, z, beta, alpha );;
gap> CartesianCategoriesTest( T, a, z, z, beta, alpha : only_primitive_operations := true );;

##############################################
# CoartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;

gap> CocartesianCategoriesTest( T, a, b, c, alpha, beta );;
gap> CocartesianCategoriesTest( T, a, b, c, alpha, beta : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> CocartesianCategoriesTest( T, z, a, a, alpha, beta );;
gap> CocartesianCategoriesTest( T, z, a, a, alpha, beta : only_primitive_operations := true );;

gap> CocartesianCategoriesTest( T, a, z, z, beta, alpha );;
gap> CocartesianCategoriesTest( T, a, z, z, beta, alpha : only_primitive_operations := true );;

##############################################
# DistributiveCartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> L := [ "b" / T, "c" / T, "d" / T ];;

gap> DistributiveCartesianCategoriesTest( T, a, L );;
gap> DistributiveCartesianCategoriesTest( T, a, L : only_primitive_operations := true );;

##############################################
# CodistributiveCocartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> L := [ "b" / T, "c" / T, "d" / T ];;

gap> CodistributiveCocartesianCategoriesTest( T, a, L );;
gap> CodistributiveCocartesianCategoriesTest( T, a, L : only_primitive_operations := true );;

##############################################
# BraidedCartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;

gap> BraidedCartesianCategoriesTest( T, a, b );;
gap> BraidedCartesianCategoriesTest( T, a, b : only_primitive_operations := true );;

gap> BraidedCartesianCategoriesTest( T, b, a );;
gap> BraidedCartesianCategoriesTest( T, b, a : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> BraidedCartesianCategoriesTest( T, z, a );;
gap> BraidedCartesianCategoriesTest( T, z, a : only_primitive_operations := true );;

gap> BraidedCartesianCategoriesTest( T, a, z );;
gap> BraidedCartesianCategoriesTest( T, a, z : only_primitive_operations := true );;

##############################################
# BraidedCocartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;

gap> BraidedCocartesianCategoriesTest( T, a, b );;
gap> BraidedCocartesianCategoriesTest( T, a, b : only_primitive_operations := true );;

gap> BraidedCocartesianCategoriesTest( T, b, a );;
gap> BraidedCocartesianCategoriesTest( T, b, a : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> BraidedCocartesianCategoriesTest( T, z, a );;
gap> BraidedCocartesianCategoriesTest( T, z, a : only_primitive_operations := true );;

gap> BraidedCocartesianCategoriesTest( T, a, z );;
gap> BraidedCocartesianCategoriesTest( T, a, z : only_primitive_operations := true );;

##############################################
# CartesianClosedCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> t := TerminalObject( T );;

gap> a_product_b := DirectProduct( a, b );;
gap> c_product_d := DirectProduct( c, d );;

gap> exp_ab := Exponential( a, b );;
gap> exp_cd := Exponential( c, d );;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;
gap> gamma := MorphismConstructor( a_product_b, "f_abt", t );;
gap> delta := MorphismConstructor( c_product_d, "f_cdt", t );;
gap> epsilon := MorphismConstructor( t, "f_texpab", exp_ab );;
gap> zeta := MorphismConstructor( t, "f_texpcd", exp_cd );;

gap> CartesianClosedCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> z_product_a := DirectProduct( z, a );;
gap> a_product_z := DirectProduct( a, z );;

gap> exp_za := Exponential( z, a );;
gap> exp_az := Exponential( a, z );;

gap> alpha := MorphismConstructor( z, "f_za", a );;
gap> beta := MorphismConstructor( a, "f_az", z );;
gap> gamma := MorphismConstructor( z_product_a, "f_zat", t );;
gap> delta := MorphismConstructor( a_product_z, "f_azt", t );;
gap> epsilon := MorphismConstructor( t, "f_texpza", exp_za );;
gap> zeta := MorphismConstructor( t, "f_texpaz", exp_az );;

gap> CartesianClosedCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

##############################################
# CocartesianCoclosedCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> i := InitialObject( T );;

gap> a_product_b := Coproduct( a, b );;
gap> c_product_d := Coproduct( c, d );;

gap> coexp_ab := Coexponential( a, b );;
gap> coexp_cd := Coexponential( c, d );;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;
gap> gamma := MorphismConstructor( i, "f_iab", a_product_b );;
gap> delta := MorphismConstructor( i, "f_icd", c_product_d );;
gap> epsilon := MorphismConstructor( coexp_ab, "f_coexpabi", i );;
gap> zeta := MorphismConstructor( coexp_cd, "f_coexpcdi", i );;

gap> CocartesianCoclosedCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CocartesianCoclosedCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> z_product_a := Coproduct( z, a );;
gap> a_product_z := Coproduct( a, z );;

gap> coexp_za := Coexponential( z, a );;
gap> coexp_az := Coexponential( a, z );;

gap> alpha := MorphismConstructor( z, "f_za", a );;
gap> beta := MorphismConstructor( a, "f_az", z );;
gap> gamma := MorphismConstructor( i, "f_iza", z_product_a );;
gap> delta := MorphismConstructor( i, "f_iaz", a_product_z );;
gap> epsilon := MorphismConstructor( coexp_za, "f_coexpzai", i );;
gap> zeta := MorphismConstructor( coexp_az, "coexpazi", i );;

gap> CocartesianCoclosedCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CocartesianCoclosedCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

##############################################

gap> STOP_TEST("TerminalCategoryTopos.tst", 1);
