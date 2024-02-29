# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallOtherMethod( DotVertexLabelledDigraph,
        [ IsCapSubcategory and IsPosetCategory and IsFiniteCategory, IsList, IsList ],
        
  function( subposet, lists_of_subobjects, list_of_colors )
    local P, c, objects, l, func, list_of_colorings, digraph, ambient_objects;
    
    P := AmbientCategory( subposet );
    
    c := Length( list_of_colors );
    
    Assert( 0, Length( lists_of_subobjects ) + 1 = c );
    
    objects := List( SetOfObjects( subposet ), UnderlyingCell );
    
    l := Length( objects );
    
    func :=
      function( emb )
        if IsCapFunctor( emb ) then
            return List( SetOfObjects( SourceOfFunctor( emb ) ), emb );
        elif IsCapSubcategory( emb ) then
            return List( SetOfObjects( emb ), UnderlyingCell );
        else
            return emb;
        fi;
        
    end;
    
    lists_of_subobjects := List( lists_of_subobjects, func );
    
    list_of_colorings := List( lists_of_subobjects, list_of_subobjects ->
                               List( list_of_subobjects, object ->
                                     SafeUniquePositionProperty( objects, obj -> IsEqualForObjects( P, obj, object ) ) ) );
    
    list_of_colorings := Concatenation( [ Difference( [ 1 .. l ], Concatenation( list_of_colorings ) ) ], list_of_colorings );
    
    list_of_colorings := List( [ 1 .. c ], i -> List( list_of_colorings[i], o -> [ o, list_of_colors[i] ] ) );
    
    digraph := DigraphOfPoset( subposet );
    
    ambient_objects := SetOfObjects( P );
    
    digraph!.vertexlabels := List( objects, object -> String( -1 + SafeUniquePositionProperty( ambient_objects, obj -> IsEqualForObjects( P, obj, object ) ) ) );
    
    return DotVertexLabelledDigraph( digraph, Concatenation( list_of_colorings ) );
    
end );
