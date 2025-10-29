# SPDX-License-Identifier: GPL-2.0-or-later
# FpLinearCategories: Finitely presented linear categories by generating quivers and relations
#
# Implementations
#

##
InstallOtherMethod( ReductionOfMorphism,
          [ IsLinearClosure, IsLinearClosureMorphism, IsDenseList ],
  
  function ( kC, f, G )
    local C, one, leading_coeffs_G, leading_morphs_G, leading_morphs_G_datum, r, leading_coeff_f, leading_morph_f, leading_morph_f_datum, i, p, c_i, u_i, v_i, t, leading_term_f;
    
    C := UnderlyingCategory( kC );
    
    one := One( UnderlyingRing( kC ) );
    
    leading_coeffs_G := List( G, g -> CoefficientsList( g )[1] );
    leading_morphs_G := List( G, g -> SupportMorphisms( g )[1] );
    leading_morphs_G_datum := List( leading_morphs_G, m -> MorphismDatum( C, m ) );
    
    r := ZeroMorphism( kC, Source(f), Target(f) );
    
    while not IsZeroForMorphisms( kC, f ) do
        
        leading_coeff_f := CoefficientsList( f )[1];
        leading_morph_f := SupportMorphisms( f )[1];
        
        leading_morph_f_datum := MorphismDatum( C, leading_morph_f );
        
        i := PositionProperty( leading_morphs_G_datum, datum -> PositionSublist( leading_morph_f_datum[2], datum[2] ) <> fail );
        
        if i <> fail then
            
            p := PositionSublist( leading_morph_f_datum[2], leading_morphs_G_datum[i][2] );
            
            c_i := leading_coeff_f / leading_coeffs_G[i];
            
            u_i := MorphismConstructor( C,
                            ObjectDatum( kC, Source( f ) ),
                            Pair( p - 1, leading_morph_f_datum[2]{[ 1 .. p - 1 ]} ),
                            ObjectDatum( kC, Source( G[i] ) ) );
            
            u_i := MorphismConstructor( kC, Source( f ), Pair( [ one ], [ u_i ] ), Source( G[i] ) );
            
            v_i := MorphismConstructor( C,
                            ObjectDatum( kC, Target( G[i] ) ),
                            Pair( leading_morph_f_datum[1] - p - leading_morphs_G_datum[i][1] + 1,
                                  leading_morph_f_datum[2]{[ p + leading_morphs_G_datum[i][1] .. leading_morph_f_datum[1] ]} ),
                            ObjectDatum( kC, Target( f ) ) );
            
            v_i := MorphismConstructor( kC, Target( G[i] ), Pair( [ one ], [ v_i ] ), Target( f ) );
            
            t := MultiplyWithElementOfCommutativeRingForMorphisms( kC, c_i, PreComposeList( kC, [ u_i, G[i], v_i ] ) );
            f := SubtractionForMorphisms( kC, f, t );
            
        else
            
            leading_term_f := MorphismConstructor( kC,
                                    Source( f ),
                                    Pair( [ leading_coeff_f ], [ leading_morph_f ] ),
                                    Target( f ) );
            
            r := AdditionForMorphisms( kC, r, leading_term_f );
            f := SubtractionForMorphisms( kC, f, leading_term_f );
            
        fi;
        
    od;
    
    return r;
    
end );

##
InstallOtherMethod( NewRelation,
          [ IsLinearClosure, IsLinearClosureMorphism, IsLinearClosureMorphism, IsDenseList ],
  
  function ( kC, g, h, overlap_coeffs )
    local one, leading_morph_g, leading_morph_h, l_leading_morph_g, r_leading_morph_g, l_leading_morph_h, r_leading_morph_h, leading_coeff_g, leading_coeff_h;
    
    one := One( UnderlyingRing( kC ) );
    
    leading_morph_g := SupportMorphisms( g )[1];
    leading_morph_h := SupportMorphisms( h )[1];
    
    l_leading_morph_g := MorphismConstructor( kC, SetOfObjects( kC )[ObjectIndex( Source( overlap_coeffs[1][1] ) )], Pair( [ one ], [ overlap_coeffs[1][1] ] ), Source( g ) );
    r_leading_morph_g := MorphismConstructor( kC, Target( g ), Pair( [ one ], [ overlap_coeffs[1][2] ] ), SetOfObjects( kC )[ObjectIndex( Target( overlap_coeffs[1][2] ) )] );
    
    l_leading_morph_h := MorphismConstructor( kC, SetOfObjects( kC )[ObjectIndex( Source( overlap_coeffs[2][1] ) )], Pair( [ one ], [ overlap_coeffs[2][1] ] ), Source( h ) );
    r_leading_morph_h := MorphismConstructor( kC, Target( h ), Pair( [ one ], [ overlap_coeffs[2][2] ] ), SetOfObjects( kC )[ObjectIndex( Target( overlap_coeffs[2][2] ) )] );
    
    leading_coeff_g := CoefficientsList( g )[1];
    leading_coeff_h := CoefficientsList( h )[1];
    
    return SubtractionForMorphisms( kC,
                MultiplyWithElementOfCommutativeRingForMorphisms( kC, Inverse( leading_coeff_g ), PreComposeList( kC, [ l_leading_morph_g, g, r_leading_morph_g ] ) ),
                MultiplyWithElementOfCommutativeRingForMorphisms( kC, Inverse( leading_coeff_h ), PreComposeList( kC, [ l_leading_morph_h, h, r_leading_morph_h ] ) ) );
    
end );

##
InstallMethod( GroebnerBasis,
          [ IsLinearClosure, IsDenseList ],
  
  function ( kC, relations )
    local C, gb, indices, rels, i, g, new_indices, new_rels;
    
    C := UnderlyingCategory( kC );
    
    # Compute a Gröbner basis
    
    gb := ShallowCopy( relations );
    
    indices := UnorderedTuples( [ 1 .. Length( gb ) ], 2 );
    
    rels := Concatenation(
              List( indices, i ->
                List( OverlappingCoefficients( C, SupportMorphisms( gb[i[1]] )[1], SupportMorphisms( gb[i[2]] )[1] ),
                  overlap_coeffs -> NewRelation( kC, gb[i[1]], gb[i[2]], overlap_coeffs ) ) ) );
    
    i := 1;
    
    while i <= Length( rels ) do
        
        if not IsZeroForMorphisms( kC, rels[i] ) then
            
            g := ReductionOfMorphism( kC, rels[i], gb );
            
            if not IsZeroForMorphisms( kC, g ) then
              
              Add( gb, Inverse( CoefficientsList( g )[1] ) * g ); # one can also add g without normalization
              
              new_indices := List( [ 1 .. Length( gb ) ], i -> [ i, Length( gb ) ] );
              
              new_rels :=
                Concatenation(
                  List( new_indices, i ->
                    List( OverlappingCoefficients( C, SupportMorphisms( gb[i[1]] )[1], SupportMorphisms( gb[i[2]] )[1] ),
                      overlap_coeffs -> NewRelation( kC, gb[i[1]], gb[i[2]], overlap_coeffs ) ) ) );
              
              rels := Concatenation( rels, new_rels );
              
            fi;
            
        fi;
        
        i := i + 1;
        
    od;
    
    return gb;
    
end );

##
InstallMethod( ReducedGroebnerBasisWithGivenGroebnerBasis,
            [ IsLinearClosure, IsDenseList ],
  
  function ( kC, gb )
    local reduced_gb, i, r;
    
    reduced_gb := ShallowCopy( gb );
    
    i := 1;
    
    while i <= Length( reduced_gb ) do
      
      r := ReductionOfMorphism( kC, reduced_gb[i], reduced_gb{Concatenation( [ 1 .. i - 1 ], [ i + 1 .. Length( reduced_gb ) ] )} );
      
      if IsZeroForMorphisms( kC, r ) then
          
          Remove( reduced_gb, i );
          
      elif not IsEqualForMorphisms( kC, r, reduced_gb[i] ) then
          
          reduced_gb[i] := MultiplyWithElementOfCommutativeRingForMorphisms( kC, Inverse( CoefficientsList( r )[1] ), r );
          
          i := 1;
          
      else
          
          i := i + 1;
          
      fi;
      
    od;
    
    return reduced_gb;
    
end );

##
InstallMethod( ReducedGroebnerBasis,
          [ IsLinearClosure, IsDenseList ],
  
  function ( kC, relations )
    
    return ReducedGroebnerBasisWithGivenGroebnerBasis( kC, GroebnerBasis( kC, relations ) );
    
end );
