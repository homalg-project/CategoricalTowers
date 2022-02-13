###############################################################
# Test the symmetric rigid (co)closed correspondences between
# the terminal category with multiple objects and its opposite.
###############################################################

gap> START_TEST("TerminalCategoryMonoidal.tst");

gap> LoadPackage("CategoryConstructor", false);
true
gap> LoadPackage("Toposes", false);
true

gap> T := TerminalCategoryWithMultipleObjects( );;

##############################################
# MonoidalCategoriesTensorProductAndUnitTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;

gap> MonoidalCategoriesTensorProductAndUnitTest( T, a, b );;
gap> MonoidalCategoriesTensorProductAndUnitTest( T, a, b : only_primitive_operations := true );;

gap> z := ZeroObject( T );;
gap> b := "b" / T;;

gap> MonoidalCategoriesTensorProductAndUnitTest( T, z, b );;
gap> MonoidalCategoriesTensorProductAndUnitTest( T, z, b : only_primitive_operations := true );;

gap> a := "a" / T;;
gap> z := ZeroObject( T );;

gap> MonoidalCategoriesTensorProductAndUnitTest( T, a, z );;
gap> MonoidalCategoriesTensorProductAndUnitTest( T, a, z : only_primitive_operations := true );;

##############################################
# MonoidalCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> alpha := MorphismConstructor( a, "f_ab", b );;
gap> beta := MorphismConstructor( c, "f_cd", d );;

gap> MonoidalCategoriesTest( T, a, b, c, alpha, beta );;
gap> MonoidalCategoriesTest( T, a, b, c, alpha, beta : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> alpha := UniversalMorphismFromZeroObject( a );;
gap> beta := UniversalMorphismIntoZeroObject( a );;

gap> MonoidalCategoriesTest( T, z, a, a, alpha, beta );;
gap> MonoidalCategoriesTest( T, z, a, a, alpha, beta : only_primitive_operations := true );;

gap> MonoidalCategoriesTest( T, a, z, z, beta, alpha );;
gap> MonoidalCategoriesTest( T, a, z, z, beta, alpha : only_primitive_operations := true );;

##############################################
# BraidedMonoidalCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;

gap> BraidedMonoidalCategoriesTest( T, a, b );;
gap> BraidedMonoidalCategoriesTest( T, a, b : only_primitive_operations := true );;

gap> BraidedMonoidalCategoriesTest( T, b, a );;
gap> BraidedMonoidalCategoriesTest( T, b, a : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> BraidedMonoidalCategoriesTest( T, z, a );;
gap> BraidedMonoidalCategoriesTest( T, z, a : only_primitive_operations := true );;

gap> BraidedMonoidalCategoriesTest( T, a, z );;
gap> BraidedMonoidalCategoriesTest( T, a, z : only_primitive_operations := true );;

##############################################
# ClosedMonoidalCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> z := ZeroObject( T );;

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

gap> ClosedMonoidalCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> ClosedMonoidalCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

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

gap> ClosedMonoidalCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> ClosedMonoidalCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

##############################################
# CoclosedMonoidalCategoriesTest
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

gap> CoclosedMonoidalCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CoclosedMonoidalCategoriesTest( T, a, b, c, d, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

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

gap> CoclosedMonoidalCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta );;
gap> CoclosedMonoidalCategoriesTest( T, z, a, a, z, alpha, beta, gamma, delta, epsilon, zeta : only_primitive_operations := true );;

##############################################
# RigidSymmetricClosedMonoidalCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricClosedMonoidalCategoriesTest( T, a, b, c, d, alpha );;
gap> RigidSymmetricClosedMonoidalCategoriesTest( T, a, b, c, d, alpha : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricClosedMonoidalCategoriesTest( T, z, b, c, z, alpha );;
gap> RigidSymmetricClosedMonoidalCategoriesTest( T, z, b, c, z, alpha : only_primitive_operations := true );;

##############################################
# RigidSymmetricCoclosedMonoidalCategoriesTest
##############################################

gap> a := "a" / T;;
gap> b := "b" / T;;
gap> c := "c" / T;;
gap> d := "d" / T;;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricCoclosedMonoidalCategoriesTest( T, a, b, c, d, alpha );;
gap> RigidSymmetricCoclosedMonoidalCategoriesTest( T, a, b, c, d, alpha : only_primitive_operations := true );;

gap> z := ZeroObject( T );;

gap> alpha := IdentityMorphism( a );;

gap> RigidSymmetricCoclosedMonoidalCategoriesTest( T, a, b, c, d, alpha );;
gap> RigidSymmetricCoclosedMonoidalCategoriesTest( T, a, b, c, d, alpha : only_primitive_operations := true );;

##############################################

gap> STOP_TEST("TerminalCategoryMonoidal.tst", 1);
