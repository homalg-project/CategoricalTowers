# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

BindGlobal( "FUNCTOR_CATEGORIES", rec( QQ := HomalgFieldOfRationals( ) ) );

##
InstallMethod( ConvertToCellInHomCategory,
    [ IsQuiverRepresentation ],
    
  function ( rep )
    local reps, A, A_oid, k, dims, matrices, F;
    
    reps := CapCategory( rep );
    
    A := AlgebraOfCategory( reps );
    
    A_oid := Algebroid( A );
    
    k := CommutativeRingOfLinearCategory( A_oid );
    
    dims := DimensionVector( rep );
    
    matrices := List( MatricesOfRepresentation( rep ),
      mat -> HomalgMatrix(
                RowsOfMatrix( mat ),
                  DimensionsMat( mat )[ 1 ],
                    DimensionsMat( mat )[ 2 ], k ) );
    
    F := AsObjectInHomCategory( A_oid, dims, matrices );
    
    SetConvertToCellInCategoryOfQuiverRepresentations( F, rep );
    
    return F;
    
end );

##
InstallMethod( ConvertToCellInHomCategory,
          [ IsQuiverRepresentationHomomorphism ],
          
  function ( phi )
    local reps, A, A_oid, k, e, F, G, eta;
    
    reps := CapCategory( phi );
    
    A := AlgebraOfCategory( reps );
    
    A_oid := Algebroid( A );
    
    k := CommutativeRingOfLinearCategory( A_oid );
    
    e := List( MatricesOfRepresentationHomomorphism( phi ),
          mat -> HomalgMatrix(
                    RowsOfMatrix( mat ),
                      DimensionsMat( mat )[ 1 ],
                        DimensionsMat( mat )[ 2 ], k ) );
    
    F := ConvertToCellInHomCategory( Source( phi ) );
    G := ConvertToCellInHomCategory( Range( phi ) );
    
    eta := AsMorphismInHomCategory( F, e, G );
    
    SetConvertToCellInCategoryOfQuiverRepresentations( eta, phi );
    
    return eta;
    
end );

##
InstallMethod( IsomorphismFromCategoryOfQuiverRepresentations,
        [ IsCapHomCategory ],
        
  function ( functors )
    local B, A, reps, name, I;
    
    B := Source( functors );
    
    A := UnderlyingQuiverAlgebra( B );
    
    reps := CategoryOfQuiverRepresentations( A );
    
    name := Concatenation( "Isomorphism functor: ", Name( reps ), " -> ", Name( functors ) );
    
    I := CapFunctor( name, reps, functors );
    
    AddObjectFunction( I,
      rep -> ConvertToCellInHomCategory( rep )
    );
    
    AddMorphismFunction( I,
      { S, phi, R } -> ConvertToCellInHomCategory( phi )
    );
    
    return I;
    
end );

##
InstallMethod( ConvertToCellInCategoryOfQuiverRepresentations,
          [ IsCapCategoryObjectInHomCategory ],
          
  function ( F )
    local B, A, k, dims, matrices, rep;
    
    B := Source( F );
    
    A := UnderlyingQuiverAlgebra( B );
    
    k := LeftActingDomain( A );
    
    dims := List( ValuesOnAllObjects( F ), Dimension );
    
    matrices := List( ValuesOnAllGeneratingMorphisms( F ), UnderlyingMatrix );
    
    matrices := List( matrices, m -> MatrixByRows(
                                        k,
                                        [ NrRows( m ), NrColumns( m ) ],
                                        EntriesOfHomalgMatrixAsListList( m )
                                      )
                    );
    
    rep := QuiverRepresentation( A, dims, matrices );
    
    SetConvertToCellInHomCategory( rep, F );
    
    return rep;
    
end );

##
InstallMethod( ConvertToCellInCategoryOfQuiverRepresentations,
          [ IsCapCategoryMorphismInHomCategory ],
          
  function ( eta )
    local B, A, k, matrices, S, R, phi;
    
    B := Source( CapCategory( eta ) );
    
    A := UnderlyingQuiverAlgebra( B );
    
    k := LeftActingDomain( A );
    
    matrices := List( ValuesOnAllObjects( eta ), UnderlyingMatrix );
    
    matrices := List( matrices, m -> MatrixByRows(
                                        k,
                                        [ NrRows( m ), NrColumns( m ) ],
                                        EntriesOfHomalgMatrixAsListList( m )
                                      )
                    );
    
    S := ConvertToCellInCategoryOfQuiverRepresentations( Source( eta ) );
    
    R := ConvertToCellInCategoryOfQuiverRepresentations( Range( eta ) );
    
    phi := QuiverRepresentationHomomorphism( S, R, matrices );
    
    SetConvertToCellInHomCategory( phi, eta );
    
    return phi;
    
end );

##
InstallMethod( IsomorphismOntoCategoryOfQuiverRepresentations,
        [ IsCapHomCategory ],
        
  function ( functors )
    local B, A, reps, name, J;
    
    B := Source( functors );
    
    A := UnderlyingQuiverAlgebra( B );
    
    reps := CategoryOfQuiverRepresentations( A );
    
    name := Concatenation( "Isomorphism functor: ", Name( functors ), " -> ", Name( reps ) );
    
    J := CapFunctor( name, functors, reps );
    
    AddObjectFunction( J,
      F -> ConvertToCellInCategoryOfQuiverRepresentations( F )
    );
    
    AddMorphismFunction( J,
      { F, eta, G } -> ConvertToCellInCategoryOfQuiverRepresentations( eta )
    );
    
    return J;
    
end );

##
InstallMethod( YonedaEmbedding,
        [ IsAlgebroid ],
        
  function ( algebroid )
    local k, matrix_cat, algebroid_op, objs, mors, functors_cat, name, Yoneda;
    
    k := CommutativeRingOfLinearCategory( algebroid );
    
    matrix_cat := MatrixCategory( k );
    
    algebroid_op := OppositeAlgebroidOverOppositeQuiverAlgebra( algebroid );
    
    objs := SetOfObjects( algebroid_op );
    
    mors := SetOfGeneratingMorphisms( algebroid_op );
    
    functors_cat := Hom( algebroid_op, matrix_cat );
    
    name := "Yoneda embedding functor";
    
    Yoneda := CapFunctor( name, algebroid, functors_cat );
    
    AddObjectFunction( Yoneda,
      function ( o )
        local m, Yo;
        
        o := OppositePath( UnderlyingVertex( o ) ) / algebroid_op;
        
        m := List( mors, mor -> HomStructure( o, mor ) );
        
        o := List( objs, obj -> HomStructure( o, obj ) );
        
        Yo := AsObjectInHomCategory( algebroid_op, o, m );
        
        SetIsProjective( Yo, true );
        
        return Yo;
        
    end );
    
    AddMorphismFunction( Yoneda,
      function ( s, m, r )
        
        m := MorphismInAlgebroid(
                OppositePath( UnderlyingVertex( Range( m ) ) ) / algebroid_op,
                OppositeAlgebraElement( UnderlyingQuiverAlgebraElement( m ) ),
                OppositePath( UnderlyingVertex( Source( m ) ) ) / algebroid_op
              );
        
        m := List( objs, o -> HomStructure( m, o ) );
        
        return AsMorphismInHomCategory( s, m, r );
        
    end );
    
    return Yoneda;
    
end );

