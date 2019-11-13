

##
InstallMethod( IsomorphismFromCategoryOfQuiverRepresentations,
          [ IsCapHomCategory ],
  function( functors )
    local B, matrix_cat, field, A, quiver, quiver_reps, name, F;
    
    B := Source( functors );
    
    matrix_cat := Range( functors );
    
    if not IsBound( matrix_cat!.field_for_matrix_category ) then
      
      Error( "The range category of the input should be a matrix category for some homalg field!\n" );
      
    fi;
    
    field := matrix_cat!.field_for_matrix_category;
    
    A := UnderlyingQuiverAlgebra( B );
    
    quiver := QuiverOfAlgebra( A );
    
    quiver_reps := CategoryOfQuiverRepresentations( A );
    
    name := Concatenation( "Isomorphism functor from ", Name( quiver_reps ), " into ", Name( functors ) );
    
    F := CapFunctor( name, quiver_reps, functors );
    
    AddObjectFunction( F,
      function( rep )
        local obj, dimension_vec, mor, matrices, i;
        
        obj := rec( );
        
        dimension_vec := DimensionVector( rep );
        
        for i in [ 1 .. Size( dimension_vec ) ] do
          
          obj!.( String( Vertex( quiver, i ) ) ) := VectorSpaceObject( dimension_vec[ i ], field );
          
        od;
        
        mor := rec( );
        
        matrices := MatricesOfRepresentation( rep );
        
        matrices := List( matrices,
          mat -> HomalgMatrix( 
                    RowsOfMatrix( mat ), 
                      DimensionsMat( mat )[ 1 ],
                        DimensionsMat( mat )[ 2 ], field ) );
                        
        for i in [ 1 .. Size( matrices ) ] do;
          
          mor!.( String( Arrow( quiver, i ) ) ) :=
            VectorSpaceMorphism(
              obj!.( String( Source( Arrow( quiver, i ) ) ) ), 
                matrices[ i ],
                  obj!.( String( Target( Arrow( quiver, i ) ) ) ) );
                  
        od;
        
        return AsObjectInHomCategory( B, obj, mor );
        
    end );
    
    AddMorphismFunction( F,
      function( source, rep_mor, range )
        local matrices, mor, i;
        
        matrices := MatricesOfRepresentationHomomorphism( rep_mor );
        
        matrices := List( matrices,
          mat -> HomalgMatrix(
                    RowsOfMatrix( mat ),
                      DimensionsMat( mat )[ 1 ],
                        DimensionsMat( mat )[ 2 ], field ) );
                        
        mor := rec( );
        
        for i in [ 1 .. Size( matrices ) ] do
          
          mor!.( String( Vertex( quiver, i ) ) ) :=
            VectorSpaceMorphism(
              VectorSpaceObject( NrRows( matrices[ i ] ), field ),
                matrices[ i ],
                  VectorSpaceObject( NrColumns( matrices[ i ] ), field ) );
                  
        od;
        
        return AsMorphismInHomCategory( source, mor, range );
        
    end );
    
    return F;
    
end );

##
InstallMethod( IsomorphismIntoCategoryOfQuiverRepresentations,
          [ IsCapHomCategory ],
  function( functors )
    local B, matrix_cat, A, field, quiver, quiver_reps, name, G;
    
    B := Source( functors );
    
    matrix_cat := Range( functors );
    
    if not IsBound( matrix_cat!.field_for_matrix_category ) then
      
      Error( "The range category of the input should be a matrix category for some homalg field!\n" );
      
    fi;
    
    A := UnderlyingQuiverAlgebra( B );
    
    field := LeftActingDomain( A );
    
    quiver := QuiverOfAlgebra( A );
    
    quiver_reps := CategoryOfQuiverRepresentations( A );
    
    name := Concatenation( "Isomorphism functor from ", Name( functors ), " into ", Name( quiver_reps ) );
    
    G := CapFunctor( name, functors, quiver_reps );
    
    AddObjectFunction( G,
      function( func )
        local U, V, L;
        
        U := UnderlyingCapTwoCategoryCell( func );
        
        V := List( Vertices( quiver ),
          v -> Dimension( ApplyFunctor( U, B.( String( v ) ) ) ) );
        
        L := List( Arrows( quiver ),
              l -> UnderlyingMatrix( ApplyFunctor( U, B.( String( l ) ) ) ) );
              
        L := List( L, 
              l -> MatrixByRows( 
                field, [ NrRows( l ), NrColumns( l ) ],
                  EntriesOfHomalgMatrixAsListList( l ) ) );
                  
        return QuiverRepresentation( A, V, L );
        
      end );
    
    AddMorphismFunction( G,
      function( source, mor, range )
        local U, V;
        
        U := UnderlyingCapTwoCategoryCell( mor );
        
        V := List( Vertices( quiver ),
                v -> UnderlyingMatrix(
                  ApplyNaturalTransformation( U, B.( String( v ) ) ) ) );
                  
        V := List( V,
          v -> MatrixByRows( field, [ NrRows( v ), NrColumns( v ) ],
            EntriesOfHomalgMatrixAsListList( v ) ) );
            
        return QuiverRepresentationHomomorphism( source, range, V );
        
      end );
      
    return G;
    
end );

