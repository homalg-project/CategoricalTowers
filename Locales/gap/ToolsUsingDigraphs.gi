# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
InstallMethod( DigraphOfParents,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    local all, show_equal, nodes, parents, parents_with_multiplicity, D;
    
    all := ValueOption( "all" );
    show_equal := ValueOption( "show_equal" );
    
    if all = true then
        nodes := C!.all_nodes;
        parents := "all_parents";
    else
        nodes := C!.act_nodes;
        parents := "act_parents";
    fi;
    
    parents_with_multiplicity :=
      function( a )
        local p, mult;
        
        p := a!.(parents);
        
        ## we do not expect multiplicity > 1 for inclusion arrows starting at negative nodes
        if a!.parity = false then
            return List( p, x -> IdenticalPosition( nodes, x ) );
        fi;
        
        if show_equal = false then
            mult := b -> [ IdenticalPosition( nodes, b ) ];
        else
            mult :=
              function( b )
                local n;
                n := IdenticalPosition( nodes, b );
                if IsHomSetInhabited( b, a ) then
                    return [ n, n ];
                fi;
                return [ n ];
            end;
        fi;
        
        return Concatenation( List( p, mult ) );
        
    end;
    
    D := List( nodes, parents_with_multiplicity );
    
    D := Digraph( D );
    
    Perform( [ 1 .. Length( nodes ) ],
            function( i )
              local node, act, l;
              
              node := nodes[i];
              
              act := "";
              
              if all = true and not IdenticalPosition( C!.act_nodes, node ) = fail then
                  act := "@";
              fi;
              
              if node!.parity = true then
                  l := "+";
              else
                  l := "-";
              fi;
              
              l := Concatenation( act, String( node!.number ), " (", l, String( Dimension( node!.object ) ), ")" );
              
              SetDigraphVertexLabel( D, i, l );
              
          end );
    
    return D;
    
end );
    
##
InstallMethod( DigraphOfChildren,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    local all, show_equal, nodes, children, children_with_multiplicity, D;
    
    all := ValueOption( "all" );
    show_equal := ValueOption( "show_equal" );
    
    if all = true then
        nodes := C!.all_nodes;
        children := "all_children";
    else
        nodes := C!.act_nodes;
        children := "act_children";
    fi;
    
    children_with_multiplicity :=
      function( a )
        local p, mult;
        
        p := a!.(children);
        
        ## we do not expect multiplicity > 1 for reversed-inclusion arrows starting at positive nodes
        if a!.parity = true then
            return List( p, x -> IdenticalPosition( nodes, x ) );
        fi;
        
        if show_equal = false then
            mult := b -> [ IdenticalPosition( nodes, b ) ];
        else
            mult :=
              function( b )
                local n;
                n := IdenticalPosition( nodes, b );
                if IsHomSetInhabited( a, b ) then
                    return [ n, n ];
                fi;
                return [ n ];
            end;
        fi;
        
        return Concatenation( List( p, mult ) );
        
    end;
    
    D := List( nodes, children_with_multiplicity );
    
    D := Digraph( D );
    
    Perform( [ 1 .. Length( nodes ) ],
            function( i )
              local node, act, l;
              
              node := nodes[i];
              
              act := "";
              
              if all = true and not IdenticalPosition( C!.act_nodes, node ) = fail then
                  act := "@";
              fi;
              
              if node!.parity = true then
                  l := "+";
              else
                  l := "-";
              fi;
              
              l := Concatenation( act, String( node!.number ), " (", l, String( Dimension( node!.object ) ), ")" );
              
              SetDigraphVertexLabel( D, i, l );
              
          end );
    
    return D;
    
end );
    
##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    local D, out, str, i, j;
    
    D := DigraphOfParents( C );
    
    # Copied and modified from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    out   := OutNeighbours( D );
    str   := "//dot\n";
    
    Append( str, "digraph subobject_lattice{\n" );
    Append( str, "rankdir=\"TB\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in DigraphVertices( D ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( DigraphVertexLabel( D, i ) ) );
        Append( str, "\" fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
  for i in DigraphVertices( D ) do
      for j in out[i] do
          Append( str, Concatenation( String( i ), " -> ", String( j ), " [arrowsize=0.5]\n" ) );
      od;
  od;
  
  Append( str, "}\n" );
  
  return str;
  
end );

##
InstallMethod( DigraphOfPoset,
        "for a proset",
        [ IsThinCategory and IsFiniteCategory ],
        
  function( P )
    local objects, offset, D;
    
    objects := SetOfObjectsOfCategory( P );
    
    offset := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "offset", 1 );
    
    if ValueOption( "use_vertex_labels" ) = true then
        D := Digraph( objects, IsHomSetInhabited );
    else
        D := Digraph( [ offset .. offset + Length( objects ) - 1 ], { i, j } -> IsHomSetInhabited( objects[1-offset+i], objects[1-offset+j] ) );
    fi;
    
    D := DigraphReflexiveTransitiveReduction( D );
    
    SetFilterObj( D, IsDigraphOfSubobjects );
    
    return D;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        [ IsDigraphByOutNeighboursRep and IsDigraphOfSubobjects, IsList ],
        
  function( D, list_of_colorings )
    local out, str, i, pos, j;
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    out   := OutNeighbours( D );
    str   := "//dot\n";
    
    Append( str, "digraph subobject_lattice{\n" );
    Append( str, "rankdir=\"BT\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in DigraphVertices( D ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( DigraphVertexLabel( D, i ) ) );
        pos := PositionProperty( list_of_colorings, pair -> pair[1] = i );
        Append( str, "\"" );
        if IsInt( pos ) then
            Append( str, Concatenation( " color=", list_of_colorings[pos][2], " fontcolor=", list_of_colorings[pos][2] ) );
        fi;
        Append( str, " fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    for i in DigraphVertices( D ) do
        for j in out[i] do
            Append( str, Concatenation( String( i ), " -> ", String( j ), " [arrowsize=0.5]\n" ) );
        od;
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        [ IsPosetCategory and IsFiniteCategory, IsList, IsList ],
        
  function( P, lists_of_subobjects, list_of_colors )
    local c, objects, l, func, list_of_colorings;
    
    c := Length( list_of_colors );
    
    Assert( 0, Length( lists_of_subobjects ) + 1 = c );
    
    objects := SetOfObjects( P );
    
    l := Length( objects );
    
    func :=
      function( emb )
        if IsCapFunctor( emb ) then
            return List( SetOfObjects( SourceOfFunctor( emb ) ), emb );
        elif IsBoundGlobal( "IsCapSubcategory" ) and ValueGlobal( "IsCapSubcategory" )( emb ) then
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
    
    return DotVertexLabelledDigraph( DigraphOfPoset( P ), Concatenation( list_of_colorings ) );
    
end );

##
InstallMethod( Visualize,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    Splash( DotVertexLabelledDigraph( C ) );
    
end );
