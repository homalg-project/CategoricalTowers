

## Computing basis of external hom for functors category whose range is matrix category of some homalg field
##
InstallGlobalFunction( BASIS_OF_EXTERNAL_HOM_BETWEEN_TWO_FUNCTORS_INTO_MATRIX_CATEGORY,
  function( a, b )
    local cat, algebroid, matrix_cat, field, A, quiver, a_as_functor, b_as_functor, a_dimensions,
      b_dimensions, nr_of_vertices, mat, nr_of_arrows, source_of_arrow, range_of_arrow, a_i, b_i,
        id_1, id_2, nr_rows_of_block, u, v, nr_cols_in_block1, block_1, block_2, nr_cols_in_block3,
          block_3, block_4, nr_cols_in_block5, block_5, block, cols_of_mat, hom, morphism, L, i;
    
    cat := CapCategory( a );
    
    algebroid := Source( cat );
    
    matrix_cat := Range( cat );
    
    if not IsBound( matrix_cat!.field_for_matrix_category ) then
      
      Error( "The range category of the input should be a matrix category for some homalg field!\n" );
      
    fi;
    
    field := matrix_cat!.field_for_matrix_category;
    
    A := UnderlyingQuiverAlgebra( algebroid );
    
    quiver := QuiverOfAlgebra( A );
    
    a_as_functor := UnderlyingCapTwoCategoryCell( a );
    
    b_as_functor := UnderlyingCapTwoCategoryCell( b );
    
    a_dimensions := List( Vertices( quiver ),
                      v -> Dimension(
                        ApplyFunctor( a_as_functor, algebroid.( String( v ) ) )
                                    )
                        );
                        
    b_dimensions := List( Vertices( quiver ),
                      v -> Dimension(
                        ApplyFunctor( b_as_functor, algebroid.( String( v ) ) )
                                    )
                        );
                        
    nr_of_vertices := NumberOfVertices( quiver );
    
    mat := HomalgZeroMatrix( 0, a_dimensions * b_dimensions, field );
    
    nr_of_arrows := NumberOfArrows( quiver );
    
    for i in [ 1 .. nr_of_arrows ] do
      
      source_of_arrow := VertexIndex( Source( Arrow( quiver, i ) ) );
      
      range_of_arrow := VertexIndex( Target( Arrow( quiver, i ) ) );
      
      a_i := ApplyFunctor( a_as_functor, algebroid.( String( Arrow( quiver, i ) ) ) );
      
      a_i := UnderlyingMatrix( a_i );
      
      b_i := ApplyFunctor( b_as_functor, algebroid.( String( Arrow( quiver, i ) ) ) );
      
      b_i := UnderlyingMatrix( b_i );
      
      id_1 := HomalgIdentityMatrix( NrRows( a_i ), field );
      
      id_2 := HomalgIdentityMatrix( NrCols( b_i ), field );
      
      nr_rows_of_block := NrRows( a_i ) * NrCols( b_i );
      
      u := Minimum( source_of_arrow, range_of_arrow );
      
      v := Maximum( source_of_arrow, range_of_arrow );
      
      if u = 1 then
        
        nr_cols_in_block1 := 0;
        
      else
        
        nr_cols_in_block1 := a_dimensions{ [ 1 .. u - 1 ] } * b_dimensions{ [ 1 .. u - 1 ] };
        
      fi;
      
      block_1 := HomalgZeroMatrix( nr_rows_of_block,  nr_cols_in_block1, field );
      
      if u = source_of_arrow then
        
        block_2 := - KroneckerMat( TransposedMatrix( b_i ), id_1 );
        
      elif u = range_of_arrow then
        
        block_2 := KroneckerMat( id_2, a_i );
        
      fi;
      
      if v - u in [ 0, 1 ] then
        
        nr_cols_in_block3 := 0;
        
      else
        
        nr_cols_in_block3 := a_dimensions{ [ u + 1 .. v - 1 ] } * b_dimensions{ [ u + 1 .. v - 1 ] };
        
      fi;
      
      block_3 := HomalgZeroMatrix( nr_rows_of_block,  nr_cols_in_block3, field );
      
      if v = source_of_arrow then
        
        block_4 := - KroneckerMat( TransposedMatrix( a_i ), id_1 );
        
      elif v = range_of_arrow then
        
        block_4 := KroneckerMat( id_2, a_i );
        
      fi;
      
      if v = nr_of_vertices then
        
        nr_cols_in_block5 := 0;
        
      else
        
        nr_cols_in_block5 := a_dimensions{ [ v + 1 .. nr_of_vertices ] }
                              * b_dimensions{ [ v + 1 .. nr_of_vertices ] };
        
      fi;
      
      block_5 := HomalgZeroMatrix( nr_rows_of_block,  nr_cols_in_block5, field );
      
      block := UnionOfColumns( [ block_1, block_2, block_3, block_4, block_5 ] );
      
      mat := UnionOfRows( mat, block );
      
    od;
    
    mat := SyzygiesOfColumns( mat );
    
    if mat = fail then
      
      return [ ];
      
    fi;
    
    cols_of_mat := TransposedMat( EntriesOfHomalgMatrixAsListList( mat ) );
    
    hom := [ ];
    
    for L in cols_of_mat do
    
    morphism:= rec( );
      
      for i in [ 1 .. nr_of_vertices ] do
        
        if a_dimensions[ i ] * b_dimensions[ i ] = 0 then
          
          morphism!.( String( Vertex( quiver, i ) ) ) :=
            ZeroMorphism(
                          VectorSpaceObject( a_dimensions[ i ], field ),
                          VectorSpaceObject( b_dimensions[ i ], field )
                        );
                        
        else
          
          mat := L{ [ 1 .. a_dimensions[ i ] * b_dimensions[ i ] ] };
          
          mat := TransposedMat( List( [ 1 .. b_dimensions[ i ] ],
              u -> mat{ [ ( u - 1 ) * a_dimensions[ i ] + 1 .. u * a_dimensions[ i ] ] } ) );
              
          mat := HomalgMatrix( mat, a_dimensions[ i ], b_dimensions[ i ], field );
          
          morphism!.( String( Vertex( quiver, i ) ) ) :=
            VectorSpaceMorphism(
                              VectorSpaceObject( a_dimensions[ i ], field ),
                              mat,
                              VectorSpaceObject( b_dimensions[ i ], field )
                             );
                              
        fi;
        
        L := L{ [ a_dimensions[ i ] * b_dimensions[ i ] + 1 .. Length( L ) ] };
        
      od;
      
      Add( hom, AsMorphismInHomCategory( a, morphism, b ) );
      
    od;
    
    return hom;
    
end );

InstallGlobalFunction( COEFFICIENTS_OF_MORPHISM_OF_FUNCTORS_INTO_MATRIX_CATEGORY,
  function( alpha, hom_basis )
    local a, b, cat, algebroid, matrix_cat, field, A, quiver, nr_of_vertices, F, L, sol;
    
    if IsEmpty( hom_basis ) then
      
      return [ ];
      
    fi;
    
    a := Source( alpha );
    
    b := Range( alpha );
    
    cat := CapCategory( alpha );
    
    algebroid := Source( cat );
    
    matrix_cat := Range( cat );
    
    if not IsBound( matrix_cat!.field_for_matrix_category ) then
      
      Error( "The range category of the input should be a matrix category for some homalg field!\n" );
      
    fi;
   
    field := matrix_cat!.field_for_matrix_category;
    
    A := UnderlyingQuiverAlgebra( algebroid );
    
    quiver := QuiverOfAlgebra( A );
    
    nr_of_vertices := NumberOfVertices( quiver );
    
    F := function( f )
          local U, L;
          
          U := UnderlyingCapTwoCategoryCell( f );
          
          L := List( [ 1 .. nr_of_vertices ],
            i -> ApplyNaturalTransformation( U, algebroid.( String( Vertex( quiver, i ) ) ) ) );
            
          return List( L, UnderlyingMatrix );
        
        end;
    
    L := TransposedMat( List( Concatenation( [ alpha ], hom_basis ), F ) );
    
    L := Filtered( L, l -> ForAll( l, m -> not IsZero( NrRows( m ) * NrCols( m ) ) ) );
    
    L := List( L,
      l -> List( l,
        m -> HomalgMatrix(
          EntriesOfHomalgMatrix( TransposedMatrix( m ) ),
            NrRows( m ) * NrCols( m ), 1, field ) ) );
    
    L := UnionOfColumns( List( TransposedMat( L ), UnionOfRows ) );
    
    sol := SyzygiesOfColumns( L );
    
    if NrCols( sol ) > 1 then
    
      Error( "This should not happen!" );
    
    fi;
    
    sol := EntriesOfHomalgMatrix( sol );
    
    return AdditiveInverse( Inverse( sol[ 1 ] ) ) * sol{ [ 2 .. Size( hom_basis ) + 1 ] };
    
end );

