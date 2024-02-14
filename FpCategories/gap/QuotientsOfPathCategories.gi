# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
InstallOtherMethod( QuotientCategory,
        [ IsPathCategory, IsDenseList ],
  
  function ( C, relations )
    local reduced_gb, congruence_function, name, quo_C, q, leading_monomials, hom_quo_C;
    
    reduced_gb := ReducedGroebnerBasis( C, relations );
    
    congruence_function :=
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
                     nr_arguments_of_congruence_function := 2,
                     congruence_function := congruence_function,
                     underlying_category := C ) : FinalizeCategory := false, overhead := false );
    
    ##
    AddSetOfGeneratingMorphismsOfCategory( quo_C,
      function( quo_C )
        local objects;

        objects := SetOfObjects( quo_C );
        
        return List( SetOfGeneratingMorphisms( UnderlyingCategory( quo_C ) ),
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
        
        SetIsEquippedWithHomomorphismStructure( quo_C, true );
        
        SetRangeCategoryOfHomomorphismStructure( quo_C, SkeletalFinSets );
        
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
    
    return ReductionOfMorphism( UnderlyingCategory( qC ), MorphismDatum( qC, mor ), GroebnerBasisOfDefiningRelations( qC ) );
    
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
    
    C := UnderlyingCategory( quo_C );
    
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
    
    colors := UnderlyingQuiver( UnderlyingCategory( CapCategory( mor ) ) )!.colors;
    
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
