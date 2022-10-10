#! @Chunk TerminalCategory

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
T := FiniteCompletion( InitialCategory( ) );
#! FiniteCompletion( InitialCategory( ) )
IsTerminalCategory( T );
#! true
InfoOfInstalledOperationsOfCategory( T );
#! 488 primitive operations were used to derive 520 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsLinearCategoryOverCommutativeRing
#! * IsBicartesianClosedCategory
#! * IsBicartesianCoclosedCategory
#! * IsAbelianCategoryWithEnoughInjectives
#! * IsAbelianCategoryWithEnoughProjectives
#! * IsRigidSymmetricClosedMonoidalCategory
#! * IsRigidSymmetricCoclosedMonoidalCategory
#! and furthermore mathematically
#! * IsFinitelyPresentedCategory
#! * IsFinitelyPresentedLinearCategory
#! * IsLinearClosureOfACategory
#! * IsLocallyOfFiniteInjectiveDimension
#! * IsLocallyOfFiniteProjectiveDimension
#! * IsSkeletalCategory
#! * IsStrictCartesianCategory
#! * IsStrictCocartesianCategory
#! * IsStrictMonoidalCategory
#! * IsTerminalCategory
i := InitialObject( T );
#! <An object in FiniteCompletion( InitialCategory( ) )>
t := TerminalObject( T );
#! <An object in FiniteCompletion( InitialCategory( ) )>
z := ZeroObject( T );
#! <A zero object in FiniteCompletion( InitialCategory( ) )>
Display( i );
#! An object in FunctorCategory( InitialCategory( ), InitialCategory( ) )
#! given by the above data
#! 
#! An object in Opposite of
#! FunctorCategory( InitialCategory( ), InitialCategory( ) )
#! given by the above data
#! 
#! An object in FiniteCompletion( InitialCategory( ) ) given by the above data
Display( t );
#! An object in FunctorCategory( InitialCategory( ), InitialCategory( ) )
#! given by the above data
#! 
#! An object in Opposite of
#! FunctorCategory( InitialCategory( ), InitialCategory( ) )
#! given by the above data
#! 
#! An object in FiniteCompletion( InitialCategory( ) ) given by the above data
Display( z );
#! An object in FunctorCategory( InitialCategory( ), InitialCategory( ) )
#! given by the above data
#! 
#! An object in Opposite of
#! FunctorCategory( InitialCategory( ), InitialCategory( ) )
#! given by the above data
#! 
#! An object in FiniteCompletion( InitialCategory( ) ) given by the above data
IsIdenticalObj( i, z );
#! false
IsIdenticalObj( t, z );
#! false
IsEqualForObjects( i, z );
#! true
IsEqualForObjects( t, z );
#! true
IsWellDefined( z );
#! true
id_z := IdentityMorphism( z );
#! <A zero, identity morphism in FiniteCompletion( InitialCategory( ) )>
fn_z := ZeroObjectFunctorial( T );
#! <A morphism in FiniteCompletion( InitialCategory( ) )>
IsWellDefined( fn_z );
#! true
IsEqualForMorphisms( id_z, fn_z );
#! true
IsCongruentForMorphisms( id_z, fn_z );
#! true
#! @EndExample
