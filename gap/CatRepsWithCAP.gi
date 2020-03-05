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
