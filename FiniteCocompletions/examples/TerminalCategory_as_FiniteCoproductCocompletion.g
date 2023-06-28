#! @Chunk TerminalCategory_as_FiniteStrictCoproductCocompletion

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
T := FiniteStrictCoproductCocompletion( InitialCategory( ) );
#! FiniteStrictCoproductCocompletion( InitialCategory( ) )
Display( T );
#! A CAP category with name FiniteStrictCoproductCocompletion( InitialCategory( ) ):
#! 
#! 92 primitive operations were used to derive 547 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsLinearCategoryOverCommutativeRing
#! * IsAbelianCategoryWithEnoughInjectives
#! * IsAbelianCategoryWithEnoughProjectives
#! * IsClosedMonoidalLattice
#! * IsCoclosedMonoidalLattice
#! * IsBooleanAlgebra
#! * IsRigidSymmetricClosedMonoidalCategory
#! * IsRigidSymmetricCoclosedMonoidalCategory
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsDiscreteCategory
#! * IsFinitelyPresentedCategory
#! * IsFinitelyPresentedLinearCategory
#! * IsLinearClosureOfACategory
#! * IsLocallyOfFiniteInjectiveDimension
#! * IsLocallyOfFiniteProjectiveDimension
#! * IsStableProset
#! * IsStrictCartesianCategory
#! * IsStrictCocartesianCategory
#! * IsStrictMonoidalCategory
#! * IsTerminalCategory
#! * IsTotalOrderCategory
i := InitialObject( T );
#! <A zero object in FiniteStrictCoproductCocompletion( InitialCategory( ) )>
t := TerminalObject( T );
#! <A zero object in FiniteStrictCoproductCocompletion( InitialCategory( ) )>
z := ZeroObject( T );
#! <A zero object in FiniteStrictCoproductCocompletion( InitialCategory( ) )>
Display( i );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( InitialCategory( ) )
#! given by the above data
Display( t );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( InitialCategory( ) )
#! given by the above data
Display( z );
#! [ 0, [  ] ]
#! 
#! An object in FiniteStrictCoproductCocompletion( InitialCategory( ) )
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
#!  FiniteStrictCoproductCocompletion( InitialCategory( ) )>
fn_z := ZeroObjectFunctorial( T );
#! <A zero, isomorphism in FiniteStrictCoproductCocompletion( InitialCategory( ) )>
IsWellDefined( fn_z );
#! true
IsEqualForMorphisms( id_z, fn_z );
#! true
IsCongruentForMorphisms( id_z, fn_z );
#! true
#! @EndExample
