
##
InstallMethod( IsQuiverVertexWithLoop,
          [ IsQuiverVertex ],
  function( v )
    return ForAny( OutgoingArrows( v ), a -> Target( a ) = v );
end );

##
InstallMethodWithCache( AuxiliaryMorphism,
          [ IsCapCategoryObjectInHomCategory, IsCapCategoryObjectInHomCategory ],
  function( S, R )
    local cat, algebroid, A, quiver, nr_vertices, nr_arrows, S_o_vals, S_m_vals, R_o_vals, R_m_vals, loops, nr_loops, left_coeffs, right_coeffs, S_o_val_i, R_o_val_i, new_left_coeff, new_right_coeff, arrow, s, t, H, i, j, k;
    
    cat := CapCategory( S );
    
    algebroid := Source( cat );
     
    A := UnderlyingQuiverAlgebra( algebroid );
    
    quiver := QuiverOfAlgebra( A );
    
    nr_vertices := NumberOfVertices( quiver );
     
    nr_arrows := NumberOfArrows( quiver );
       
    S_o_vals := ValuesOnAllObjects( S );
    
    S_m_vals := ValuesOnAllGeneratingMorphisms( S );
    
    R_o_vals := ValuesOnAllObjects( R );
    
    R_m_vals := ValuesOnAllGeneratingMorphisms( R );
    
    # Some changes needs to be done in case the quiver has loops
    
    loops := PositionsProperty( [ 1 .. nr_vertices ], i -> IsQuiverVertexWithLoop( Vertex( quiver, i ) ) );
    
    nr_loops := Size( loops );
    
    S_o_vals := Concatenation( S_o_vals, S_o_vals{ loops } );
    
    R_o_vals := Concatenation( R_o_vals, R_o_vals{ loops } );
    
    left_coeffs := [ ];

    right_coeffs := [ ];
    
    for i in [ 1 .. nr_loops ] do
      
      S_o_val_i := S_o_vals[ loops[ i ] ];
      
      R_o_val_i := R_o_vals[ loops[ i ] ];
      
      new_left_coeff := [ ];
      
      new_right_coeff := [ ];
      
      for k in [ 1 .. nr_vertices + nr_loops ] do
        
        if k = loops[ i ] then
          
          Add( new_left_coeff, IdentityMorphism( S_o_val_i ), k );
          Add( new_right_coeff, IdentityMorphism( R_o_val_i ), k );
        
        elif k = nr_vertices + i then
          
          Add( new_left_coeff, IdentityMorphism( S_o_val_i ), k );
          Add( new_right_coeff, -IdentityMorphism( R_o_val_i ), k );
          
        else
          
          Add( new_left_coeff, ZeroMorphism( S_o_val_i, S_o_vals[ k ] ), k );
          Add( new_right_coeff, ZeroMorphism( R_o_vals[ k ], R_o_val_i ), k );
          
        fi;
        
      od;
      
      Add( left_coeffs, new_left_coeff );
      
      Add( right_coeffs, new_right_coeff );
      
    od;
    
    for i in [ 1 .. nr_arrows ] do
      
      arrow := Arrow( quiver, i );
      
      s := VertexIndex( Source( arrow ) );
      
      t := VertexIndex( Target( arrow ) );
      
      if s = t then
        
        t := nr_vertices + Position( loops, s );
        
      fi;
      
      new_left_coeff := [ ];
      
      new_right_coeff := [ ];
      
      for k in [ 1 .. nr_vertices + nr_loops ] do
        
        if k = s then
          Add( new_left_coeff, IdentityMorphism( S_o_vals[ s ] ), s );
          Add( new_right_coeff, R_m_vals[ i ], s );
        fi;
        
        if k = t then
          Add( new_left_coeff, S_m_vals[ i ], t );
          Add( new_right_coeff, AdditiveInverse( IdentityMorphism( R_o_vals[ t ] ) ), t );
        fi;
        
        if k <> s and k <> t then
          Add( new_left_coeff, ZeroMorphism( S_o_vals[ s ], S_o_vals[ k ] ), k );
          Add( new_right_coeff, ZeroMorphism( R_o_vals[ k ], R_o_vals[ t ] ), k );
        fi;           
        
      od;
       
      Add( left_coeffs, new_left_coeff );

      Add( right_coeffs, new_right_coeff );
      
    od;
    
    H := ListN( left_coeffs, right_coeffs,
              { l, r } -> ListN( l, r, HomomorphismStructureOnMorphisms )
            );
    
    return MorphismBetweenDirectSums( TransposedMat( H ) );
 
end );

##
InstallGlobalFunction( ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_FUNCTORS_CATEGORY,
  function( Hom )
    local A, quiver, nr_vertices, loops, range_category, range_category_of_hom, D;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    quiver := QuiverOfAlgebra( A );
    
    nr_vertices := NumberOfVertices( quiver );
    
    loops := PositionsProperty( [ 1 .. nr_vertices ], i -> IsQuiverVertexWithLoop( Vertex( quiver, i ) ) );
    
    range_category := Range( Hom );
    
    if not HasRangeCategoryOfHomomorphismStructure( range_category ) then
      
      return;
      
    fi;
    
    range_category_of_hom := RangeCategoryOfHomomorphismStructure( range_category );
    
    if not ( HasIsAbelianCategory( range_category_of_hom ) and IsAbelianCategory( range_category_of_hom ) ) then
      
      return;
      
    fi;
    
    D := DistinguishedObjectOfHomomorphismStructure( range_category_of_hom );
    
    SetRangeCategoryOfHomomorphismStructure( Hom, range_category_of_hom );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( Hom, {} -> D );
    
    ##
    AddHomomorphismStructureOnObjects( Hom,
      { S, R } -> KernelObject( AuxiliaryMorphism( S, R ) )
    );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( Hom,
      function( eta )
        local maps;
        
        maps := ValuesOnAllObjects( eta );
        
        maps := List( maps, InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure );
        
        maps := Concatenation( maps, maps{ loops } );
        
        maps := MorphismBetweenDirectSums( [ maps ] );
        
        return KernelLift(
                  AuxiliaryMorphism( Source( eta ), Range( eta ) ),
                  maps
                );
    end );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Hom,
      function( S, R, iota )
        local S_o_vals, R_o_vals, map, summands;
        
        S_o_vals := ValuesOnAllObjects( S );
        
        S_o_vals := Concatenation( S_o_vals, S_o_vals{ loops } );
        
        R_o_vals := ValuesOnAllObjects( R );
        
        R_o_vals := Concatenation( R_o_vals, R_o_vals{ loops } );
        
        map := AuxiliaryMorphism( S, R );
        
        iota := PreCompose( iota, KernelEmbedding( map ) );
        
        summands := ListN( S_o_vals, R_o_vals, HomomorphismStructureOnObjects );
        
        iota := List( [ 1 .. Size( summands ) ],
                    i -> PreCompose( iota, ProjectionInFactorOfDirectSum( summands, i ) )
                  );
        
        iota := ListN( S_o_vals, R_o_vals, iota, InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism );
        
        return AsMorphismInHomCategory( S, iota, R ); 
        
    end );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( Hom,
      function( s, eta, mu, r )
        local eta_maps, mu_maps, maps, r_eta_s_mu, s_eta_r_mu;
        
        eta_maps := ValuesOnAllObjects( eta );
        
        eta_maps := Concatenation( eta_maps, eta_maps{ loops } );
        
        mu_maps := ValuesOnAllObjects( mu );
        
        mu_maps := Concatenation( mu_maps, mu_maps{ loops } );
        
        maps := ListN( eta_maps, mu_maps, HomomorphismStructureOnMorphisms );
        
        maps := DirectSumFunctorial( maps );
        
        r_eta_s_mu := AuxiliaryMorphism( Range( eta ), Source( mu ) );
        
        s_eta_r_mu := AuxiliaryMorphism( Source( eta ), Range( mu ) );
        
        return KernelObjectFunctorialWithGivenKernelObjects( s, r_eta_s_mu, maps, s_eta_r_mu, r );
        
    end );
    
    if CanCompute( range_category_of_hom, "CoefficientsOfMorphismWithGivenBasisOfExternalHom" ) then
      
      ##
      AddBasisOfExternalHom( Hom,
        function( S, R )
          local iota, K, D, S_o_vals, R_o_vals, summands, direct_sum, iotas, basis;
          
          iota := KernelEmbedding( AuxiliaryMorphism( S, R ) );
          
          K := Source( iota );
          
          D := DistinguishedObjectOfHomomorphismStructure( range_category );
          
          S_o_vals := ValuesOnAllObjects( S );
          
          R_o_vals := ValuesOnAllObjects( R );
          
          summands := ListN( S_o_vals, R_o_vals, HomomorphismStructureOnObjects );
          
          summands := Concatenation( summands, summands{loops} );
          
          direct_sum := DirectSum( summands );
          
          summands := List( [ 1 .. Length( S_o_vals ) ],
                            i -> ProjectionInFactorOfDirectSumWithGivenDirectSum( summands, i, direct_sum )
                            );
          
          iotas := List( summands, s -> PreCompose( iota, s ) );
          
          basis := BasisOfExternalHom( D, K );
          
          iotas := List( iotas, iota -> List( basis, b -> PreCompose( b, iota ) ) );
          
          return List( [ 1 .. Dimension( K ) ], j ->
                      AsMorphismInHomCategory(
                          S,
                          List( [ 1 .. nr_vertices ], i ->
                            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
                                S_o_vals[ i ],
                                R_o_vals[ i ],
                                iotas[i][j] )
                          ),
                          R
                      )
                    );
          
      end );
      
      ##
      AddCoefficientsOfMorphismWithGivenBasisOfExternalHom( Hom,
        { eta, B } -> CoefficientsOfMorphism( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( eta ) )
      );
      
    fi;
    
end );
