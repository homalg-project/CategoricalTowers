#! @Chunk TerminalCategory_as_FiniteStrictProductCompletion

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
T := FiniteStrictProductCompletion( InitialCategory( ) );
#! FiniteStrictProductCompletion( InitialCategory( ) )
Display( T );
#! A CAP category with name FiniteStrictProductCompletion( InitialCategory( ) ):
#! 
#! 131 primitive operations were used to derive 627 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsFiniteCategory
#! * IsEquippedWithHomomorphismStructure
#! * IsLinearCategoryOverCommutativeRing
#! * IsLeftClosedMonoidalCategory
#! * IsLeftCoclosedMonoidalCategory
#! * IsRigidSymmetricClosedMonoidalCategory
#! * IsRigidSymmetricCoclosedMonoidalCategory
#! * IsAbelianCategoryWithEnoughInjectives
#! * IsAbelianCategoryWithEnoughProjectives
#! * IsAdditiveMonoidalCategory
#! * IsSymmetricClosedMonoidalLattice
#! * IsSymmetricCoclosedMonoidalLattice
#! * IsBooleanAlgebra
#! and not yet algorithmically
#! * IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms
#! and furthermore mathematically
#! * IsFinitelyPresentedLinearCategory
#! * IsLinearClosureOfACategory
#! * IsLocallyOfFiniteInjectiveDimension
#! * IsLocallyOfFiniteProjectiveDimension
#! * IsSymmetricMonoidalCategoryStructureGivenByCoproduct
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
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
