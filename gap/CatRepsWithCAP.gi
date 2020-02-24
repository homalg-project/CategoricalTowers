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
		fi;
	od;
		
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
	
	# not sure if necessary
#	for O in objects do
#		if Length(Intersection(isb(gen),O)) > 0 then
#			S := FinSet(O);
#		fi;
#	od;
	
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
    
    SetOfObjects( C, List( c.objects, FinSet ) );
    #SetOfGeneratingMorphism( C, c.generators );
    
    return C;
    
end );

