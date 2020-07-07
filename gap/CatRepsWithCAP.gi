#
# CatReps: Representations and cohomology of finite categories
#
# Implementations
#

##
InstallGlobalFunction( ConvertToMapOfFinSets,
  function( objects, gen )
    local O, T, S, G, j, i;
    
    T := First( objects, O -> Length( Intersection( gen, AsList( O ) ) ) > 0 );
    
    if T = fail then
        Error( "unable to find target set\n" );
    fi;
    
    S := PositionsProperty( Flat( List( objects, O -> AsList( O ) ) ), i -> IsBound( gen[i] ) );
    
    S := First( objects, O -> AsList( O ) = S );
    
    if S = fail then
        Error( "unable to find source set\n" );
    fi;
    
    G := [ ];
    j := 1;

    G := List( S, i -> [ i, gen[i] ] ); # gen[i] is sure to be bound
    
    return MapOfFinSets( S, G, T );
    
end );

##
InstallMethod( ConcreteCategoryForCAP,
        "for a list",
        [ IsList ],
        
  function( L )
    local C, c, objects;
    
    DeactivateCachingOfCategory( FinSets );
    CapCategorySwitchLogicOff( FinSets );
    DisableSanityChecks( FinSets );
    
    C := Subcategory( FinSets, "A finite concrete category" : overhead := false, FinalizeCategory := false );
    
    DeactivateCachingOfCategory( C );
    CapCategorySwitchLogicOff( C );
    DisableSanityChecks( C );
    
    SetFilterObj( C, IsFiniteConcreteCategory );
    
    AddIsAutomorphism( C,
      function( alpha )
        return IsAutomorphism( UnderlyingCell( alpha ) );
    end );
    
    AddInverse( C,
      function( alpha )
        return Inverse( UnderlyingCell( alpha ) ) / CapCategory( alpha );
    end );
    
    c := ConcreteCategory( L );
    
    C!.ConcreteCategoryRecord := c;
    
    objects := List( c.objects, FinSet );
    
    SetSetOfObjects( C, List( objects, o -> o / C ) );
    
    SetSetOfGeneratingMorphisms( C, List( c.generators, g -> ConvertToMapOfFinSets( objects, g ) / C ) );
    
    Finalize( C );
    
    return C;
    
end );

##
InstallMethod( Algebroid,
        "for a homalg ring and a finite category",
        [ IsHomalgRing and IsCommutative, IsFiniteConcreteCategory ],
        
  function( k, C )
    local objects, gmorphisms, q, kq, relEndo, A, F, vertices, rel,
          func, st, s, t, homST, list, p, pos;
    
    objects := SetOfObjects( C );
    gmorphisms := SetOfGeneratingMorphisms( C );
    q := RightQuiverFromConcreteCategory( C );
    kq := PathAlgebra( k, q );
    relEndo := RelationsOfEndomorphisms( k, C );
    A := Algebroid( kq, relEndo );
    kq := UnderlyingQuiverAlgebra( A );
    F := CapFunctor( A, objects, gmorphisms, C );
    
    vertices := List( SetOfObjects(A), UnderlyingVertex );
    
    rel := [];
    func :=
      function( p, l )
        return ForAny( l, p1->
                       IsCongruentForMorphisms(
                               ApplyToQuiverAlgebraElement( F, p ),
                               ApplyToQuiverAlgebraElement( F, p1 ) )
                       );
    end;
    
    for st in Cartesian(vertices,vertices) do
        s := st[1];
        t := st[2];
        if s = t then
            continue;
        fi;
        homST := BasisPathsBetweenVertices( kq, s, t );
        homST := List( homST, p -> PathAsAlgebraElement( kq, p ) );
        
        list := [];
        
        for p in homST do
            pos := PositionProperty( list, l->func(p,l) );
            if IsInt(pos) then
                Add( list[pos], p );
            else
                Add( list, [p] );
            fi;
        od;
        list := List( list, l-> List( l, p -> p!.representative ) );
        Append( rel, list );
    od;
    
    rel := Filtered( rel, l -> Length(l)>1 );
    rel := List( rel, l -> List( l{[ 2 .. Length(l) ]}, p -> l[1]-p ) );
    rel := Flat( rel );
    rel := Concatenation( relEndo, rel );
    
    kq := PathAlgebra( kq ) / rel;
    
    kq := PathAlgebra( kq ) / GroebnerBasis( IdealOfQuotient( kq ) );
    
    kq := Algebroid( kq );
    
    SetUnderlyingCategory( kq, C );
    
    SetIsLinearClosureOfACategory( kq, true );
    
    return kq;
    
end );

##
InstallMethod( RelationsOfEndomorphisms,
        "for a homalg ring and a finite category",
        [ IsHomalgRing and IsCommutative, IsFiniteConcreteCategory ],
        
  function( k, C )
    local objects, gmorphisms, q, kq, relation_of_endomorphism,
          arrows, endos, vertices, i, mor, powers, m, n, foundEqual, relsEndo;
    
    objects := SetOfObjects( C );
    gmorphisms := SetOfGeneratingMorphisms( C );
    q := RightQuiverFromConcreteCategory( C );
    kq := PathAlgebra( k, q );
    
    relation_of_endomorphism := function(kq, a, m, n)
        local rel, one;
        rel := [];
        if m = 0 then
            one := Source( a );
            rel := PathAsAlgebraElement( kq, a )^n
                   - PathAsAlgebraElement( kq, one );
        else
            rel := PathAsAlgebraElement( kq, a )^(m+n)
                   - PathAsAlgebraElement( kq, a )^m;
        fi;
        return rel;
    end;
    
    arrows := Arrows( q );
    endos := Filtered( arrows, a -> Source( a ) = Target( a ) );
    
    vertices := Collected( List( endos, Source ) );
    
    if ForAny( vertices, l -> l[2] > 1 ) then
        Error( "we assume at most 1 generating endomorphism per vertex\n" );
    fi;
    
    relsEndo := [];
    
    for i in [ 1 .. Length( gmorphisms ) ] do
        mor := gmorphisms[i];
        if not IsEndomorphism( mor ) then
            continue;
        fi;
        powers := [];
        m := 0;
        # sigma lemma
        foundEqual := false;
        while not mor^m in powers do
            n := 1;
            while not foundEqual do
                if IsCongruentForMorphisms( mor^(m+n), mor^m ) then
                    Add( relsEndo,
                         relation_of_endomorphism( kq, arrows[i], m, n ) );
                    foundEqual := true;
                fi;
                n := n+1;
            od;
            Add( powers, mor^m );
            m := m+1;
        od;
    od;
    
    return relsEndo;
    
end );

##
InstallMethod( RightQuiverFromConcreteCategory,
        "for a finite category",
        [ IsFiniteConcreteCategory ],
        
  function( C )
    local objects, gmorphisms, arrows, i, mor, q;
    
    objects := SetOfObjects( C );
    gmorphisms := SetOfGeneratingMorphisms( C );
    arrows := [];
    
    i := 1;
    
    for mor in gmorphisms do
        arrows[i] :=[
                     PositionProperty( objects,
                             o -> IsEqualForObjects( Source( mor ), o ) ),
                     PositionProperty( objects,
                             o -> IsEqualForObjects( Range( mor ), o ) )
                     ];
        i := i+1;
    od;
    
    q := RightQuiver( "q(1)[a]", Length( objects ), arrows );
    
    return q;
    
end );

##
InstallMethod( RecordOfCategory,
        "for an algebroid",
        [ IsAlgebroid ],
        
  function( kq )

    return rec( domain := List( SetOfGeneratingMorphisms( kq ), a -> VertexIndex( UnderlyingVertex( Source( a ) ) ) ),
                codomain := List( SetOfGeneratingMorphisms( kq ), a -> VertexIndex( UnderlyingVertex( Range( a ) ) ) ),
                );
    
end );

##
InstallMethod( RecordOfCatRep,
        "for an object in a Hom-category",
        [ IsCapCategoryObjectInHomCategory ],
        
  function( F )

    return rec( category := RecordOfCategory( Source( CapCategory( F ) ) ),               
                genimages := List( ValuesOnAllGeneratingMorphisms( F ), a -> Eval( UnderlyingMatrix( a ) )!.matrix ),
                dimension := List( ValuesOnAllObjects( F ), Dimension ),
                field := CommutativeRingOfLinearCategory( Source( CapCategory( F ) ) )!.ring
                );
    
end );

## EmbeddingOfSubRepresentation = Spin in catreps
## Source( EmbeddingOfSubRepresentation ) = SubmoduleRep in catreps
InstallMethod( EmbeddingOfSubRepresentation,
        "for a list and an object in a Hom-category",
        [ IsList, IsCapCategoryObjectInHomCategory ],
        
  function( eta, F )
    local kq, objects, morphisms, subrep, embedding;
    
    kq := Source( CapCategory( F ) );
    
    eta := List( eta, function( eta_o ) if IsMonomorphism( eta_o ) then return eta_o; fi; return ImageEmbedding( eta_o ); end );
    
    objects := List( eta, Source );
    morphisms := List(
                      SetOfGeneratingMorphisms( kq ),
                      m ->
                      LiftAlongMonomorphism( eta[VertexIndex( UnderlyingVertex( Range( m ) ) )],
                              PreCompose( eta[VertexIndex( UnderlyingVertex( Source( m ) ) )], F( m ) ) ) );
    
    subrep := AsObjectInHomCategory( kq, objects, morphisms );
    
    embedding := AsMorphismInHomCategory( subrep, eta, F );
    
    SetIsMonomorphism( embedding, true );
    
    return embedding;
    
end );

##
InstallMethod( WeakDirectSumDecomposition,
        "for an object in a Hom-category",
        [ IsCapCategoryObjectInHomCategory ],
        
  function( F )
    local f, d, kq, k, objects, morphisms, summands, embeddings;
    
    f := RecordOfCatRep( F );
    
    d := Decompose( f );
    
    kq := Source( CapCategory( F ) );
    
    k := CommutativeRingOfLinearCategory( kq );
    
    d := List( d, eta -> List( [ 1 .. Length( eta ) ], i -> VectorSpaceMorphism( VectorSpaceObject( Length( eta[i] ), k ), eta[i], F( kq.(i) ) ) ) );
    
    return List( d, eta -> EmbeddingOfSubRepresentation( eta, F ) );
    
end );
