# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#
BindGlobal( "PARSE_CAP_QUIVER_DATUM_FROM_STRING",
  function ( data )
    local p, name, objs, mors, q_datum, g, s, t, mor;
    
    data := ShallowCopy( data );
    
    p := Position( data, '(' );
    
    if p <> fail and p > 1 then
        name := data{[1 .. p-1]};
    else
        Error( "please use the format \"q(A,B)[x:A->B,y:B->A]\"\n" );
    fi;
    
    data := data{[p .. Length( data )]};
    Remove( data, 1 );
    Remove( data, Length( data ) );
    
    data := ReplacedString( data, "≻", ">" );
    data := ReplacedString( data, ")[", "|" );
    data := SplitString( data, "|" );
    
    if Int( data[1] ) <> fail then
        objs := List( [ 1 .. Int( data[1] ) ], String );
    elif PositionSublist( data[1], ".." ) <> fail then
        p := PositionSublist( data[1], ".." );
        objs := List( [ Int( data[1]{[ 1 .. p-1 ]} ) .. Int( data[1]{[ p+2 .. Length( data[1] ) ]} ) ], String );
    else
        objs := SplitString( data[1], "," );
    fi;
    
    if Length( data ) > 1 then
        mors := SplitString( data[2], "," );
    else
        mors := [ ];
    fi;
    
    q_datum := [ ];
    
    Add( q_datum, name );
    Add( q_datum, [ Length( objs ), objs ] );
    Add( q_datum, [ Length( mors ), [ ], [ ], [ ] ] );
    
    for mor in mors do
        
        g := SplitString( ReplacedString( mor, "->", ":" ), ":" );
        
        if Length( g ) <> 3 then
            Error( "the morphism \"", mor, "\" has an unexpected format!\n" );
        fi;
        
        s := Position( objs, g[2] );
        t := Position( objs, g[3] );
        
        if s = fail then
          Error( "the given source label \"", g[2], "\" doesn't belong the list of object labels!\n" );
        elif t = fail then
          Error( "the given target label \"", g[3], "\" doesn't belong the list of object labels!\n" );
        fi;
        
        Add( q_datum[3][2], s ); # sources
        Add( q_datum[3][3], t ); # targets
        Add( q_datum[3][4], g[1] ); # labels
        
    od;
    
    return q_datum;
    
end );

InstallGlobalFunction( RandomCapQuiver,
  
  function ( arg ) # nr_objs, nr_gmors, is_cyclic
    local nr_objs, nr_gmors, is_cyclic, datum, mors, labels, latex, s, t, p, j, triple;
    
    nr_objs := arg[1];
    nr_gmors := arg[2];
    
    if Length( arg ) = 3 then
      is_cyclic := arg[3];
    else
      is_cyclic := ValueOption( "cyclic" );
    fi;
    
    datum := [ "q", [ ], [ ] ];
    
    Add( datum[2], nr_objs );
    Add( datum[2], List( [ 1 .. nr_objs ], j -> Concatenation( "v", String( j ) ) ) );
    Add( datum[2], List( [ 1 .. nr_objs ], j -> Concatenation( "v_{", String( j ), "}" ) ) );
    
    Add( datum[3], nr_gmors );
    mors := [ ];
    labels := [ ];
    latex := [ ];
    
    
    for j in [ 1 .. nr_gmors ] do
        
        if is_cyclic = true then
            
            s := Random( [ 1 .. nr_objs ] );
            
            if j = 1 then
                t := s;
            else
                t := Random( [ 1 .. nr_objs ] );
            fi;
            
        else
            
            s := Random( [ 1 .. nr_objs - 1 ] );
            t := Random( [ s + 1 .. nr_objs ] );
            
        fi;
        
        p := Length( PositionsProperty( mors, triple -> triple[1] = s and triple[2] = t ) );
        
        Add( mors, [ s, t, p + 1 ] );
        
    od;
    
    Sort( mors );
    
    for triple in mors do
      
      s := triple[1];
      t := triple[2];
      p := triple[3];
      
      if s <> t then
        Add( labels, Concatenation( "m", String( s ), "_", String( t ), "_", String( p ) ) );
        Add(  latex, Concatenation( "m_{", String( s ), ",", String( t ), ",", String( p ), "}" ) );
      else
        Add( labels, Concatenation( "l", String( s ), "_", String( p ) ) );
        Add(  latex, Concatenation( "l_{", String( s ), ",", String( p ), "}" ) );
      fi;
      
    od;
    
    Add( datum[3], List( mors, triple -> triple[1] ) );
    Add( datum[3], List( mors, triple -> triple[2] ) );
    Add( datum[3], labels );
    Add( datum[3], latex );
    
    return CreateCapQuiver( datum );
    
end );

##
InstallGlobalFunction( CreateCapQuiver,
  
  function ( q_datum )
    local colors, name, q;
    
    if IsString( q_datum ) then
        q_datum := PARSE_CAP_QUIVER_DATUM_FROM_STRING( q_datum );
    fi;
    
    colors := ValueOption( "colors" );
    
    if colors = fail then
          
          colors := rec( obj := "", mor := "", other := "", reset := "" );
          
    elif colors = true then
          
          colors := rec( obj := TextAttr.4, mor := TextAttr.2, other := TextAttr.1, reset := TextAttr.reset );
          
    fi;
    
    name := Concatenation(
                "Quiver( \"",
                q_datum[1],
                "(",
                JoinStringsWithSeparator( q_datum[2][2], "," ),
                ")[",
                JoinStringsWithSeparator( List( [ 1 .. q_datum[3][1] ],
                    j -> Concatenation( q_datum[3][4][j], ":", q_datum[2][2][q_datum[3][2][j]],"-≻",q_datum[2][2][q_datum[3][3][j]] ) ), "," ),
                "]\" )" );
    
    q := CreateCapCategoryWithDataTypes( name,
                 IsCapQuiver,
                 IsCapQuiverObject,
                 IsCapQuiverMorphism,
                 IsCapCategoryTwoCell,
                 IsBigInt,
                 IsBigInt,
                 fail
                 : overhead := false );
    
    q!.category_as_first_argument := true;
    
    q!.colors := colors;
    
    SetQuiverDatum( q, q_datum );
    
    SetQuiverName( q, q_datum[1] );
    SetNumberOfObjects( q, q_datum[2][1] );
    SetLabelsOfObjects( q, q_datum[2][2] );
    
    if IsBound( q_datum[2][3] ) then
        SetLaTeXStringsOfObjects( q, q_datum[2][3] );
    fi;
    
    SetNumberOfMorphisms( q, q_datum[3][1] );
    SetIndicesOfSources( q, q_datum[3][2] );
    SetIndicesOfTargets( q, q_datum[3][3] );
    SetLabelsOfMorphisms( q, q_datum[3][4] );
    
    if IsBound( q_datum[3][5] ) then
        SetLaTeXStringsOfMorphisms( q, q_datum[3][5] );
    fi;
    
    ##
    AddObjectConstructor( q,
      function ( q, i )
        
        return SetOfObjects( q )[i];
        
    end );
    
    ##
    AddObjectDatum( q,
      
      function ( q, obj )
        
        return ObjectIndex( obj );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( q,
      
      function ( q, obj )
        
        return true;
        
    end );
    
    ##
    AddIsEqualForObjects( q,
      
      function ( q, obj_1, obj_2 )
        
        return IsIdenticalObj( obj_1, obj_2 );
        
    end );
    
    ##
    AddMorphismConstructor( q,
      function ( q, obj_1, i, obj_2 )
        
        if not ( IndicesOfSources( q )[i] = ObjectIndex( obj_1 ) and IndicesOfTargets( q )[i] = ObjectIndex( obj_2 ) ) then
            
            Error( "the arguments passed to 'MorphismConstructor' in ", Name( q ), " are not consistent!\n" );
            
        fi;
        
        return SetOfMorphisms( q )[i];
        
    end );
    
    ##
    AddMorphismDatum( q,
      
      function ( q, mor )
        
        return MorphismIndex( mor );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( q,
      
      function ( q, mor )
        
        return true;
        
    end );
    
    ##
    AddIsEqualForMorphisms( q,
      
      function ( q, mor_1, mor_2 )
        
        return IsIdenticalObj( mor_1, mor_2 );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( q,
      
      function ( q, mor_1, mor_2 )
        
        return IsIdenticalObj( mor_1, mor_2 );
        
    end );
    
    ##
    AddMorphismsOfExternalHom( q,
      
      function ( q, obj_1, obj_2 )
        local s, t;
        
        s := ObjectIndex( obj_1 );
        t := ObjectIndex( obj_2 );
        
        return ExternalHoms( q )[s][t];
        
    end );
    
    Finalize( q );
    
    return q;
    
end );

InstallMethod( OppositeQuiver,
          [ IsCapQuiver ],
  
  function ( q )
    local q_op;
    
    q_op :=
      CreateCapQuiver(
         NTuple( 3,
           Concatenation( QuiverName( q ), "_op" ),
           NTuple( 3,
             NumberOfObjects( q ),
             LabelsOfObjects( q ),
             LaTeXStringsOfObjects( q ) ),
           NTuple( 5,
             NumberOfMorphisms( q ),
             IndicesOfTargets( q ),
             IndicesOfSources( q ),
             LabelsOfMorphisms( q ),
             LaTeXStringsOfMorphisms( q ) ) ) );
    
    SetOppositeQuiver( q_op, q );
    
    return q_op;
    
end );

##
InstallMethod( TensorProductOfCapQuivers,
          [ IsCapQuiver, IsCapQuiver ],
  
  function ( q1, q2 )
    local nr_objs, labels_objs, latex_strings_objs, nr_gmors, labels_gmors, latex_strings_gmors, sources_gmors, targets_gmors;
    
    nr_objs := NumberOfObjects( q1 ) * NumberOfObjects( q2 );
    
    labels_objs  := Concatenation( List( LabelsOfObjects( q1 ), l -> List( LabelsOfObjects( q2 ), r -> Concatenation( l, "⊗", r ) ) ) );
    
    latex_strings_objs := Concatenation( List( LaTeXStringsOfObjects( q1 ), l -> List( LaTeXStringsOfObjects( q2 ), r -> Concatenation( l, "\\otimes ", r ) ) ) );
    
    nr_gmors := NumberOfObjects( q1 ) * NumberOfMorphisms( q2 ) + NumberOfMorphisms( q1 ) * NumberOfObjects( q2 );
    
    labels_gmors :=
        Concatenation(
            [ Concatenation( List( LabelsOfObjects( q1 ), l -> List( LabelsOfMorphisms( q2 ), r -> Concatenation( l, "⊗", r ) ) ) ),
              Concatenation( List( LabelsOfMorphisms( q1 ), l -> List( LabelsOfObjects( q2 ), r -> Concatenation( l, "⊗", r ) ) ) ) ] );
    
    latex_strings_gmors :=
        Concatenation(
            [ Concatenation( List( LaTeXStringsOfObjects( q1 ), l -> List( LaTeXStringsOfMorphisms( q2 ), r -> Concatenation( l, "\\otimes ", r ) ) ) ),
              Concatenation( List( LaTeXStringsOfMorphisms( q1 ), l -> List( LaTeXStringsOfObjects( q2 ), r -> Concatenation( l, "\\otimes ", r ) ) ) ) ] );

    sources_gmors :=
        Concatenation(
            [ Concatenation( List( [ 1 .. NumberOfObjects( q1 ) ], l -> List( IndicesOfSources( q2 ), r -> (l-1) * NumberOfObjects( q2 ) + r ) ) ),
              Concatenation( List( IndicesOfSources( q1 ), l -> List( [ 1 .. NumberOfObjects( q2 ) ], r -> (l-1) * NumberOfObjects( q2 ) + r ) ) ) ] );
    
    targets_gmors :=
        Concatenation(
            [ Concatenation( List( [ 1 .. NumberOfObjects( q1 ) ], l -> List( IndicesOfTargets( q2 ), r -> (l-1) * NumberOfObjects( q2 ) + r ) ) ),
              Concatenation( List( IndicesOfTargets( q1 ), l -> List( [ 1 .. NumberOfObjects( q2 ) ], r -> (l-1) * NumberOfObjects( q2 ) + r ) ) ) ] );
    
    return
      CreateCapQuiver(
         NTuple( 3,
           Concatenation( QuiverName( q1 ), "⊗", QuiverName( q2 ) ),
           NTuple( 3,
             nr_objs,
             labels_objs,
             latex_strings_objs ),
           NTuple( 5,
             nr_gmors,
             sources_gmors,
             targets_gmors,
             labels_gmors,
             latex_strings_gmors ) ) : colors := q1!.colors );

end );

##
InstallMethod( SetOfObjects,
          [ IsCapQuiver ],
  
  function ( q )
    
    return List( [ 1 .. NumberOfObjects( q ) ],
              i -> CreateCapCategoryObjectWithAttributes( q, ObjectIndex, i, CapQuiver, q ) );
    
end );

##
InstallMethod( SetOfMorphisms,
          [ IsCapQuiver ],
  
  function ( q )
    
    return List( [ 1 .. NumberOfMorphisms( q ) ],
              j -> CreateCapCategoryMorphismWithAttributes( q,
                        ObjectConstructor( q, IndicesOfSources( q )[j] ),
                        ObjectConstructor( q, IndicesOfTargets( q )[j] ),
                        MorphismIndex, j,
                        CapQuiver, q ) );
    
end );

##
InstallMethod( LaTeXStringsOfObjects,
          [ IsCapQuiver ],
  function ( q )
    
    return LabelsOfObjects( q );
    
end );

##
InstallMethod( LaTeXStringsOfMorphisms,
          [ IsCapQuiver ],
  function ( q )
    
    return LabelsOfMorphisms( q );
    
end );

##
InstallMethod( IndicesPairsOfCompatibleMorphisms,
          [ IsCapQuiver ],
  
  function ( q )
    local sources, targets;
    
    sources := IndicesOfSources( q );
    targets := IndicesOfTargets( q );
    
    return Concatenation( List( [ 1 .. NumberOfMorphisms( q ) ], i -> List( Filtered( [ 1 .. NumberOfMorphisms( q ) ], j -> targets[i] = sources[j] ), j -> [ i, j ] ) ) );
    
end );

##
InstallMethod( ExternalHoms,
          [ IsCapQuiver ],
  
  function ( q )
    local sources, targets;
    
    sources := IndicesOfSources( q );
    targets := IndicesOfTargets( q );
    
    return List( [ 1 .. NumberOfObjects( q ) ],
              s -> List( [ 1 .. NumberOfObjects( q ) ],
                t -> SetOfMorphisms( q ){Filtered( [ 1 .. NumberOfMorphisms( q ) ], j -> s = sources[j] and t = targets[j] )} ) );
    
end );

##
InstallMethod( \.,
        "for a cap-quiver and a label of an object or morphism",
        [ IsCapQuiver, IsPosInt ],
  
  function ( q, string_as_int )
    local name, i;
    
    name := NameRNam( string_as_int );
    
    i := Position( LabelsOfObjects( q ), name );
    
    if i <> fail then
        return SetOfObjects( q )[i];
    fi;
    
    i := Position( LabelsOfMorphisms( q ), name );
    
    if i <> fail then
        return SetOfMorphisms( q )[i];
    fi;
    
    Error( "the label '", name, "' can't be recognized!\n" );
    
end );

##
InstallMethod( ObjectLabel,
          [ IsCapQuiverObject ],
  
  obj -> LabelsOfObjects( CapQuiver( obj ) )[ObjectIndex( obj )]
);

##
InstallMethod( LaTeXOutput,
          [ IsCapQuiverObject ],
  
  obj -> LaTeXStringsOfObjects( CapQuiver( obj ) )[ObjectIndex( obj )]
);

##
InstallMethod( MorphismLabel,
          [ IsCapQuiverMorphism ],
  
  mor -> LabelsOfMorphisms( CapQuiver( mor ) )[MorphismIndex( mor )]
);

##
InstallMethod( LaTeXOutput,
          [ IsCapQuiverMorphism ],
  
  function ( mor )
    local str;
    
    str := LaTeXStringsOfMorphisms( CapQuiver( mor ) )[MorphismIndex( mor )];
    
    if ValueOption( "OnlyDatum" ) = true then
      
      return str;
      
    else
      
      return Concatenation(
                "{", LaTeXOutput( Source( mor ) ), "}-\\left(",
                "{", str, "}\\right)\\rightarrow",
                "{", LaTeXOutput( Target( mor ) ), "}" );
      
    fi;
    
end );

###################
#
# View Methods
#
###################

##
InstallMethod( ViewString,
          [ IsCapQuiverObject ],
  
  function ( obj )
    local colors;
    
    colors := CapQuiver( obj )!.colors;
    
    return Concatenation( colors.obj, "(", ObjectLabel( obj ), ")", colors.reset );
    
end );

##
InstallMethod( DisplayString,
          [ IsCapQuiverObject ],
  
  ViewString
);

##
InstallMethod( ViewString,
          [ IsCapQuiverMorphism ],
  
  function ( mor )
    local colors;
    
    colors := CapQuiver( mor )!.colors;
    
    return
      Concatenation(
          colors.mor,
          MorphismLabel( mor ),
          colors.reset,
          colors.other,
          ":",
          ViewString( Source( mor ) ),
          colors.other,
          " -≻ ",
          ViewString( Target( mor ) ) );
    
end );

##
InstallMethod( DisplayString,
          [ IsCapQuiverMorphism ],
  
  ViewString
);

