# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# Implementations
#

##
InstallMethod( ListOfEvaluationNodes,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory ],

  function( c )
    local nodes, queue, add_to_nodes, add_to_queue, children, D;
    
    nodes := [ ];
    
    queue := [ c ];

    add_to_nodes :=
      function( a )
        if PositionProperty( nodes, b -> AreEqualForLazyCells( a, b ) ) = fail then
            Add( nodes, a );
        fi;
    end;
    
    add_to_queue :=
      function( a )
        if PositionProperty( Concatenation( nodes, queue ), b -> AreEqualForLazyCells( a, b ) ) = fail then
            Add( queue, a );
        fi;
    end;
    
    while not IsEmpty( queue ) do
        
        c := Remove( queue, 1 );
        
        add_to_nodes( c );
        
        if HasGenesisOfCell( c ) then
            
            children := GenesisOfCellArguments( c );
            
            children := Flat( children );
            
            children := Filtered( children, IsCellInLazyCategory );
            
            Perform( children, add_to_queue );
            
        fi;
        
    od;
    
    nodes := Reversed( nodes );
    
    D := List( nodes, node -> PositionsOfChildrenOfALazyCell( node, nodes ) );
    
    D := Digraph( D );
    
    return nodes{DigraphTopologicalSort( D )};
    
end );

##
InstallMethod( DigraphOfEvaluation,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory ],

  function( c )
    local nodes, D;
    
    nodes := ListOfEvaluationNodes( c );
    
    D := List( nodes, node -> PositionsOfChildrenOfALazyCell( node, nodes ) );
    
    D := Digraph( D );
    
    D := DigraphReverse( D );
    
    D!.list_of_children := [ ];
    
    Perform( [ 1 .. Length( nodes ) ],
            function( i )
              local node, l, ints;
              
              node := nodes[i];
              
              if HasGenesisOfCell( node ) then
                  l := GenesisOfCellOperation( node );
                  l := CAP_INTERNAL_COMPACT_NAME_OF_CATEGORICAL_OPERATION( l );
                  ints := Filtered( GenesisOfCellArguments( node ), IsInt );
                  if not IsEmpty( ints ) then
                      l := Concatenation( l, "( ", JoinStringsWithSeparator( ints, ", " ), " )" );
                  fi;
              elif IsCapCategoryCell( node ) then
                  l := "primitive";
                  if IsCapCategoryObject( node ) then
                      l := Concatenation( l, "\n", "object" );
                  elif IsCapCategoryMorphism( node ) then
                      l := Concatenation( l, "\n", "morphism" );
                  fi;
                  GetLabel( node );
                  if IsBound( node!.Label ) then
                      l := Concatenation( l, "\n<", node!.Label, ">" );
                  fi;
              fi;
              
              l := Concatenation( "[", String( i ), "]\n", l );
              
              SetDigraphVertexLabel( D, i, l );
              
              D!.list_of_children[i] := PositionsOfChildrenOfALazyCell( node, nodes );
              
          end );
          
    return D;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory ],
        
  function( c )
    local D, str, i, j, list_of_children, children, l;
    
    D := DigraphOfEvaluation( c );
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph hgn{\n" );
    Append( str, "node [shape=rect]\n" );
    
    for i in DigraphVertices( D ) do
        Append( str, String(i) );
        Append( str, " [label=\"" );
        Append( str, String( DigraphVertexLabel( D, i ) ) );
        Append( str, "\"]\n" );
    od;
    
    list_of_children := D!.list_of_children;
    
    for i in DigraphVertices( D ) do
        children := list_of_children[i];
        l := Length( children );
        if l > 1 and Length( Set( children ) ) > 1 then
            for j in [ 1 .. l ] do
                Append( str, Concatenation( String(children[j]), " -> ", String(i), " [ label=\"", String(j), "\" ]\n" ) );
            od;
        else
            for j in [ 1 .. l ] do
                Append( str, Concatenation( String(children[j]), " -> ", String(i), " \n" ) );
            od;
        fi;
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallMethod( Visualize,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory ],
        
  function( c )
    
    Splash( DotVertexLabelledDigraph( c ) );
    
end );
