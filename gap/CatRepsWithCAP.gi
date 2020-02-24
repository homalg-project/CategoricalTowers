#
# CatReps: Representations and cohomology of finite categories
#
# Implementations
#

##
InstallGlobalFunction( ConvertToMapOfFinSets,
   function( objects, gen )
    ## assume: gen has one element.
	# gen is given as a list [a,b,c,d,...] where a can be empty
	# like [ ,,c,,e,f,...]
	#
    
	local S, G, T;
	
	T := FinSet(gen);
		
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
	j = 1;
	for i in S do
		G[j] := [ i, gen[i] ]; # gen[i] is sure to be bound
	od;
	
	return MapOfFinSets( S, G, T );
	
	# The image of the Graph must be an object
	# FinSet(gen) = 
	# FinSet([ 2, 3, 1]) = [ 1, 2, 3 ];
	# FinSet([ ,,, 5, 6, 4 ]) = [ 4, 5, 6 ];
	
	## if gen is dense, like [ 2, 3, 1 ] or [ 4, 5, 6 ]
	# then the graph is G = [ [ 1, gen[1] ], [ 2, gen[2] ], [ 3, gen[3] ] ];
	# and S = FinSet([ 1, 2, 3 ]) and T = FinSet([ gen[1], gen[2], gen[3] ])
	# if they exist as objects.
	
	## [ ,,, 5, 6, 4 ]
	## [ 2, 3, 1 ]
	## [ 3,, 1,,,,9,,7 ]:
	# S = FinSet([1,3,7,9]) = T
	# G = [ [1, 3], [3, 1], [7, 9], [9, 7]]
	
	## a map of fin sets has a 
	## S source object
	## T target object
	## function how each element in S is mapped to
	## an element in T
	## G is a duplicate-free and dense list of pairs in S times T describing the graph.
	## input -> output
	## [2, 3, 1] -> MapOfFinSets (
	# FinSet( [ 1, 2, 3 ] ),
	# [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ],
	# FinSet( [ 1, 2, 3 ] )
	#)
	# G := [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ];
	# S := [ 1, 2, 3 ] -> FinSet( [ 1, 2, 3 ] );
	# T := [ 4, 5, 6 ] -> FinSet( [ 4, 5, 6 ] );
	# [ 2, 3, 1 ] -> MapOfFinSets( S, G, S );
	# So the morphism [ 2, 3, 1 ] is from S to S.
	###
	## [ 4, 5, 6 ] -> MapOfFinSets (
	# FinSet( [ 1, 2, 3 ] ),
	# [ [ 1, 4 ], [ 2, 5 ], [ 3, 6] ],
	# FinSet( [ 4, 5, 6 ] )
	#)
	# S := [ 1, 2, 3 ] -> FinSet( [ 1, 2, 3 ] );
	# T := [ 4, 5, 6 ] -> FinSet( [ 4, 5, 6 ] );
	# G := [ [ 1, 4 ], [ 2, 5 ], [ 3, 6] ];
	# [ 4, 5, 6 ] -> MapOfFinSets( S, G, T );
	# So the morphism [ 4, 5, 6 ] is from S to T.
	###
	## [ ,,, 5, 6, 4 ] -> MapOfFinSets (
	# FinSet( [ 4, 5, 6 ] ),
	# [ [ 4, 5 ], [ 5, 6 ], [ 6, 4] ],
	# FinSet( [ 4, 5, 6 ] )
	#)
	# T := [ 4, 5, 6 ] -> FinSet( [ 4, 5, 6 ] );
	# G := [ [ 4, 5 ], [ 5, 6 ], [ 6, 4] ];
	## [ ,,, 5, 6, 4 ] -> MapOfFinSets ( T, G, T );
	# So the morphism [ ,,, 5, 6, 4 ] is from T to T.
	
    ## code
    
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

