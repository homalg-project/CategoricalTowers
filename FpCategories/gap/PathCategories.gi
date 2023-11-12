# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
InstallMethod( PathCategory,
          [ IsCapQuiver ],
  
  function ( q )
    local admissible_order, name, C;
    
    admissible_order := ValueOption( "admissible_order" );
    
    if admissible_order = fail then
        
        admissible_order := "Dp";
        
    elif not admissible_order in [ "Dp", "dp" ] then
        
        Error( "only \"Dp\" and \"dp\" admissible orders are supported!\n" );
        
    fi;
    
    name := Concatenation( "PathCategory( ", Name( q ), " )" );
    
    C := CreateCapCategoryWithDataTypes( name,
                 IsPathCategory,
                 IsPathCategoryObject,
                 IsPathCategoryMorphism,
                 IsCapCategoryTwoCell,
                 CapJitDataTypeOfObjectOfCategory( q ),
                 CapJitDataTypeOfNTupleOf( 2,
                         IsBigInt,
                         CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( q ) ) ),
                 fail
                 : overhead := false );
    
    C!.category_as_first_argument := true;
    
    C!.admissible_order := admissible_order;
    
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
      function ( C, q_obj )
        
        return SetOfObjects( C )[ObjectIndex( q_obj )];
        
    end );
    
    ##
    AddObjectDatum( C,
      
      function ( C, obj )
        
        return SetOfObjects( UnderlyingQuiver( C ) )[ObjectIndex( obj )];
        
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
      
      function ( C, obj_1, datum, obj_2 )
        
        return CreateCapCategoryMorphismWithAttributes( C,
                             obj_1, obj_2,
                             MorphismLength, datum[1],
                             MorphismSupport, datum[2] );
        
    end );
     
    ##
    AddMorphismDatum( C,
      
      function ( C, mor )
        
        return Pair( MorphismLength( mor ), MorphismSupport( mor ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( C,
      
      function ( C, mor )
        local q, l, s;
        
        q := UnderlyingQuiver( C );
        
        l := MorphismLength( mor );
        s := MorphismSupport( mor );
        
        return
          l = Length( s )
          and ( ( l = 0 and IsEndomorphism( C, mor ) ) or
                ( IsEqualForObjects( q, ObjectDatum( Source( mor ) ), Source( First( s ) ) ) and
                  IsEqualForObjects( q, ObjectDatum( Target( mor ) ), Target( Last ( s ) ) ) ) )
          and ForAll( [ 1 .. l - 1 ], j -> IsEqualForObjects( q, Target( s[j] ), Source( s[j+1] ) ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( C,
      
      function ( C, mor_1, mor_2 )
        
        return IsEqualForObjects( C, Source( mor_1 ), Source( mor_2 ) )
                and IsEqualForObjects( C, Target( mor_1 ), Target( mor_2 ) )
                and MorphismLength( mor_1 ) = MorphismLength( mor_2 )
                and MorphismSupport( mor_1 ) = MorphismSupport( mor_2 );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( C,
      
      function ( C, mor_1, mor_2 )
        
        return IsEqualForMorphisms( C, mor_1, mor_2 );
        
    end );
    
    AddIdentityMorphism( C,
      
      function ( C, obj )
        
        return MorphismConstructor( C, obj, Pair( 0, [ ] ), obj );
        
    end );
    
    AddPreCompose( C,
      
      function ( C, mor_1, mor_2 )
        
        return MorphismConstructor( C,
                      Source( mor_1 ),
                      Pair( MorphismLength( mor_1 ) + MorphismLength( mor_2 ),
                            Concatenation( MorphismSupport( mor_1 ), MorphismSupport( mor_2 ) ) ),
                      Target( mor_2 ) );
        
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
        
        SetIsEquippedWithHomomorphismStructure( C, true );
        
        SetRangeCategoryOfHomomorphismStructure( C, SkeletalFinSets );
        
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
    
    return List( [ 1 .. NumberOfObjects( q ) ],
              s -> List( [ 1 .. NumberOfObjects( q ) ],
                t -> List( supports[s][t],
                  supp -> MorphismConstructor( C,
                              SetOfObjects( C )[s],
                              len, supp,
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
InstallMethod( SetOfObjects,
          [ IsPathCategory ],
  
  function ( C )
    
    return List( SetOfObjects( UnderlyingQuiver( C ) ),
              obj -> CreateCapCategoryObjectWithAttributes( C, ObjectIndex, ObjectIndex( obj ) ) );
    
end );

##
InstallMethod( SetOfGeneratingMorphisms,
          [ IsPathCategory ],
  
  function ( C )
    
    return List( SetOfMorphisms( UnderlyingQuiver( C ) ),
              mor -> MorphismConstructor( C,
                        SetOfObjects( C )[ObjectIndex( Source( mor ) )],
                        Pair( 1, [ mor ] ),
                        SetOfObjects( C )[ObjectIndex( Target( mor ) )] ) );
    
end );

##
InstallMethod( LaTeXOutput,
          [ IsPathCategoryObject ],
  
  function ( obj )
    
    return LaTeXOutput( ObjectDatum( obj ) );
    
end );

##
InstallMethod( ObjectLabel,
          [ IsPathCategoryObject ],
  
  function ( obj )
    
    return ObjectLabel( ObjectDatum( obj ) );
    
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
                    
                  end ), "•" );
      
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
InstallMethod( MorphismIndices,
          [ IsPathCategoryMorphism ],
  
  function ( alpha )
    
    return List( MorphismSupport( alpha ), MorphismIndex );
    
end );

##
InstallOtherMethod( MorphismConstructor,
          [ IsPathCategory, IsPathCategoryObject, IsInt, IsDenseList, IsPathCategoryObject ],
  
  function ( C, source, length, indices, target )
    
    return CreateCapCategoryMorphismWithAttributes( C,
                source, target,
                MorphismLength, length,
                MorphismIndices, indices );
    
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
        [ IsCapQuiverMorphism, IsPathCategory ],
  
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
    
    if ForAny( [ "•", "*" ], s -> PositionSublist( name, s ) <> fail ) then
      
      labels := SplitString( ReplacedString( name, "•", "*" ), "*" );
      
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
    
    Error( "the label '", name, "' can't be recognized! please try 'f*g' (or 'f•g') instead of 'fg'; and 'f*f' (or 'f•f') instead of 'f^2'\n" );
    
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

###################
#
# View Methods
#
###################

##
InstallMethod( ViewString,
          [ IsPathCategoryObject ],
  
  function ( obj )
    
    return ViewString( ObjectDatum( obj ) );
    
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
InstallMethod( DisplayString,
          [ IsPathCategoryObject ],
  
  function ( o )
    
    return Concatenation( ViewString( o ), "\n" );
    
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
    
    return HasFiniteNumberOfNonMultiples( C, [ ] );
    
end );

##
InstallMethod( HasFiniteNumberOfNonMultiples,
          [ IsPathCategory, IsDenseList ],
  
  function ( C, monomials )
    local q, nr_objs, is_loop, loops, loops_datum, len, is_finite, mors_datum, s, mor;
    
    q := UnderlyingQuiver( C );
    
    nr_objs := NumberOfObjects( q );
    
    is_loop := { i, m } -> ObjectIndex( Source( m ) ) = i and i = ObjectIndex( Target( m ) );
    
    loops := List( [ 1 .. nr_objs ], i -> Filtered( monomials, m -> is_loop( i, m ) ) );
    
    loops_datum := List( loops, loops_i -> List( loops_i, MorphismIndices ) );
    
    len :=  Maximum( Concatenation( [ 1 ], List( Concatenation( loops ), MorphismLength ) ) );
    
    repeat
      
      # Hypothesis: the category is finite & all loops of length 'len' are divisible by the set 'monomials'
      is_finite := true;
      
      mors_datum := ExternalHomsWithGivenLengthData( C, len );
      
      for s in [ 1 .. nr_objs ] do
        
        for mor in mors_datum[s][s] do
          
          # if mor*mor is not divisible by 'monomials', then our hypothesis "the category is finite" is wrong!
          if not ForAny( loops_datum[s], loop_datum -> PositionSublist( Concatenation( mor, mor ), loop_datum ) <> fail ) then
              
              is_finite := false;
              
          # elif mor is not divisible by 'monomials' then our hypothesis "all loops of length 'len' are divisible
          # by any of the elements of 'monomials'" is wrong!
          elif not ForAny( loops_datum[s], loop_datum -> PositionSublist( mor, loop_datum ) <> fail ) then
              
              is_finite := fail;
              
          fi;
          
          # if the category is not finite then break the current for-loop
          if is_finite = false then break; fi;
          
        od;
        
        # if the category is not finite then break the current for-loop
        if is_finite = false then break; fi;
        
      od;
      
      len := len + 1;
      
    until is_finite <> fail;
    
    return is_finite;
    
end );

##
InstallOtherMethod( ExternalHoms,
          [ IsPathCategory ],
  
  function ( C )
    
    return ExternalHoms( C, [ ] );
    
end );

##
InstallOtherMethod( ExternalHoms,
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
    
    return LazyHList( [ 1 .. nr_objs ],
              s -> LazyHList( [ 1 .. nr_objs ],
                t -> List( supports[s][t],
                  supp -> MorphismConstructor( C,
                                SetOfObjects( C )[s],
                                Length( supp ), supp,
                                SetOfObjects( C )[t] ) ) ) );
    
end );

