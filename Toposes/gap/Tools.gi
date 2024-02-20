# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

#= comment for Julia
if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then

##
InstallMethod( DigraphOfSubobjects,
               [ IsCapCategoryObject ],
               
  function( A )
    local subobjects, D;
    
    subobjects := ListOfSubobjects( A );
    
    D := Digraph( [ 1 .. Length( subobjects ) ],
                 { i, j } -> IsLiftableAlongMonomorphism( subobjects[i], subobjects[j] ) );
    
    D := DigraphReflexiveTransitiveReduction( D );
    
    SetFilterObj( D, IsDigraphOfSubobjects );
    
    return D;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        [ IsDigraphByOutNeighboursRep and IsDigraphOfSubobjects ],

  function( D )
    local out, str, i, j;
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
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

fi;
# =#
