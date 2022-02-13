###############################################################
# Test the (co)cartesian (co)closed correspondences between
# the terminal category with multiple objects and its opposite.
###############################################################

gap> START_TEST("TerminalCategoryTopos.tst");

gap> LoadPackage("CategoryConstructor", false);
true
gap> LoadPackage("Toposes", false);
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

gap> CartesianCategoriesTest( T, a, b, c, alpha, beta );;
gap> CartesianCategoriesTest( T, a, b, c, alpha, beta : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> CocartesianCategoriesTest( T, z, a, a, alpha, beta );;
gap> CocartesianCategoriesTest( T, z, a, a, alpha, beta : only_primitive_operations := true );;

gap> CocartesianCategoriesTest( T, a, z, z, beta, alpha );;
gap> CocartesianCategoriesTest( T, a, z, z, beta, alpha : only_primitive_operations := true );;

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

gap> a_product_b := DirectProduct( a, b );;
gap> c_product_d := DirectProduct( c, d );;

gap> exp_ab := Exponential( a, b );;
gap> exp_cd := Exponential( c, d );;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;
gap> gamma := UniversalMorphismIntoZeroObject( a_product_b );;
gap> delta := UniversalMorphismIntoZeroObject( c_product_d );;
gap> epsilon := UniversalMorphismFromZeroObject( exp_ab );;
gap> zeta := UniversalMorphismFromZeroObject( exp_cd );;

gap> CartesianClosedCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> z_product_a := DirectProduct( z, a );;
gap> a_product_z := DirectProduct( a, z );;

gap> exp_za := Exponential( z, a );;
gap> exp_az := Exponential( a, z );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;
gap> gamma := UniversalMorphismIntoZeroObject( z_product_a );;
gap> delta := UniversalMorphismIntoZeroObject( a_product_z );;
gap> epsilon := UniversalMorphismFromZeroObject( exp_za );;
gap> zeta := UniversalMorphismFromZeroObject( exp_az );;

gap> CartesianClosedCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CartesianClosedCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

##############################################
# CocartesianCoclosedCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> a_product_b := Coproduct( a, b );;
gap> c_product_d := Coproduct( c, d );;

gap> exp_ab := Coexponential( a, b );;
gap> exp_cd := Coexponential( c, d );;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;
gap> gamma := UniversalMorphismIntoZeroObject( a_product_b );;
gap> delta := UniversalMorphismIntoZeroObject( c_product_d );;
gap> epsilon := UniversalMorphismFromZeroObject( exp_ab );;
gap> zeta := UniversalMorphismFromZeroObject( exp_cd );;

gap> CocartesianCoclosedCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CocartesianCoclosedCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> z_product_a := Coproduct( z, a );;
gap> a_product_z := Coproduct( a, z );;

gap> exp_za := Coexponential( z, a );;
gap> exp_az := Coexponential( a, z );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;
gap> gamma := UniversalMorphismIntoZeroObject( z_product_a );;
gap> delta := UniversalMorphismIntoZeroObject( a_product_z );;
gap> epsilon := UniversalMorphismFromZeroObject( exp_za );;
gap> zeta := UniversalMorphismFromZeroObject( exp_az );;

gap> CocartesianCoclosedCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CocartesianCoclosedCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

##############################################

gap> STOP_TEST("TerminalCategoryTopos.tst", 1);
