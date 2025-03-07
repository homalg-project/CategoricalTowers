# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
InstallMethod( PathCategory,
          [ IsFinQuiver ],
  
  function ( q )
    local admissible_order, name, C, range_of_HomStructure;
    
    admissible_order := ValueOption( "admissible_order" );
    
    if admissible_order = fail then
        
        ## like QPA
        admissible_order := "dp";
        
    elif not admissible_order in [ "dp", "Dp" ] then
        
        Error( "only \"dp\" and \"Dp\" admissible orders are supported!\n" );
        
    fi;
    
    name := Concatenation( "PathCategory( ", Name( q ), " )" );
    
    C := CreateCapCategoryWithDataTypes( name,
                 IsPathCategory,
                 IsPathCategoryObject,
                 IsPathCategoryMorphism,
                 IsCapCategoryTwoCell,
                 IsBigInt,
                 CapJitDataTypeOfNTupleOf( 2,
                         IsBigInt,
                         CapJitDataTypeOfListOf( IsBigInt ) ),
                 fail
                 : overhead := false );
    
    C!.category_as_first_argument := true;
    
    C!.admissible_order := admissible_order;
    
    SetIsFinitelyPresentedCategory( C, true );
    
    SetUnderlyingQuiver( C, q );
    
    SetDefiningTripleOfUnderlyingQuiver( C,
            Triple( NumberOfObjects( q ),
                    NumberOfMorphisms( q ),
                    ListN( IndicesOfSources( q ), IndicesOfTargets( q ), { s, t } -> Pair( -1 + s, -1 + t ) ) ) );
    
    C!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingQuiver",
             "DefiningTripleOfUnderlyingQuiver",
             ],
           );
    
    ##
    AddObjectConstructor( C,
      function ( C, obj_index )
        
        return SetOfObjects( C )[obj_index];
        
    end );
    
    ##
    AddObjectDatum( C,
      function ( C, obj )
        
        return ObjectIndex( obj );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( C,
      function ( C, obj )
        
        return true;
        
    end );
    
    ##
    AddIsEqualForObjects( C,
      function ( C, obj_1, obj_2 )
        
        return IsIdenticalObj( obj_1, obj_2 );
        
    end );
    
    ##
    AddMorphismConstructor( C,
      function ( C, source, datum, target )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( datum[2], IsBigInt ) );
        
        return CreateCapCategoryMorphismWithAttributes( C,
                       source, target,
                       MorphismLength, datum[1],
                       MorphismIndices, datum[2] );
        
    end );
     
    ##
    AddMorphismDatum( C,
      function ( C, mor )
        
        return Pair( MorphismLength( mor ), MorphismIndices( mor ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( C,
      function ( C, mor )
        local q, l, s;
        
        q := UnderlyingQuiver( C );
        
        l := MorphismLength( mor );
        s := MorphismSupport( mor );
        
        return l = Length( s ) and
               ( ( l = 0 and IsEndomorphism( C, mor ) ) or
                 ( ObjectIndex( Source( mor ) ) = ObjectIndex( Source( First( s ) ) ) and
                   ObjectIndex( Target( mor ) ) = ObjectIndex( Target( Last( s ) ) ) ) ) and
               ForAll( [ 1 .. l - 1 ], j -> Target( s[j] ) = Source( s[j+1] ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( C,
      function ( C, mor_1, mor_2 )
        
        return IsEqualForObjects( C, Source( mor_1 ), Source( mor_2 ) )
                and IsEqualForObjects( C, Target( mor_1 ), Target( mor_2 ) )
                and MorphismLength( mor_1 ) = MorphismLength( mor_2 )
                and MorphismIndices( mor_1 ) = MorphismIndices( mor_2 );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( C,
      function ( C, mor_1, mor_2 )
        
        return IsEqualForMorphisms( C, mor_1, mor_2 );
        
    end );
    
    AddIdentityMorphism( C,
      function ( C, obj )
        
        return MorphismConstructor( C,
                       obj,
                       Pair( BigInt( 0 ),
                             CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ) ),
                       obj );
        
    end );
    
    AddPreCompose( C,
      function ( C, mor_1, mor_2 )
        
        return MorphismConstructor( C,
                      Source( mor_1 ),
                      Pair( MorphismLength( mor_1 ) + MorphismLength( mor_2 ),
                            Concatenation( MorphismIndices( mor_1 ), MorphismIndices( mor_2 ) ) ),
                      Target( mor_2 ) );
        
    end );
    
    ##
    AddSetOfObjectsOfCategory( C,
      function ( C )
        
        return List( [ 1 .. NumberOfObjects( UnderlyingQuiver( C ) ) ], obj_index ->
                     CreateCapCategoryObjectWithAttributes( C, ObjectIndex, obj_index ) );
        
    end );
    
    ##
    AddSetOfGeneratingMorphismsOfCategory( C,
      function ( C )
        local q, s, t;
        
        q := UnderlyingQuiver( C );
        
        s := IndicesOfSources( q );
        t := IndicesOfTargets( q );
        
        return List( [ 1 .. NumberOfMorphisms( q ) ], mor ->
                     MorphismConstructor( C,
                             SetOfObjects( C )[s[mor]],
                             Pair( BigInt( 1 ), [ mor ] ),
                             SetOfObjects( C )[t[mor]] ) );
        
    end );
    
    ##
    AddRandomObjectByInteger( C,
      function ( C, n )
        
        return Random( SetOfObjects( C ) );
        
    end );
    
    ##
    AddRandomMorphismWithFixedSourceByInteger( C,
      function ( C, obj, n )
        local s, t, m;
        
        s := ObjectIndex( obj );
        t := Random( [ 1 .. NumberOfObjects( UnderlyingQuiver( C ) ) ] );
        
        m := ExternalHomsWithGivenLength( C, 0, n )[s][t];
        
        if m = [ ] then
              return IdentityMorphism( C, obj );
        else
              return Random( m );
        fi;
        
    end );
    
    ##
    AddRandomMorphismWithFixedRangeByInteger( C,
      function ( C, obj, n )
        local s, t, m;
        
        s := Random( [ 1 .. NumberOfObjects( UnderlyingQuiver( C ) ) ] );
        t := ObjectIndex( obj );
        
        m := ExternalHomsWithGivenLength( C, 0, n )[s][t];
        
        if m = [ ] then
              return IdentityMorphism( C, obj );
        else
              return Random( m );
        fi;
        
    end );
    
    ##
    AddRandomMorphismWithFixedSourceAndRangeByInteger( C,
      function ( C, obj_1, obj_2, n )
        local s, t, p;
        
        s := ObjectIndex( obj_1 );
        t := ObjectIndex( obj_2 );
        
        p := PositionProperty( [ 1 .. n + 1 ], i -> ExternalHomsWithGivenLength( C, n + 1 - i )[s][t] <> [ ] );
        
        if p = fail then
              return fail;
        else
              return Random( ExternalHomsWithGivenLength( C, n + 1 - p )[s][t] );
        fi;
        
    end );
    
    # Homomorphism Structure - Only for path categories with underlying acyclic quivers
    
    if IsFinitePathCategory( C )  then
        
        SetIsFiniteCategory( C, true );
        
        range_of_HomStructure := ValueOption( "range_of_HomStructure" );
        
        if not IsSkeletalCategoryOfFiniteSets( range_of_HomStructure ) then
            range_of_HomStructure := SkeletalFinSets;
        fi;
        
        SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( C, range_of_HomStructure );
        
        Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( C ), range_of_HomStructure ) );
        
        AddMorphismsOfExternalHom( C,
          function ( C, obj_1, obj_2 )
            local s, t;
            
            s := ObjectIndex( obj_1 );
            t := ObjectIndex( obj_2 );
            
            return ExternalHoms( C )[s][t];
            
        end );
        
    fi;
    
    Finalize( C );
    
    return C;
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a path category",
        [ IsPathCategory ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a path category",
        [ IsPathCategory ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallOtherMethod( DecompositionIndicesOfMorphism,
        "for a path category and a morphism therein",
        [ IsPathCategory, IsPathCategoryMorphism ],
        
  function( C, mor )
    
    return -1 + MorphismDatum( C, mor )[2];
    
end );

##
InstallMethod( DecompositionOfMorphismInCategory,
        "for a morphism in a path category",
        [ IsPathCategoryMorphism ],
        
  function( mor )
    local C, dec;
    
    C := CapCategory( mor );
    
    dec := SetOfGeneratingMorphisms( C ){1 + DecompositionIndicesOfMorphism( C, mor )};
    
    if ForAny( dec, IsEqualToIdentityMorphism ) then
        Error( "one of the generating morphisms is an identity morphism\n" );
    fi;
    
    return dec;
    
end );

##
InstallMethod( ExternalHomsWithGivenLengthDataOp,
        [ IsPathCategory, IsInt ],
  
  function ( C, len )
    local q, nr_objs, nr_gmors, gmors, data, prev_data, r, j, s;
    
    q := UnderlyingQuiver( C );
    
    nr_objs := NumberOfObjects( q );
    nr_gmors := NumberOfMorphisms( q );
    
    gmors := List( [ 1 .. nr_gmors ], j -> Pair( IndicesOfSources( q )[j], IndicesOfTargets( q )[j] ) );
    
    data := List( [ 1 .. nr_objs ], s -> List( [ 1 .. nr_objs ], t -> [ ] ) );
    
    if len = 0 then
      
      for r in [ 1 .. nr_objs ] do
          data[r][r] := Concatenation( data[r][r], [ [ ] ] );
      od;
      
    else
      
      prev_data := ExternalHomsWithGivenLengthData( C, len - 1 );
      
      # It is better to get the morphisms already sorted from max to min, hence:
      
      if C!.admissible_order = "Dp" then
        
        for r in [ 1 .. nr_objs ] do
          for j in [ 1 .. nr_gmors ] do
            data[gmors[j][1]][r] := Concatenation( data[gmors[j][1]][r], List( prev_data[gmors[j][2]][r], l -> Concatenation( [ j ], l ) ) );
          od;
        od;
        
      elif C!.admissible_order = "dp" then
        
        for s in [ 1 .. nr_objs ] do
          for j in [ 1 .. nr_gmors ] do
            data[s][gmors[j][2]] := Concatenation( data[s][gmors[j][2]], List( prev_data[s][gmors[j][1]], l -> Concatenation( l, [ j ] ) ) );
          od;
        od;
        
      fi;
      
    fi;
    
    return data;
    
end );

##
InstallMethod( ExternalHomsWithGivenLengthOp,
        [ IsPathCategory, IsInt ],
  
  function ( C, len )
    local q, supports;
    
    q := UnderlyingQuiver( C );
    
    supports := ExternalHomsWithGivenLengthData( C, len );
    
    return List( [ 1 .. NumberOfObjects( q ) ], s ->
                 List( [ 1 .. NumberOfObjects( q ) ], t ->
                       List( supports[s][t], supp ->
                             MorphismConstructor( C,
                                     SetOfObjects( C )[s],
                                     Pair( len, supp ),
                                     SetOfObjects( C )[t] ) ) ) );
    
end );

##
InstallOtherMethod( ExternalHomsWithGivenLength,
            "for path categories",
        [ IsCapCategory, IsInt, IsInt ],
  
  function ( C, l, u )
    local nr_objs;
    
    nr_objs := NumberOfObjects( UnderlyingQuiver( C ) );
    
    return LazyHList( [ 1 .. nr_objs ],
              s -> LazyHList( [ 1 .. nr_objs ],
                      t -> Concatenation( List( [ l .. u ],
                              len -> ExternalHomsWithGivenLength( C, u + l - len )[s][t] ) ) ) );
    
end );

##
InstallMethod( UnderlyingQuiverObject,
          [ IsPathCategoryObject ],
  
  function ( obj )
    local q;
    
    q := UnderlyingQuiver( CapCategory( obj ) );
    
    return SetOfObjects( q )[ObjectIndex( obj )];
    
end );

##
InstallMethod( LaTeXOutput,
          [ IsPathCategoryObject ],
  
  function ( obj )
    
    return LaTeXOutput( UnderlyingQuiverObject( obj ) );
    
end );

##
InstallMethod( ObjectLabel,
          [ IsPathCategoryObject ],
  
  function ( obj )
    
    return ObjectLabel( UnderlyingQuiverObject( obj ) );
    
end );

##
InstallOtherMethod( CanonicalRepresentative,
        [ IsPathCategoryMorphism ],
  
  IdFunc
);

##
InstallMethod( MorphismLabel,
          [ IsPathCategoryMorphism ],
  
  function ( alpha )
    local C, datum, labels;
    
    C := CapCategory( alpha );
    
    if MorphismLength( alpha ) = 0 then
      
      return Concatenation( "id(", ObjectLabel( Source( alpha ) ), ")" );
      
    else
      
      labels := CollectEntries( List( MorphismSupport( alpha ), MorphismLabel ) );
      
      return JoinStringsWithSeparator(
                ListN( labels,
                  function ( l )
                    
                    if l[2] = 1 then
                      return l[1];
                    else
                      return Concatenation( l[1], "^", String( l[2] ) );
                    fi;
                    
                  end ), "⋅" );
      
    fi;
    
end );

##
InstallMethod( MorphismSupport,
          [ IsPathCategoryMorphism ],
  
  function ( alpha )
    local q;
    
    q := UnderlyingQuiver( CapCategory( alpha ) );
    
    return SetOfMorphisms( q ){MorphismIndices( alpha )};
    
end );

##
InstallOtherMethod( MorphismConstructor,
          [ IsPathCategory, IsPathCategoryObject, IsInt, IsDenseList, IsPathCategoryObject ],
  
  function ( C, source, length, support, target )
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, ForAll( support, MorphismFilter( UnderlyingQuiver( C ) ) ) );
    
    return MorphismConstructor( C,
                   source,
                   Pair( length, List( support, MorphismIndex ) ),
                   target );
    
end );

##
InstallMethod( LaTeXOutput,
          [ IsPathCategoryMorphism ],
  
  function ( alpha )
    local C, datum, string, labels;
    
    C := CapCategory( alpha );
    
    datum := MorphismDatum( alpha );
    
    if datum[1] = 0 then
      
      string := Concatenation( "id(", LaTeXOutput( Source( alpha ) ), ")" );
      
    else
      
      labels := CollectEntries( LabelsOfMorphisms( UnderlyingQuiver( C ) ){MorphismIndices( alpha )} );
      
      string := JoinStringsWithSeparator(
                  ListN( labels,
                    function ( label )
                      
                      if label[2] = 1 then
                        return label[1];
                      else
                        return Concatenation( label[1], "^{", String( label[2] ), "}" );
                      fi;
                      
                    end ), " " );
      
    fi;
    
    if ValueOption( "OnlyDatum" ) = true then
      
      return string;
      
    else
      
      return Concatenation(
                "{", LaTeXOutput( Source( alpha ) ), "}-\\left(",
                "{", string, "}\\right)\\rightarrow",
                "{", LaTeXOutput( Target( alpha ) ), "}" );
    
    fi;
    
end );

##
InstallMethod( AssignSetOfObjects,
        [ IsPathCategory, IsString ],
  
  function ( C, label )
    local names, func;
    
    names := LabelsOfObjects( UnderlyingQuiver( C ) );
    
    if label = "" and ForAny( names, name -> Int( name ) <> fail ) then
        Error( "the <label> passed to 'AssignSetOfObjects' must be a non-empty string!\n" );
    fi;
    
    func :=
      function ( name, o )
        
        name := Concatenation( label, ReplacedString( name, "-", "m" ) );
        MakeReadWriteGlobal( name );
        DeclareSynonym( name, o );
        return true;
        
    end;
    
    ListN( names, SetOfObjects( C ), func );
    
end );

##
InstallOtherMethod( AssignSetOfObjects,
        [ IsPathCategory ],
  
  function ( C )
    
    AssignSetOfObjects( C, "" );
    
end );

##
InstallMethod( AssignSetOfGeneratingMorphisms,
        [ IsPathCategory, IsString ],
  
  function ( C, label )
    local names, morphisms, func;
    
    names := LabelsOfMorphisms( UnderlyingQuiver( C ) );
    
    if label = "" and ForAny( names, name -> Int( name ) <> fail ) then
        Error( "the <label> passed to 'AssignSetOfGeneratingMorphisms' must be a non-empty string!\n" );
    fi;
    
    morphisms := SetOfGeneratingMorphisms( C );
    
    func :=
      function ( name, m )
        
        name := Concatenation( label, ReplacedString( name, "-", "m" ) );
        MakeReadWriteGlobal( name );
        DeclareSynonym( name, m );
        return true;
        
    end;
    
    ListN( names, morphisms, func );
    
end );

##
InstallOtherMethod( AssignSetOfGeneratingMorphisms,
        [ IsPathCategory ],
  
  function ( C )
    
    AssignSetOfGeneratingMorphisms( C, "" );
    
end );

##
InstallOtherMethod( \/,
        [ IsFinQuiverMorphism, IsPathCategory ],
  
  function ( mor, C )
    
    return SetOfGeneratingMorphisms( C )[MorphismIndex( mor )];
    
end );

##
InstallMethod( \.,
        "for an algebroid from data table and a positive integer",
        [ IsPathCategory, IsPosInt ],
  
  function ( C, string_as_int )
    local name, q, objs_labels, mors_labels, p, id_mors_labels, label, labels, l, m, power;
    
    name := NameRNam( string_as_int );
    
    q := UnderlyingQuiver( C );
    
    objs_labels := LabelsOfObjects( q );
    mors_labels := LabelsOfMorphisms( q );
    
    p := Position( objs_labels, name );
    
    if p <> fail then
        return SetOfObjects( C )[p];
    fi;
    
    id_mors_labels := List( objs_labels, obj -> Concatenation( "id(", obj, ")" ) );
    
    if name in id_mors_labels then
        
        label := name{[4 .. Length(name) - 1]};
        
        if label in objs_labels then
            return IdentityMorphism( C, C.(label) );
        fi;
        
    fi;
    
    id_mors_labels := List( objs_labels, obj -> Concatenation( "id_", obj ) );
    
    if name in id_mors_labels then
        
        label := name{[4 .. Length(name)]};
        
        if label in objs_labels then
            return IdentityMorphism( C, C.(label) );
        fi;
        
    fi;
    
    p := Position( mors_labels, name );
    
    if p <> fail then
        return SetOfGeneratingMorphisms( C )[p];
    fi;
    
    if ForAny( [ "⋅", "*" ], s -> PositionSublist( name, s ) <> fail ) then
      
      labels := SplitString( ReplacedString( name, "⋅", "*" ), "*" );
      
      return PreComposeList( C, List( labels, label -> C.(label) ) );
      
    else
      
      # starting matching at the end is usually less error prone
      p := PositionProperty( mors_labels, label -> Length( name ) >= Length( label ) and IsMatchingSublist( name, label, Length( name ) - Length( label ) + 1 ) );
      
      if p <> fail then
          
          label := mors_labels[p];
          
          l := Length( name ) - Length( label );
          
          m := SetOfGeneratingMorphisms( C )[p];
          
          if l = 0 then
              return m;
          else
              return PreCompose( C, C.(name{[1 .. l]}), m );
          fi;
          
      else
          
          p := Positions( name, '^' );
          
          if p <> [ ] then
              
              p := Last( p );
              
              power := Int( name{[ p + 1 .. Length( name ) ]} );
              
              if power <> fail then
                    
                    name := name{[ 1 .. p - 1 ]};
                    
                    p := PositionProperty( mors_labels,
                                  label -> Length( name ) >= Length( label ) and IsMatchingSublist( name, label, Length( name ) - Length( label ) + 1 ) );
                    
                    if p <> fail then
                        
                        label := mors_labels[p];
                        
                        l := Length( name ) - Length( label );
                        
                        m := PreComposeList( C, ListWithIdenticalEntries( power, SetOfGeneratingMorphisms( C )[p] ) );
                        
                        if l = 0 then
                            return m;
                        else
                            return PreCompose( C, C.(name{[1 .. l]}), m );
                        fi;
                        
                    fi;
                    
              fi;
              
          fi;
          
      fi;
      
    fi;
    
    Error( "the label '", name, "' can't be recognized! please try 'f*g' (or 'f⋅g') instead of 'fg'; and 'f*f' (or 'f⋅f') instead of 'f^2'\n" );
    
end );

##
InstallMethod( OppositePathCategory,
        "for a path category",
        [ IsPathCategory ],
        
  function( C )
    local quiver_op, range_category, C_op;
    
    quiver_op := OppositeQuiver( UnderlyingQuiver( C ) );
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        C_op := PathCategory( quiver_op : range_of_HomStructure := RangeCategoryOfHomomorphismStructure( C ) );
    else
        C_op := PathCategory( quiver_op );
    fi;
    
    SetOppositePathCategory( C_op, C );
    
    return C_op;
    
end );

##
InstallOtherMethod( CapFunctor,
        "for a path category, two lists, and a category",
        [ IsPathCategory, IsList, IsList, IsCapCategory ],
        
  function( C, imgs_of_objs, imgs_of_gmors, D )
    local F;
    
    F := CapFunctor( Concatenation( "Functor from ", Name( C ), " -> ", Name( D ) ), C, D );
    
    AddObjectFunction( F,
      function ( obj )
        
        return imgs_of_objs[ObjectIndex( obj )];
        
    end );
    
    AddMorphismFunction( F,
      function ( F_s, mor, F_t )
        
        return PreComposeList( D, F_s, imgs_of_gmors{MorphismIndices( mor )}, F_t );
        
    end );
    
    return F;
    
end );

###################
#
# Orders
#
###################

## Check whether mor_1 < mor_2

##
InstallMethod( IsAscendingForMorphisms,
          [ IsPathCategory, IsPathCategoryMorphism, IsPathCategoryMorphism, IsString ],
  
  function ( C, mor_1, mor_2, admissible_order )
    local s_1, t_1, s_2, t_2, l_1, m_1, l_2, m_2, i, p_1, p_2, j;
    
    s_1 := ObjectIndex( Source( mor_1 ) );
    t_1 := ObjectIndex( Target( mor_1 ) );
    
    s_2 := ObjectIndex( Source( mor_2 ) );
    t_2 := ObjectIndex( Target( mor_2 ) );
    
    if not ( s_1 = s_2 and t_1 = t_2 ) then
        Error( "the morphisms passed to 'Is(A/De)scendingForMorphisms' must have the same source & target!\n" );
    fi;
    
    l_1 := MorphismLength( mor_1 );
    m_1 := MorphismIndices( mor_1 );
    
    l_2 := MorphismLength( mor_2 );
    m_2 := MorphismIndices( mor_2 );
    
    # left-degree-lexicographic order
    if admissible_order = "Dp" then
      
      if l_1 <> l_2 then
          
          return l_1 < l_2;
          
      else
          
          i := PositionProperty( [ 1 .. l_1 ], j -> m_1[j] <> m_2[j] );
          
          return i <> fail and m_1[i] > m_2[i];
          
      fi;
      
    fi;
    
    # right-degree-lexicographic order
    if admissible_order = "dp" then
      
      if l_1 <> l_2 then
          
          return l_1 < l_2;
          
      else
          
          i := PositionProperty( Reversed( [ 1 .. l_1 ] ), j -> m_1[j] <> m_2[j] );
          
          return i <> fail and m_1[l_1 - i + 1] > m_2[l_1 - i + 1];
          
      fi;
      
    fi;
    
    # total lexicographic order
    if admissible_order = "t-lex" then
      
      for j in [ 1 .. NumberOfMorphisms( UnderlyingQuiver( C ) ) ] do
          
          p_1 := Length( Positions( m_1, j ) );
          p_2 := Length( Positions( m_2, j ) );
          
          if p_1 <> p_2 then
              return p_1 < p_2;
          fi;
          
      od;
      
      i := PositionProperty( [ 1 .. l_1 ], j -> m_1[j] <> m_2[j] );
      
      return i <> fail and m_1[i] > m_2[i];
      
    fi;
    
    Error ( "the passed admissible_order is unknown, it should be 'Dp', 'dp' or 't-lex'!\n" );
    
end );

##
InstallOtherMethod( IsAscendingForMorphisms,
          [ IsPathCategory, IsPathCategoryMorphism, IsPathCategoryMorphism ],
  
  function ( C, mor_1, mor_2 )
    
    return IsAscendingForMorphisms( C, mor_1, mor_2, C!.admissible_order );
    
end );

##
InstallOtherMethod( IsAscendingForMorphisms,
          [ IsPathCategoryMorphism, IsPathCategoryMorphism ],
  
  function ( mor_1, mor_2 )
    
    return IsAscendingForMorphisms( CapCategory( mor_1 ), mor_1, mor_2 );
    
end );

## Check whether mor_1 > mor_2

##
InstallMethod( IsDescendingForMorphisms,
          [ IsPathCategory, IsPathCategoryMorphism, IsPathCategoryMorphism, IsString ],
  
  function ( C, mor_1, mor_2, admissible_order )
    
    return IsAscendingForMorphisms( C, mor_2, mor_1, admissible_order );
    
end );

##
InstallOtherMethod( IsDescendingForMorphisms,
          [ IsPathCategory, IsPathCategoryMorphism, IsPathCategoryMorphism ],
  
  function ( C, mor_1, mor_2 )
    
    return IsAscendingForMorphisms( C, mor_2, mor_1 );
    
end );

##
InstallOtherMethod( IsDescendingForMorphisms,
          [ IsPathCategoryMorphism, IsPathCategoryMorphism ],
  
  function ( mor_1, mor_2 )
    
    return IsAscendingForMorphisms( mor_2, mor_1 );
    
end );

#######################################################
#
# Hom-Structure in Path Categories and their Quotients
#
#######################################################

##
InstallOtherMethod( IsFinitePathCategory,
          [ IsPathCategory ],
  
  function ( C )
    
    return HasFiniteNumberOfMacaulayMorphisms( C, [ ] );
    
end );

##
InstallMethod( HasFiniteNumberOfMacaulayMorphisms,
          [ IsPathCategory, IsDenseList ],
  
  function ( C, monomials )
    local q, nr_objs, len, is_finite, current_mors, s, loop;
    
    q := UnderlyingQuiver( C );
    
    nr_objs := NumberOfObjects( q );
    
    monomials := List( monomials, m -> [ ObjectIndex( Source( m ) ), MorphismIndices( m ), ObjectIndex( Target( m ) ) ] );
    
    len := Maximum( Concatenation( [ 1 ], List( monomials, mono -> Length( mono[2] ) ) ) );
    
    repeat
      
      # Hypothesis: the category is finite & all loops of length 'len' are divisible by the set 'monomials'
      is_finite := true;
      
      current_mors := ExternalHomsWithGivenLengthData( C, len );
      
      for s in [ 1 .. nr_objs ] do
        
        for loop in current_mors[s][s] do
          
          # if loop*loop is not divisible by any of the 'monomials', then our hypothesis "the category is finite" is wrong!
          if not ForAny( monomials, mono ->
                    ( IsEmpty( mono[2] ) and mono[1] in IndicesOfSources( q ){loop} ) or
                    ( not IsEmpty( mono[2] ) and PositionSublist( Concatenation( loop, loop ), mono[2] ) <> fail ) ) then
              
              is_finite := false;
              
          # elif loop is not divisible by 'monomials' then our hypothesis "all loops of length 'len' are divisible
          # by one of the elements of 'monomials'" is wrong!
          elif not ForAny( monomials, mono -> PositionSublist( loop, mono[2] ) <> fail ) then
              
              is_finite := fail;
              
          fi;
          
          # if the category is not finite then break the current for-loop
          if is_finite = false then break; fi;
          
        od;
        
        # if the category is not finite then break the current for-loop
        if is_finite = false then break; fi;
        
      od;
      
      len := len + 1;
      
    until is_finite = false or ( is_finite = true and len > 2 * nr_objs );
    
    return is_finite;
    
end );

##
InstallGlobalFunction( FpCategories_SORT_MORPHISMS_LIKE_QPA,
  
  function ( supports )
    local nr_objs, sort_function, s, t;
    
    nr_objs := Length( supports );
    
    sort_function :=
      function ( m_1, m_2 )
        local l_1, l_2, i;
        
        l_1 := Length( m_1 );
        l_2 := Length( m_2 );
        
        if l_1 <> l_2 then
          
          return l_1 < l_2;
          
        else
          
          i := PositionProperty( [ 1 .. l_1 ], j -> m_1[j] <> m_2[j] );
          
          return i <> fail and m_1[i] < m_2[i];
          
        fi;
        
    end;
    
    for s in [ 1 .. nr_objs ] do
      for t in [ 1 .. nr_objs ] do
        
        Sort( supports[s][t], sort_function );
        
      od;
    od;
    
end );

##
InstallMethod( MacaulayMorphisms,
          [ IsPathCategory, IsDenseList ],
  
  function ( C, monomials )
    local q, nr_objs, nr_mors, sources_mors, targets_mors, id_mons, non_id_mons, irr_objs, rel_objs, irr_mors, supports, len, homC_deg, hypothesis, homQ_len_st, homC_len_st, s, t, m;
    
    q := UnderlyingQuiver( C );
    
    nr_objs := NumberOfObjects( q );
    nr_mors := NumberOfMorphisms( q );
    
    sources_mors := IndicesOfSources( q );
    targets_mors := IndicesOfTargets( q );
    
    id_mons :=     Filtered( monomials, m -> MorphismLength( m ) = 0 );
    non_id_mons := Filtered( monomials, m -> MorphismLength( m ) > 0 );
   
    # relevant and irrelevant objects
    irr_objs := List( id_mons, m -> ObjectIndex( Source( m ) ) );
    rel_objs := Difference( [ 1 .. nr_objs ], irr_objs );
    
    irr_mors := PositionsProperty( [ 1 .. nr_mors ], i -> sources_mors[i] in irr_objs or targets_mors[i] in irr_objs );
    
    non_id_mons := List( non_id_mons, MorphismIndices );
    
    supports := List( [ 1 .. nr_objs ], s -> List( [ 1 .. nr_objs ], t -> [ ] ) );
    
    len := 0;
    
    repeat
        
        homC_deg := ExternalHomsWithGivenLengthData( C, len );
        
        # Hypothesis: all morphisms of length 'len' are multiples of 'monomials'
        hypothesis := true;
        
        for s in rel_objs do
          for t in rel_objs do
            
            homQ_len_st := [ ];
            
            homC_len_st := Filtered( homC_deg[s][t], mor -> not ForAny( irr_mors, i -> i in mor ) );
            
            for m in homC_len_st do
                
                if ForAll( non_id_mons, datum -> PositionSublist( m, datum ) = fail ) then
                    
                    Add( homQ_len_st, m );
                    
                    hypothesis := false;
                    
                fi;
                
            od;
            
            supports[s][t] := Concatenation( homQ_len_st, supports[s][t] );
            
          od;
        od;
        
        len := len + 1;
        
    until hypothesis;
    
    if C!.admissible_order = "dp" then
        
        FpCategories_SORT_MORPHISMS_LIKE_QPA( supports );
        
    fi;
    
    return LazyHList( [ 1 .. nr_objs ], s ->
                   LazyHList( [ 1 .. nr_objs ], t ->
                           List( supports[s][t], supp ->
                                 MorphismConstructor( C,
                                         SetOfObjects( C )[s],
                                         Pair( Length( supp ), supp ),
                                         SetOfObjects( C )[t] ) ) ) );
    
end );

##
InstallOtherMethod( MacaulayMorphisms,
          [ IsPathCategory ],
  
  function ( C )
    
    return MacaulayMorphisms( C, [ ] );
    
end );

##
InstallOtherMethod( ExternalHoms,
          [ IsPathCategory ],
  
  function ( C )
    
    return MacaulayMorphisms( C );
    
end );

##
InstallMethod( DatumOfCellAsEvaluatableString,
        [ IsPathCategoryMorphism, IsList ],
        
  function( mor, list_of_evaluatable_strings )
    local datum;
    
    datum := MorphismDatum( mor );
    
    return Concatenation( "Pair( ", String( datum[1] ), ", ", String( datum[2] ), " )" );
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToFpCategoryData,
        "for a path category, a pair of functions, and a category",
        [ IsPathCategory, IsList, IsCapCategory ],
        
  function( PQ, pair_of_funcs, category )
    local Q, functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    Q := UnderlyingQuiver( PQ );
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for categories
    
    extended_functor_on_objects :=
      function( objPQ )
        local objQ;
        
        objQ := ObjectDatum( PQ, objPQ );
        
        return functor_on_objects( objQ );
        
    end;
    
    extended_functor_on_morphisms :=
      function( source, morPQ, target )
        local s, t, morsQ;
        
        s := ObjectDatum( PQ, Source( morPQ ) );
        t := ObjectDatum( PQ, Range( morPQ ) );
        
        morsQ := MorphismDatum( PQ, morPQ )[2];
        
        return PreComposeList( category,
                       source,
                       List( morsQ, morQ -> functor_on_morphisms( morQ ) ),
                       target );
        
    end;
    
    return Triple( PQ,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   category );
    
end );

##
InstallMethod( DecompositionIndicesOfAllMorphismsFromHomStructure,
        "for a path category",
        [ IsPathCategory and IsFinite ],
        
  function( C )
    local objs;
    
    objs := SetOfObjects( C );
    
    return List( objs, t ->
                 List( objs, s ->
                       List( MorphismsOfExternalHom( C, s, t ), mor -> List( MorphismIndices( mor ), i -> -1 + i ) ) ) );
    
end );

##
InstallMethod( RelationsAmongGeneratingMorphisms,
        "for a path category",
        [ IsPathCategory ],
        
  function( C )
    
    return [ ];
    
end );

##
InstallMethod( CategoryFromNerveData,
        "for a path category",
        [ IsPathCategory and IsFinite ],
        
  function( C )
    
    return CategoryFromNerveData(
                   rec( name := Name( C ),
                        nerve_data := NerveTruncatedInDegree2Data( C ),
                        indices_of_generating_morphisms := IndicesOfGeneratingMorphismsFromHomStructure( C ),
                        decomposition_of_all_morphisms := DecompositionIndicesOfAllMorphismsFromHomStructure( C ),
                        relations := RelationsAmongGeneratingMorphisms( C ),
                        labels := [ List( SetOfObjects( C ), ObjectLabel ), List( SetOfGeneratingMorphisms( C ), MorphismLabel ) ],
                        properties := ListKnownCategoricalProperties( C ) ) );
    
end );

##
InstallMethod( DataTablesOfCategory,
        "for a path category",
        [ IsPathCategory ],
        
  function( C )
    
    return DataTablesOfCategory( CategoryFromNerveData( C : FinalizeCategory := true ) );
    
end );

##
InstallGlobalFunction( CAP_INTERNAL_EXTRACT_STRING_OF_PATH,
  function ( q, path )
    local str;
    
    str := ViewString( path );
    
    return str{[ 1 .. PositionSublist( str, ":" ) - Length( q!.colors.other ) - 1 ]};
    
end );

###################
#
# View Methods
#
###################

##
InstallMethod( ViewString,
          [ IsPathCategoryObject ],
  
  function ( obj )
    
    return ViewString( UnderlyingQuiverObject( obj ) );
    
end );

##
InstallMethod( String,
          [ IsPathCategoryObject ],
  
  ViewString );

##
InstallMethod( DisplayString,
          [ IsPathCategoryObject ],
  
  function ( o )
    
    return Concatenation( ViewString( o ), "\n" );
    
end );

##
InstallMethod( ViewString,
          [ IsPathCategoryMorphism ],
  
  function ( alpha )
    local colors;
    
    colors := UnderlyingQuiver( CapCategory( alpha ) )!.colors;
    
    return
      Concatenation(
          colors.mor,
          MorphismLabel( alpha ),
          colors.reset,
          colors.other,
          ":",
          ViewString( Source( alpha ) ),
          colors.other,
          " -≻ ",
          ViewString( Target( alpha ) ) );

end );

##
InstallMethod( String,
          [ IsPathCategoryMorphism ],
  
  ViewString );

##
InstallMethod( DisplayString,
          [ IsPathCategoryMorphism ],
  
  function ( m )
    
    return Concatenation( ViewString( m ), "\n" );
    
end );
