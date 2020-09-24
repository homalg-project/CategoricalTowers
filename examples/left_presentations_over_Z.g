LoadPackage( "ModulePresentations" );
LoadPackage( "QuotientCategories" );

ZZ := HomalgRingOfIntegers( );
# Z
cat := LeftPresentations( ZZ );
# Category of left presentations of Z
is_equivalent_morphisms :=
    function( alpha, beta )
      local epi;
      
      if not IsEqualForObjects( Source( alpha ), Source( beta ) ) or
           not IsEqualForObjects( Range( alpha ), Range( beta ) ) then
             Error( "Wrong input for the test function!" );
      fi;
         
      epi := EpimorphismFromSomeProjectiveObject( Range( alpha ) );

      return Lift( alpha - beta, epi ) <> fail;
         
    end;;
quotient_cat := QuotientCategory( cat, is_equivalent_morphisms );
# The Quotient category of Category of left presentations of Z by 
# is_equivalent_morphisms
F := ProjectionFunctor( quotient_cat );
# Canonical projection functor from Category of left presentations of Z in 
# The Quotient category of Category of left presentations of Z by is_equivalent_morphisms
a := FreeLeftPresentation( 3, ZZ );
# <An object in Category of left presentations of Z>
quotient_a := ApplyFunctor( F, a );
# <An object in The Quotient category of Category of left presentations of Z by is_equivalent_morphisms>
IsZero( quotient_a );
# true
