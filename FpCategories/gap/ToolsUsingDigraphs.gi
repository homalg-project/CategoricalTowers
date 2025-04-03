# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
InstallMethod( QuiverStringOfDigraph,
               [ IsDigraph, IsString, IsString ],
               
  function( digraph, name, mor )
    local string, vertices, label, labels, mors;
    
    string := [ name, "(" ];
    
    vertices := DigraphVertices( digraph );
    
    label :=
      function( vertex )
        local str;
        
        str := String( DigraphVertexLabel( digraph, vertex ) );
        
        if First( str ) = '(' and Last( str ) = ')' then
            str := str{[ 2 .. Length( str ) - 1 ]};
        fi;
        
        return str;
        
    end;
    
    labels := List( vertices, label );
    
    Append( string, [ JoinStringsWithSeparator( labels, "," ), ")[" ] );
    
    mors :=
      function( s )
        local targets;
        
        targets := OutNeighborsOfVertex( digraph, s );
        
        if DuplicateFreeList( targets ) = targets then
            return List( targets, t ->
                         Concatenation( mor, "_", String( s ), "_", String( t ), ":", labels[s], "->", labels[t] ) );
        else
            return List( [ 1 .. Length( targets ) ], i ->
                         Concatenation( mor, "_", String( s ), "_", String( targets[i] ), "_", String( i ), ":", labels[s], "->", labels[targets[i]] ) );
        fi;
        
    end;
    
    Append( string, [ JoinStringsWithSeparator( Concatenation( List( [ 1 .. Length( vertices ) ], mors ) ), "," ), "]" ] );
    
    return Concatenation( string );
    
end );
