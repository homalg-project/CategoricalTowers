# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
InstallOtherMethod( QuotientCategory,
        [ IsPathCategory, IsDenseList ],
  
  function ( C, relations )
    local reduced_gb, congruence_func, name, quo_C, q, leading_monomials, hom_quo_C, range_of_HomStructure;
    
    reduced_gb := ReducedGroebnerBasis( C, relations );
    
    congruence_func :=
      { mor_1, mor_2 } -> IsEqualForMorphisms( C,
                              ReductionOfMorphism( C, mor_1, reduced_gb ),
                              ReductionOfMorphism( C, mor_2, reduced_gb ) );
    
    name := List( relations{[ 1 .. Minimum( 3, Length( relations ) ) ]},
              rel -> Concatenation( MorphismLabel( rel[1] ), " = ", MorphismLabel( rel[2] ) ) );
    
    if Length( relations ) > 3 then
          Add( name, "..." );
    fi;
    
    name := Concatenation( Name( C ), " / [ ", JoinStringsWithSeparator( name, ", " ), " ]" );
    
    quo_C := QuotientCategory(
                rec( name := name,
                     category_filter := IsQuotientOfPathCategory,
                     category_object_filter := IsQuotientOfPathCategoryObject,
                     category_morphism_filter := IsQuotientOfPathCategoryMorphism,
                     nr_arguments_of_congruence_func := 2,
                     congruence_func := congruence_func,
                     underlying_category := C ) : FinalizeCategory := false, overhead := false );
    
    SetIsFinitelyPresentedCategory( quo_C, true );
    
    ##
    AddSetOfGeneratingMorphismsOfCategory( quo_C,
      function( quo_C )
        local objects;

        objects := SetOfObjects( quo_C );
        
        return List( SetOfGeneratingMorphisms( AmbientCategory( quo_C ) ),
                     m -> MorphismConstructor( quo_C,
                             objects[ObjectIndex( Source( m ) )],
                             m,
                             objects[ObjectIndex( Target( m ) )] ) );
        
    end );
    
    q := UnderlyingQuiver( C );
    
    SetUnderlyingQuiver( quo_C, q );
    
    SetDefiningTripleOfUnderlyingQuiver( quo_C, DefiningTripleOfUnderlyingQuiver( C ) );
    
    SetDefiningRelations( quo_C, relations );
    
    SetGroebnerBasisOfDefiningRelations( quo_C, reduced_gb );
    
    leading_monomials := List( reduced_gb, g -> g[1] );
    
    if HasFiniteNumberOfMacaulayMorphisms( C, leading_monomials ) then
        
        SetIsFiniteCategory( quo_C, true );
        
        hom_quo_C := MacaulayMorphisms( C, leading_monomials );
        
        SetExternalHoms( quo_C,
              LazyHList( [ 1 .. NumberOfObjects( q ) ],
                s -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
                  t -> List( hom_quo_C[s][t],
                    m -> MorphismConstructor( quo_C,
                              SetOfObjects( quo_C )[s],
                              m,
                              SetOfObjects( quo_C )[t] ) ) ) ) );
        
        range_of_HomStructure := ValueOption( "range_of_HomStructure" );
        
        if not IsSkeletalCategoryOfFiniteSets( range_of_HomStructure ) then
            range_of_HomStructure := SkeletalFinSets;
        fi;
        
        SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( quo_C, range_of_HomStructure );
        
        Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( quo_C ), range_of_HomStructure ) );
        
        ##
        AddMorphismsOfExternalHom( quo_C,
          function ( quo_C, obj_1, obj_2 )
            local s, t;
            
            s := ObjectIndex( ObjectDatum( quo_C, obj_1 ) );
            t := ObjectIndex( ObjectDatum( quo_C, obj_2 ) );
            
            return ExternalHoms( quo_C )[s][t];
            
        end );
        
    fi;
    
    quo_C!.compiler_hints.category_attribute_names :=
      [ "UnderlyingQuiver",
        "DefiningTripleOfUnderlyingQuiver",
        ];
    
    Finalize( quo_C );
    
    return quo_C;
    
end );

##
InstallMethod( AssignSetOfObjects,
        [ IsQuotientOfPathCategory, IsString ],
  
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
        [ IsQuotientOfPathCategory ],
  
  function ( C )
    
    AssignSetOfObjects( C, "" );
    
end );

##
InstallMethod( AssignSetOfGeneratingMorphisms,
        [ IsQuotientOfPathCategory, IsString ],
  
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
        [ IsQuotientOfPathCategory ],
  
  function ( C )
    
    AssignSetOfGeneratingMorphisms( C, "" );
    
end );

##
InstallOtherMethod( \/,
        [ IsPathCategory, IsDenseList ],
  
  QuotientCategory
);

##
InstallMethod( CanonicalRepresentative,
        [ IsQuotientOfPathCategoryMorphism ],
  
  function ( mor )
    local qC;
    
    qC := CapCategory( mor );
    
    return ReductionOfMorphism( AmbientCategory( qC ), MorphismDatum( qC, mor ), GroebnerBasisOfDefiningRelations( qC ) );
    
end );

##
InstallMethod( ObjectIndex,
          [ IsQuotientOfPathCategoryObject ],
  
  function ( obj )
    
    return ObjectIndex( ObjectDatum( obj ) );
    
end );

InstallMethod( ExternalHomsWithGivenLengthOp,
        [ IsQuotientOfPathCategory, IsInt ],
        
  function ( quo_C, len )
    local C, mors;
    
    C := AmbientCategory( quo_C );
    
    mors := ExternalHomsWithGivenLength( C, len );
    
    return List( mors, row ->
                 List( row, morphisms ->
                       DuplicateFreeList(
                               List( morphisms, m ->
                                     MorphismConstructor( quo_C,
                                             SetOfObjects( quo_C )[ObjectIndex( Source( m ) )],
                                             m,
                                             SetOfObjects( quo_C )[ObjectIndex( Target( m ) )] ) ) ) ) );
    
end );

##
InstallMethod( OppositeQuotientOfPathCategory,
        "for a quotient of a path category",
        [ IsQuotientOfPathCategory ],
        
  function( quo_C )
    local C, C_op, relations_op, quo_C_op;
    
    C := AmbientCategory( quo_C );
    
    C_op := OppositePathCategory( C );
    
    relations_op :=  List( DefiningRelations( quo_C ), pair ->
                           Pair( MorphismConstructor( C_op,
                                   SetOfObjects( C_op )[ObjectIndex( Target( pair[1] ) )],
                                   Pair( MorphismLength( pair[1] ), Reversed( MorphismIndices( pair[1] ) ) ),
                                   SetOfObjects( C_op )[ObjectIndex( Source( pair[1] ) )] ),
                                 MorphismConstructor( C_op,
                                   SetOfObjects( C_op )[ObjectIndex( Target( pair[2] ) )],
                                   Pair( MorphismLength( pair[2] ), Reversed( MorphismIndices( pair[2] ) ) ),
                                   SetOfObjects( C_op )[ObjectIndex( Source( pair[2] ) )] ) ) );
    
    quo_C_op := QuotientCategory( C_op, relations_op );
    
    SetOppositeQuotientOfPathCategory( quo_C_op, quo_C );
    
    return quo_C_op;
    
end );

##
InstallOtherMethod( CapFunctor,
        "for a quotient of a path category, two lists, and a category",
        [ IsQuotientOfPathCategory, IsList, IsList, IsCapCategory ],
        
  function( C, imgs_of_objs, imgs_of_gmors, D )
    local F;
    
    F := CapFunctor( Concatenation( "Functor from ", Name( C ), " -> ", Name( D ) ), C, D );
    
    AddObjectFunction( F,
      function ( obj )
        
        return imgs_of_objs[ObjectIndex( ObjectDatum( obj ) )];
        
    end );
    
    AddMorphismFunction( F,
      function ( F_s, mor, F_t )
        
        return PreComposeList( D, F_s, imgs_of_gmors{MorphismIndices( MorphismDatum( mor ) )}, F_t );
        
    end );
    
    return F;
    
end );

##
InstallOtherMethod( CapFunctor,
        "for a quotient of a path category, two records, and a category",
        [ IsQuotientOfPathCategory, IsRecord, IsRecord, IsCapCategory ],
        
  function( C, imgs_of_objs, imgs_of_gmors, D )
    local F;
    
    F := CapFunctor( Concatenation( "Functor from ", Name( C ), " -> ", Name( D ) ), C, D );
    
    AddObjectFunction( F,
      function ( obj )
        
        return imgs_of_objs.(ObjectLabel( ObjectDatum( obj ) ));
        
    end );
    
    AddMorphismFunction( F,
      function ( F_s, mor, F_t )
        
        return PreComposeList( D,
                       F_s,
                       List( MorphismSupport( MorphismDatum( mor ) ), m ->
                             imgs_of_gmors.(MorphismLabel( m )) ),
                       F_t );
        
    end );
    
    return F;
    
end );

##
InstallOtherMethod( DecompositionIndicesOfMorphism,
        "for a quotient of a path category and a morphism therein",
        [ IsQuotientOfPathCategory, IsQuotientOfPathCategoryMorphism ],
        
  function( C, mor )
    
    return DecompositionIndicesOfMorphism( AmbientCategory( C ), MorphismDatum( C, mor ) );
    
end );

##
InstallMethod( DecompositionOfMorphismInCategory,
        "for a morphism in a quotient of a path category",
        [ IsQuotientOfPathCategoryMorphism ],
        
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
InstallMethod( DecompositionIndicesOfAllMorphismsFromHomStructure,
        "for a quotient of a path category",
        [ IsQuotientOfPathCategory and IsFinite ],
        
  function( C )
    local objs;
    
    objs := SetOfObjects( C );
    
    return List( objs, t ->
                 List( objs, s ->
                       List( MorphismsOfExternalHom( C, s, t ), mor -> List( MorphismIndices( CanonicalRepresentative( mor ) ), i -> -1 + i ) ) ) );
    
end );

##
InstallMethod( RelationsAmongGeneratingMorphisms,
        "for a quotient of a path category",
        [ IsQuotientOfPathCategory ],
        
  function( C )
    
    return List( DefiningRelations( C ), pair ->
                 Pair( List( MorphismIndices( pair[1] ), i -> -1 + i ),
                       List( MorphismIndices( pair[2] ), i -> -1 + i ) ) );
    
end );

##
InstallMethod( CategoryFromNerveData,
        "for a quotient of a path category",
        [ IsQuotientOfPathCategory and IsFinite ],
        
  function( C )
    
    return CategoryFromNerveData(
                   rec( name := Name( C ),
                        nerve_data := NerveTruncatedInDegree2Data( C ),
                        indices_of_generating_morphisms := IndicesOfGeneratingMorphismsFromHomStructure( C ),
                        decomposition_of_all_morphisms := DecompositionIndicesOfAllMorphismsFromHomStructure( C ),
                        relations := RelationsAmongGeneratingMorphisms( C ),
                        labels := [ List( SetOfObjects( C ), o -> ObjectLabel( UnderlyingCell( o ) ) ),
                                List( SetOfGeneratingMorphisms( C ), m -> MorphismLabel( CanonicalRepresentative( m ) ) ) ],
                        properties := ListKnownCategoricalProperties( C ) ) );
    
end );

##
InstallMethod( DataTablesOfCategory,
        "for a quotient of a path category",
        [ IsQuotientOfPathCategory ],
        
  function( C )
    
    return DataTablesOfCategory( CategoryFromNerveData( C : FinalizeCategory := true ) );
    
end );

###################
#
# View Methods
#
###################

##
InstallMethod( DisplayString,
          [ IsQuotientOfPathCategoryObject ],
  
  function ( obj )
    
    return Concatenation( ViewString( obj ), "\n" );
    
end );

##
InstallMethod( ViewString,
          [ IsQuotientOfPathCategoryObject ],
  
  function ( obj )
    
    return ViewString( UnderlyingCell( obj ) );
    
end );

##
InstallMethod( String,
          [ IsQuotientOfPathCategoryObject ],
  
  ViewString );

##
InstallMethod( DisplayString,
          [ IsQuotientOfPathCategoryMorphism ],
  
  function ( mor )
    
    return Concatenation( ViewString( mor ), "\n" );
    
end );

##
InstallMethod( ViewString,
          [ IsQuotientOfPathCategoryMorphism ],
  function ( mor )
    local colors, str;
    
    colors := UnderlyingQuiver( AmbientCategory( CapCategory( mor ) ) )!.colors;
    
    str := ViewString( CanonicalRepresentative( mor ) );
    
    str := Concatenation( "[", str );
    
    str := ReplacedString(
                  str,
                  Concatenation( colors!.other, ":" ),
                  Concatenation( colors.reset, "]", colors.other, ":") );
    
    return str;
    
end );

##
InstallMethod( String,
          [ IsQuotientOfPathCategoryMorphism ],
  
  ViewString );
