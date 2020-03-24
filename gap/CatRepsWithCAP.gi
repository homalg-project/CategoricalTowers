#
# CatReps: Representations and cohomology of finite categories
#
# Implementations
#

##
InstallGlobalFunction( ConvertToMapOfFinSets,
   function( objects, gen )
        local O, T, isb, S, G, j, i;
	
	for O in objects do
		if Length(Intersection(gen,O)) > 0 then
			T := FinSet(O);
			break;
		fi;
	od;
	
	if not IsBound( T ) then
		Error( "unable to find target set\n" );
	fi;
	
	## returns the positions i in L where L[i] is bound as a dense list.
	isb := function(L)
		local M,i,j;
		j := 1;
		M := [];
		for i in [1..Length(L)] do
			if IsBound(L[i]) then
				M[j] := i;
				j := j+1;
			fi;
		od;
		return M;
	end;
	
	S := FinSet(isb(gen));
	
	G := [];
	j := 1;
	for i in S do
		G[j] := [ i, gen[i] ];  # gen[i] is sure to be bound
                j := j + 1;
	od;
	
	return MapOfFinSets( S, G, T );
	
end );

##
InstallMethod( ConcreteCategoryForCAP,
        "for a list",
        [ IsList ],
        
  function( L )
    local C, c;
    
    C := Subcategory( FinSets, "A finite concrete category" );
    
    SetFilterObj( C, IsFiniteConcreteCategory );
    
    c := ConcreteCategory( L );
    
    C!.ConcreteCategoryRecord := c;
    
    SetSetOfObjects( C, List( c.objects, o -> FinSet( o ) / C ) );
    SetSetOfGeneratingMorphisms( C, List( c.generators, g -> ConvertToMapOfFinSets( c.objects, g ) / C ) );
    
    return C;
    
end );

##
InstallMethod( CategoryOfRepresentations,
        "for an algebroid and a CAP category",
        [ IsAlgebroid, IsCapCategory ],
        
  function( kq, A )
    local CatReps;
    
    CatReps := Hom( kq, A : FinalizeCategory := false );
    
    AddTensorUnit( CatReps,
      function( )
        local objects, morphisms;
        
        objects := List( [ 1 .. Length( SetOfObjects( kq ) ) ], i -> TensorUnit( A ) );
        morphisms := List( [ 1 .. Length( SetOfGeneratingMorphisms( kq ) ) ], i -> IdentityMorphism( TensorUnit( A ) ) );
        
        return AsObjectInHomCategory( kq, objects, morphisms );
        
    end );
    
    AddTensorProductOnObjects( CatReps,
      function( F, G )
        local objects, morphisms;
        
        objects := ListN( ValuesOnAllObjects( F ), ValuesOnAllObjects( G ), TensorProductOnObjects );
        morphisms := ListN( ValuesOnAllGeneratingMorphisms( F ), ValuesOnAllGeneratingMorphisms( G ), TensorProductOnMorphisms );
        
        return AsObjectInHomCategory( kq, objects, morphisms );
        
    end );
    
    if ValueOption( "FinalizeCategory" ) = false then
        return CatReps;
    fi;
    
    Finalize( CatReps );
    
    return CatReps;
    
end );

##
InstallMethod( RecordOfCategory,
        "for an algebroid",
        [ IsAlgebroid ],
        
  function( kq )

    return rec( domain := List( SetOfGeneratingMorphisms( kq ), a -> Int( String( UnderlyingVertex( Source( a ) ) ) ) ),
                codomain := List( SetOfGeneratingMorphisms( kq ), a -> Int( String( UnderlyingVertex( Range( a ) ) ) ) ),
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
    
    objects := List( d, eta -> List( eta, Source ) );
    morphisms := List( d, eta ->
                       List(
                            SetOfGeneratingMorphisms( kq ),
                            m ->
                            LiftAlongMonomorphism( eta[Int( String( UnderlyingVertex( Range( m ) ) ) )],
                                    PreCompose( eta[Int( String( UnderlyingVertex( Source( m ) ) ) )], F( m ) ) ) ) );
    
    summands := ListN( objects, morphisms, {o,m} -> AsObjectInHomCategory( kq, o, m ) );
    
    embeddings := List( [ 1 .. Length( d ) ], i -> AsMorphismInHomCategory( summands[i], d[i], F ) );
    
    Perform( embeddings, function( eta ) SetIsMonomorphism( eta, true ); end );
    
    return embeddings;
    
end );
