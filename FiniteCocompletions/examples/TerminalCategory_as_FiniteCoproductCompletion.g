#! @Chunk TerminalCategory_as_FiniteStrictCoproductCompletion

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
T := FiniteStrictCoproductCompletion( InitialCategory( ) );
#! FiniteStrictCoproductCompletion( InitialCategory( ) )
Display( T );
#! A CAP category with name FiniteStrictCoproductCompletion( InitialCategory( ) ):
#! 
#! 122 primitive operations were used to derive 687 operations for this category
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
#! * IsElementaryTopos
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
#! * IsStableProset
#! * IsSymmetricMonoidalCategoryStructureGivenByCoproduct
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
#! * IsTerminalCategory
#! * IsTotalOrderCategory
i := InitialObject( T );
#! <A zero object in FiniteStrictCoproductCompletion( InitialCategory( ) )>
t := TerminalObject( T );
#! <A zero object in FiniteStrictCoproductCompletion( InitialCategory( ) )>
z := ZeroObject( T );
#! <A zero object in FiniteStrictCoproductCompletion( InitialCategory( ) )>
Display( i );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( InitialCategory( ) )
#! given by the above data
Display( t );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( InitialCategory( ) )
#! given by the above data
Display( z );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( InitialCategory( ) )
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
#!  FiniteStrictCoproductCompletion( InitialCategory( ) )>
fn_z := ZeroObjectFunctorial( T );
#! <A zero, isomorphism in FiniteStrictCoproductCompletion( InitialCategory( ) )>
IsWellDefined( fn_z );
#! true
IsEqualForMorphisms( id_z, fn_z );
#! true
IsCongruentForMorphisms( id_z, fn_z );
#! true
#! @EndExample
