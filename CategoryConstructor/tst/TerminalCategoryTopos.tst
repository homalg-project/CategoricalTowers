###############################################################
# Test the (co)cartesian (co)closed correspondences between
# the terminal category with multiple objects and its opposite.
###############################################################

gap> START_TEST("TerminalCategoryTopos.tst");

gap> LoadPackage("CategoryConstructor", false);
true
gap> LoadPackage("Toposes", ">= 2022.04-29", false);
true

#
gap> T := TerminalCategoryWithMultipleObjects( );;
gap> opposite := Opposite( T, "Opposite with all operations" );;
gap> opposite_primitive := Opposite( T, "Opposite with primitive operations" : only_primitive_operations := true );;

##############################################
# CartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;

gap> CartesianCategoriesTest( T, opposite, a, b, c, alpha, beta );;
gap> CartesianCategoriesTest( T, opposite_primitive, a, b, c, alpha, beta );;

gap> z := ZeroObject( T );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> CartesianCategoriesTest( T, opposite, z, a, a, alpha, beta );;
gap> CartesianCategoriesTest( T, opposite_primitive, z, a, a, alpha, beta );;

gap> CartesianCategoriesTest( T, opposite, a, z, z, beta, alpha );;
gap> CartesianCategoriesTest( T, opposite_primitive, a, z, z, beta, alpha );;

##############################################
# CoartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;

gap> CocartesianCategoriesTest( T, opposite, a, b, c, alpha, beta );;
gap> CocartesianCategoriesTest( T, opposite_primitive, a, b, c, alpha, beta );;

gap> z := ZeroObject( T );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> CocartesianCategoriesTest( T, opposite, z, a, a, alpha, beta );;
gap> CocartesianCategoriesTest( T, opposite_primitive, z, a, a, alpha, beta );;

gap> CocartesianCategoriesTest( T, opposite, a, z, z, beta, alpha );;
gap> CocartesianCategoriesTest( T, opposite_primitive, a, z, z, beta, alpha );;

##############################################
# DistributiveCartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> L := [ "b" / T, "c" / T, "d" / T ];;

gap> DistributiveCartesianCategoriesTest( T, opposite, a, L );;
gap> DistributiveCartesianCategoriesTest( T, opposite_primitive, a, L );;

##############################################
# CodistributiveCocartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> L := [ "b" / T, "c" / T, "d" / T ];;

gap> CodistributiveCocartesianCategoriesTest( T, opposite, a, L );;
gap> CodistributiveCocartesianCategoriesTest( T, opposite_primitive, a, L );;

##############################################
# BraidedCartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;

gap> BraidedCartesianCategoriesTest( T, opposite, a, b );;
gap> BraidedCartesianCategoriesTest( T, opposite_primitive, a, b );;

gap> BraidedCartesianCategoriesTest( T, opposite, b, a );;
gap> BraidedCartesianCategoriesTest( T, opposite_primitive, b, a );;

gap> z := ZeroObject( T );;

gap> BraidedCartesianCategoriesTest( T, opposite, z, a );;
gap> BraidedCartesianCategoriesTest( T, opposite_primitive, z, a );;

gap> BraidedCartesianCategoriesTest( T, opposite, a, z );;
gap> BraidedCartesianCategoriesTest( T, opposite_primitive, a, z );;

##############################################
# BraidedCocartesianCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;

gap> BraidedCocartesianCategoriesTest( T, opposite, a, b );;
gap> BraidedCocartesianCategoriesTest( T, opposite_primitive, a, b );;

gap> BraidedCocartesianCategoriesTest( T, opposite, b, a );;
gap> BraidedCocartesianCategoriesTest( T, opposite_primitive, b, a );;

gap> z := ZeroObject( T );;

gap> BraidedCocartesianCategoriesTest( T, opposite, z, a );;
gap> BraidedCocartesianCategoriesTest( T, opposite_primitive, z, a );;

gap> BraidedCocartesianCategoriesTest( T, opposite, a, z );;
gap> BraidedCocartesianCategoriesTest( T, opposite_primitive, a, z );;

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

gap> CartesianClosedCategoriesTest( T, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( T, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;

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

gap> CartesianClosedCategoriesTest( T, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( T, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;

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

gap> CocartesianCoclosedCategoriesTest( T, opposite, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CocartesianCoclosedCategoriesTest( T, opposite_primitive, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;

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

gap> CocartesianCoclosedCategoriesTest( T, opposite, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CocartesianCoclosedCategoriesTest( T, opposite_primitive, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;

##############################################

gap> STOP_TEST("TerminalCategoryTopos.tst", 1);
