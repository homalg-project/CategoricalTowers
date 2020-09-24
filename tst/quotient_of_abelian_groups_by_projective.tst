gap> ZZ := HomalgRingOfIntegers( );
Z
gap> cat := LeftPresentations( ZZ );;
gap> is_equivalent_morphisms := function( alpha, beta ) local epi; if not IsEqualForObjects( Source( alpha ), Source( beta ) ) or not IsEqualForObjects( Range( alpha ), Range( beta ) ) then Error( "Wrong input for the test function!" ); fi; epi := EpimorphismFromSomeProjectiveObject( Range( alpha ) ); return Lift( alpha - beta, epi ) <> fail; end;;
gap> quotient_cat := QuotientCategory( cat, is_equivalent_morphisms );;
gap> F := ProjectionFunctor( quotient_cat );;
gap> a := FreeLeftPresentation( 3, ZZ );;
gap> quotient_a := ApplyFunctor( F, a );;
gap> IsZero( quotient_a );
true
gap> IsEqualForObjects( quotient_a, a/quotient_cat );
true
gap> IsEqualForMorphisms( ApplyFunctor( F, IdentityMorphism( a ) ), IdentityMorphism( a ) / quotient_cat );
true
