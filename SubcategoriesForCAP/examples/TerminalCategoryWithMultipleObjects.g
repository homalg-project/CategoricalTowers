#! @Chunk TerminalCategoryWithMultipleObjects

# the following packages introduce and use more CAP operations
# which are not used below; still they make the example file
# useful for further testing

#! @Example
LoadPackage( "Locales", false );
#! true
LoadPackage( "SubcategoriesForCAP", false );
#! true
T := TerminalCategoryWithMultipleObjects( );
#! TerminalCategoryWithMultipleObjects( )
InfoOfInstalledOperationsOfCategory( T );
#! 92 primitive operations were used to derive 546 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsLinearCategoryOverCommutativeRing
#! * IsClosedMonoidalProset
#! * IsCoclosedMonoidalProset
#! * IsAbelianCategoryWithEnoughInjectives
#! * IsAbelianCategoryWithEnoughProjectives
#! * IsBooleanAlgebroid
#! * IsElementaryTopos
#! * IsRigidSymmetricClosedMonoidalCategory
#! * IsRigidSymmetricCoclosedMonoidalCategory
#! and furthermore mathematically
#! * IsDiscreteCategory
#! * IsLocallyOfFiniteInjectiveDimension
#! * IsLocallyOfFiniteProjectiveDimension
#! * IsStableProset
#! * IsSymmetricMonoidalCategoryStructureGivenByCoproduct
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
#! * IsTerminalCategory
a := "a" / T;
#! <An object in TerminalCategoryWithMultipleObjects( )>
Display( a );
#! a
IsWellDefined( a );
#! true
aa := ObjectConstructor( T, "a" );
#! <An object in TerminalCategoryWithMultipleObjects( )>
Display( aa );
#! a
a = aa;
#! true
b := "b" / T;
#! <An object in TerminalCategoryWithMultipleObjects( )>
Display( b );
#! b
a = b;
#! false
t := TensorProduct( a, b );
#! <An object in TerminalCategoryWithMultipleObjects( )>
Display( t );
#! TensorProductOnObjects
a = t;
#! false
TensorProduct( a, a ) = t;
#! true
m := MorphismConstructor( a, "m", b );
#! <A morphism in TerminalCategoryWithMultipleObjects( )>
Display( m );
#! a
#! |
#! | m
#! v
#! b
IsWellDefined( m );
#! true
n := MorphismConstructor( a, "n", b );
#! <A morphism in TerminalCategoryWithMultipleObjects( )>
Display( n );
#! a
#! |
#! | n
#! v
#! b
IsEqualForMorphisms( m, n );
#! false
IsCongruentForMorphisms( m, n );
#! true
m = n;
#! true
id := IdentityMorphism( a );
#! <An identity morphism in TerminalCategoryWithMultipleObjects( )>
Display( id );
#! a
#! |
#! | IdentityMorphism
#! v
#! a
m = id;
#! false
id = MorphismConstructor( a, "xyz", a );
#! true
z := ZeroMorphism( a, a );
#! <A zero morphism in TerminalCategoryWithMultipleObjects( )>
Display( z );
#! a
#! |
#! | ZeroMorphism
#! v
#! a
id = z;
#! true
#! @EndExample
