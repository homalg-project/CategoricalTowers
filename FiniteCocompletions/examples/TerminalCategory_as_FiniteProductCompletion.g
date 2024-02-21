#! @Chunk TerminalCategory_as_FiniteStrictProductCompletion

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
T := FiniteStrictProductCompletion( InitialCategory( ) );
#! FiniteStrictProductCompletion( InitialCategory( ) )
Display( T );
#! A CAP category with name FiniteStrictProductCompletion( InitialCategory( ) ):
#! 
#! 108 primitive operations were used to derive 612 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsFiniteCategory
#! * IsFinitelyPresentedCategory
#! * IsEquippedWithHomomorphismStructure
#! * IsLinearCategoryOverCommutativeRing
#! * IsLeftClosedMonoidalCategory
#! * IsLeftCoclosedMonoidalCategory
#! * IsAbelianCategoryWithEnoughInjectives
#! * IsAbelianCategoryWithEnoughProjectives
#! * IsClosedMonoidalLattice
#! * IsCoclosedMonoidalLattice
#! * IsBooleanAlgebra
#! * IsRigidSymmetricClosedMonoidalCategory
#! * IsRigidSymmetricCoclosedMonoidalCategory
#! and not yet algorithmically
#! * IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms
#! and furthermore mathematically
#! * IsDiscreteCategory
#! * IsFinitelyPresentedLinearCategory
#! * IsLinearClosureOfACategory
#! * IsLocallyOfFiniteInjectiveDimension
#! * IsLocallyOfFiniteProjectiveDimension
#! * IsTerminalCategory
#! * IsTotalOrderCategory
i := InitialObject( T );
#! <An object in FiniteStrictProductCompletion( InitialCategory( ) )>
t := TerminalObject( T );
#! <An object in FiniteStrictProductCompletion( InitialCategory( ) )>
z := ZeroObject( T );
#! <A zero object in FiniteStrictProductCompletion( InitialCategory( ) )>
Display( i );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictProductCompletion( InitialCategory( ) )
#! given by the above data
Display( t );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictProductCompletion( InitialCategory( ) )
#! given by the above data
Display( z );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictProductCompletion( InitialCategory( ) )
#! given by the above data
IsEqualForObjects( i, z );
#! true
IsIdenticalObj( i, z );
#! false
IsEqualForObjects( t, z );
#! true
IsIdenticalObj( t, z );
#! false
IsWellDefined( z );
#! true
id_z := IdentityMorphism( z );
#! <A zero, identity morphism in
#!  FiniteStrictProductCompletion( InitialCategory( ) )>
fn_z := ZeroObjectFunctorial( T );
#! <A zero, isomorphism in FiniteStrictProductCompletion( InitialCategory( ) )>
IsWellDefined( fn_z );
#! true
IsEqualForMorphisms( id_z, fn_z );
#! true
IsCongruentForMorphisms( id_z, fn_z );
#! true
#! @EndExample
