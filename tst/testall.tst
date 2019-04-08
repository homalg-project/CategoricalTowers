gap> ZZ := HomalgRingOfIntegers( );
Z
gap> cat := LeftPresentations( ZZ );
Category of left presentations of Z
gap> is_equivalent_morphisms := function( alpha, beta ) local epi; if not IsEqualForObjects( Source( alpha ), Source( beta ) ) or not IsEqualForObjects( Range( alpha ), Range( beta ) ) then Error( "Wrong input for the test function!" ); fi; epi := EpimorphismFromSomeProjectiveObject( Range( alpha ) ); return Lift( alpha - beta, epi ) <> fail; end;;
gap> quotient_cat := QuotientCategory( cat, is_equivalent_morphisms );
The quotient category of Category of left presentations of Z by is_equivalent_morphisms
gap> F := CanonicalProjectionFunctor( quotient_cat );
Canonical projection functor from Category of left presentations of Z in The quotient category of Category of left presentations of Z by is_equivalent_morphisms
gap> a := FreeLeftPresentation( 3, ZZ );
<An object in Category of left presentations of Z>
gap> quotient_a := ApplyFunctor( F, a );
<An object in The quotient category of Category of left presentations of Z by is_equivalent_morphisms>
gap> IsZero( quotient_a );
true
