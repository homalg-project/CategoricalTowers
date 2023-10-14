# This example contains a function is_equivalent_morphisms which can not be displayed nicely using the
# standard way of inserting examples, hence this way.

#! @Chunk abelian_groups
#! @BeginExampleSession
#! gap> LoadPackage( "ModulePresentations" );
#! true
#! gap> LoadPackage( "QuotientCategories" );
#! true
#! gap> zz := HomalgRingOfIntegers( );
#! Z
#! gap> cat := LeftPresentations( zz );
#! Category of left presentations of Z
#! gap> epi := EpimorphismFromSomeProjectiveObject;;
#! gap> congruence_func := { alpha, beta } -> IsLiftable( alpha - beta, epi( Target( alpha ) ) );;
#! gap> quotient_cat := QuotientCategory( cat, congruence_func );
#! Quotient category( Category of left presentations of Z ) by congruence_func
#! gap> F := ProjectionFunctor( quotient_cat );;
#! gap> a := FreeLeftPresentation( 3, zz );
#! <A projective object in Category of left presentations of Z>
#! gap> quotient_a := ApplyFunctor( F, a );
#! <An object in Quotient category( Category of left presentations of Z ) by congruence_func>
#! gap> IsZero( quotient_a );
#! true
#! @EndExampleSession
#! @EndChunk
