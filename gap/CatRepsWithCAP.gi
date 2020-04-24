#
# CatReps: Representations and cohomology of finite categories
#
# Implementations
#

##
InstallGlobalFunction( ConvertToMapOfFinSets,
   function( objects, gen )
        local O, T, S, G, j, i;
	
	for O in objects do
		if Length(Intersection(gen,O)) > 0 then
			T := FinSet(O);
			break;
		fi;
	od;
	
	if not IsBound( T ) then
		Error( "unable to find target set\n" );
	fi;
	
	S := FinSet(PositionsProperty(Flat(objects),i->IsBound(gen[i])));
	
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
    
    C := Subcategory( FinSets, "A finite concrete category" : FinalizeCategory := false );
    
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
    
    SetSetOfObjects( C, List( c.objects, o -> FinSet( o ) / C ) );
    SetSetOfGeneratingMorphisms( C, List( c.generators, g -> ConvertToMapOfFinSets( c.objects, g ) / C ) );
    
    Finalize( C );
    
    return C;
    
end );

##
InstallMethod( Algebroid,
        "for a homalg ring and a finite category",
        [ IsHomalgRing and IsCommutative, IsFiniteConcreteCategory ],
        
  function( k, C )
    local objects, gmorphisms, q, 
		i, mor, relEndoString, relEndo,
		kq, rel;
    
    TryNextMethod( );
    
	objects := SetOfObjects( C );
	gmorphisms := SetOfGeneratingMorphisms( C );
    q := RightQuiverFromConcreteCategory( C );
    
    kq := PathAlgebra( k, q );
    
	relEndoString := function(j,m,n)
		local a;
	    a := "abcdefghijklmnopqrstuvwxyz"{[j]};
	    return Concatenation( [
		"kq.",a,"^",String(m+n),
		"-kq.",a,"^",String(m) ] );
	end;
	
	for i in [1..Length(gmorphisms)] do
	    mor := gmorphisms[i];
		if IsEndomorphism( mor ) then
		    ##
		fi;
	od;
	
    relEndo := [];
    
    #kq := Algebroid( kq, rel );
    
    #SetUnderlyingCategory( kq, C );
    
    #SetIsLinearClosureOfACategory( kq, true );
    
    return kq;
    
end );


##
InstallMethod( RelationsOfEndomorphisms,
        "for a finite category",
        [ IsFiniteConcreteCategory ],
        
  function( C )
    local objects, gmorphisms, q, 
		relEndoString, relEndo,
		i, mor, homset, m, n, foundEqual,
		rel;
    
    
	objects := SetOfObjects( C );
	gmorphisms := SetOfGeneratingMorphisms( C );
    q := RightQuiverFromConcreteCategory( C );
    
	relEndoString := function(q,j,m,n)
		local a, s, one;
	    a := Arrows(q)[j];
		# a := "abcdefghijklmnopqrstuvwxyz"{[j]};
		s := "";
		if m = 0 then
			one := Source( a );
			s := Concatenation( [
				"kq.",String(a),"^",String(n),
				"-kq.",String(one) ] );
		else
  	        s := Concatenation( [
				"kq.",String(a),"^",String(m+n),
				"-kq.",String(a),"^",String(m) ] );
		fi;
		return s;
	end;
	
	#assuming at most 1 generating endomorphism per vertex
    relEndo := [];
	for i in [1..Length(gmorphisms)] do
	    mor := gmorphisms[i];
		if IsEndomorphism( mor ) then
		    homset := [];
			m := 0;
			# rho sigma lemma
			foundEqual := false;
			while not mor^m in homset do
				n := 1;
			    while not foundEqual do
				    if IsEqualForMorphisms( mor^(m+n), mor^m ) then
					    Append( relEndo, [ relEndoString( q,i,m,n) ] );
						foundEqual := true;
					fi;
				    n := n+1;
				od;
				Append( homset, [ mor^m ] );
			    m := m+1;
			od;
		fi;
	od;
	
    return relEndo;
    
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
		  PositionProperty( objects, o -> IsEqualForObjects( Source(mor), o )),
		  PositionProperty( objects, o -> IsEqualForObjects( Range(mor), o ))
		];
		i := i+1;
	od;
	
    q := RightQuiver( "q(1)[a]",Length( objects ),arrows );
    
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
