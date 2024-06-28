# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
InstallGlobalFunction( "CreateIntervalCategory",
  function( )
    local IntervalCategory;
    
    IntervalCategory :=
      CreateCapCategoryWithDataTypes( "IntervalCategory",
              IsIntervalCategory,
              IsObjectInIntervalCategory,
              IsMorphismInIntervalCategory,
              IsCapCategoryTwoCell,
              IsBigInt,
              fail,
              fail );
    
    IntervalCategory!.supports_empty_limits := true;
    
    SetDefiningTripleOfUnderlyingQuiver( IntervalCategory,
            Triple( 2, 1, [ Pair( 0, 1 ) ] ) );

    IntervalCategory!.compiler_hints :=
      rec( category_attribute_names :=
           [ "DefiningTripleOfUnderlyingQuiver",
             ] );
    
    SetIsFiniteCategory( IntervalCategory, true );
    
    SetIsBooleanAlgebra( IntervalCategory, true );
    
    SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( IntervalCategory, IntervalCategory );
    
    SetIsCategoryWithDecidableLifts( IntervalCategory, true );
    SetIsCategoryWithDecidableColifts( IntervalCategory, true );
    
    ##
    AddObjectConstructor( IntervalCategory,
      function( cat, truth_value )
        
        return CreateCapCategoryObjectWithAttributes( cat,
                       Length, truth_value );
        
    end );
    
    ##
    AddObjectDatum( IntervalCategory,
      function( cat, obj )
        
        return Length( obj );
        
    end );
    
    ##
    AddMorphismConstructor( IntervalCategory,
      function( cat, source, map, range )
        
        return CreateCapCategoryMorphismWithAttributes( cat,
                       source,
                       range,
                       AsList, map );
        
    end );
    
    ##
    AddMorphismDatum( IntervalCategory,
      function( cat, mor )
        
        return AsList( mor );
        
    end );
    
    ##
    AddUniqueMorphism( IntervalCategory,
      function( cat, source, range )
        
        return MorphismConstructor( cat,
                       source,
                       [ 0 .. Length( source ) - 1 ],
                       range );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( IntervalCategory,
      function( cat, obj )
        
        return ObjectDatum( cat, obj ) = BigInt( 0 ) or ObjectDatum( cat, obj ) = BigInt( 1 );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( IntervalCategory,
      function( cat, mor )
        
        return not ( IsTerminal( cat, Source( mor ) ) and IsInitial( cat, Target( mor ) ) );
        
    end );
    
    ##
    AddIsEqualForObjects( IntervalCategory,
      function( cat, obj_1, obj_2 )
        
        return IsIdenticalObj( ObjectDatum( cat, obj_1 ), ObjectDatum( cat, obj_2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( IntervalCategory,
      function( cat, mor_1, mor_2 )
        
        return true;
        
    end );
    
    ##
    AddInitialObject( IntervalCategory,
      function( cat )
        
        return ObjectConstructor( cat, BigInt( 0 ) );
        
    end );
    
    ##
    AddIsInitial( IntervalCategory,
      function( cat, a )
        
        return IsEqualForObjects( cat, a, InitialObject( cat ) );
        
    end );
    
    ##
    AddTerminalObject( IntervalCategory,
      function( cat )
        
        return ObjectConstructor( cat, BigInt( 1 ) );
        
    end );
    
    ##
    AddIsTerminal( IntervalCategory,
      function( cat, a )
        
        return IsEqualForObjects( cat, a, TerminalObject( cat ) );
        
    end );
    
    ##
    AddSetOfObjectsOfCategory( IntervalCategory,
      function( cat )
        
        return [ InitialObject( cat ), TerminalObject( cat ) ];
        
    end );
    
    ##
    AddSetOfGeneratingMorphismsOfCategory( IntervalCategory,
      function( cat )
        
        return [ UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
                       InitialObject( cat ),
                       TerminalObject( cat ) ) ];
        
    end );
    
    ##
    AddCoproduct( IntervalCategory,
      function( cat, L )
        
        if ForAny( L, obj -> IsTerminal( cat, obj ) ) then
            return TerminalObject( cat );
        fi;
        
        return InitialObject( cat );
        
    end );
    
    ##
    AddCoexponentialOnObjects( IntervalCategory,
      function( cat, a, b )
        
        if IsTerminal( cat, a ) or IsInitial( cat, b ) then
            return TerminalObject( cat );
        fi;
        
        return InitialObject( cat );
        
    end );
    
    ##
    AddDirectProduct( IntervalCategory,
      function( cat, L )
        
        if ForAny( L, obj -> IsInitial( cat, obj ) ) then
            return InitialObject( cat );
        fi;
        
        return TerminalObject( cat );
        
    end );
    
    ##
    AddExponentialOnObjects( IntervalCategory,
      function( cat, a, b )
        
        if IsInitial( cat, a ) or IsTerminal( cat, b ) then
            return TerminalObject( cat );
        fi;
        
        return InitialObject( cat );
        
    end );
    
    ##
    AddMorphismsOfExternalHom( IntervalCategory,
      function( cat, a, b )
        
        if IsTerminal( cat, a ) and IsInitial( cat, b ) then
            return CapJitTypedExpression( [ ], cat -> CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( cat ) ) );;
        fi;
        
        return [ UniqueMorphism( cat, a, b ) ];
        
    end );
    
    ##
    AddExactCoverWithGlobalElements( IntervalCategory,
      function( cat, a )
        
        return MorphismsOfExternalHom( cat, TerminalObject( cat ), a );
        
    end );
    
    Finalize( IntervalCategory );
    
    return IntervalCategory;
    
end );

##
BindGlobal( "IntervalCategory", CreateIntervalCategory( ) );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for an interval category",
        [ IsIntervalCategory ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for an interval category",
        [ IsIntervalCategory ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_ENRICHMENT_OVER_INTERVAL_CATEGORY,
  function( preordered_set )
    local V;
    
    V := ValueOption( "range_of_HomStructure" );
    
    if V = fail then
        V := IntervalCategory;
    elif not IsIntervalCategory( V ) then
        Error( "the value `V` of the option key `range_of_HomStructure` is not an interval category\n" );
    fi;
    
    SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( preordered_set, V );
    
end );

##
AddDerivationToCAP( IsHomSetInhabited,
        "IsHomSetInhabited for categories enriched over the interval category",
        [ [ HomomorphismStructureOnObjects, 1 ],
          [ IsInitial, 1, RangeCategoryOfHomomorphismStructure ] ],
        
  function( cat, a, b )
    local range_cat;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    return not IsInitial( range_cat,
                   HomomorphismStructureOnObjects( cat, a, b ) );
    
end : CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
CategoryFilter := function( cat )
      return HasRangeCategoryOfHomomorphismStructure( cat ) and
             IsIntervalCategory( RangeCategoryOfHomomorphismStructure( cat ) );
  end );

##
AddFinalDerivationBundle( "adding the homomorphism structure using IsHomSetInhabited and IntervalCategory",
        [ [ TerminalObject, 1, RangeCategoryOfHomomorphismStructure ],
          [ IsHomSetInhabited, 1 ],
          [ InitialObject, 1, RangeCategoryOfHomomorphismStructure ],
          [ UniversalMorphismIntoTerminalObjectWithGivenTerminalObject, 1, RangeCategoryOfHomomorphismStructure ],
          [ UniqueMorphism, 1, RangeCategoryOfHomomorphismStructure ],
          [ UniqueMorphism, 1 ],
          ],
        [ DistinguishedObjectOfHomomorphismStructure,
          HomomorphismStructureOnObjects,
          HomomorphismStructureOnMorphisms,
          HomomorphismStructureOnMorphismsWithGivenObjects,
          InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure,
          InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects,
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
          ],
[
  DistinguishedObjectOfHomomorphismStructure,
  [ [ TerminalObject, 1, RangeCategoryOfHomomorphismStructure ] ],
  function ( cat )
    local range_cat;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    return TerminalObject( range_cat );
    
end
],
[
  HomomorphismStructureOnObjects,
  [ [ TerminalObject, 1, RangeCategoryOfHomomorphismStructure ],
    [ IsHomSetInhabited, 1 ],
    [ InitialObject, 1, RangeCategoryOfHomomorphismStructure ] ],
  function ( cat, a, b )
    local range_cat;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    if IsHomSetInhabited( cat, a, b ) then
        return TerminalObject( range_cat );
    else
        return InitialObject( range_cat );
    fi;
    
end
],
[
  HomomorphismStructureOnMorphismsWithGivenObjects,
  [ [ UniqueMorphism, 1, RangeCategoryOfHomomorphismStructure ] ],
  function ( cat, s, alpha, gamma, r )
    local range_cat;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    return UniqueMorphism( range_cat, s, r );
    
end
],
[
  InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects,
  [ [ UniversalMorphismIntoTerminalObjectWithGivenTerminalObject, 1, RangeCategoryOfHomomorphismStructure ] ],
  function( cat, t, alpha, r )
    local range_cat;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    return UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( range_cat, t, r );
    
end
],
[
  InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism,
  [ [ UniqueMorphism, 1 ] ],
  function( cat, a, b, iota )
    
    return UniqueMorphism( cat, a, b );
    
end
] : CategoryFilter := function( cat )
      return ( HasIsThinCategory and IsThinCategory )( cat ) and
             HasRangeCategoryOfHomomorphismStructure( cat ) and
             IsIntervalCategory( RangeCategoryOfHomomorphismStructure( cat ) );
    end,
    CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure )
);

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( PrintString,
        "for an object in an interval category",
        [ IsObjectInIntervalCategory ],
        
  function( obj )
    
    if ObjectDatum( obj ) = 0 then
        return "<(⊥)>";
    elif ObjectDatum( obj ) = 1 then
        return "<(⊤)>";
    else
        Error( "ObjectDatum( obj ) is not in [ 0, 1 ]\n" );
    fi;
    
end );

##
InstallMethod( ViewObj,
        "for an object in an interval category",
        [ IsObjectInIntervalCategory ],
        
  function( obj )
    
    Print( PrintString( obj ) );
    
end );

##
InstallMethod( Display,
        "for an object in an interval category",
        [ IsObjectInIntervalCategory ],
        
  function( obj )
    
    Print( PrintString( obj ), "\n" );
    
end );

##
InstallMethod( PrintString,
        "for a morphism in an interval category",
        [ IsMorphismInIntervalCategory ],
        
  function( mor )
    local obj;
    
    if IsEndomorphism( mor ) then
        obj := Source( mor );
        if ObjectDatum( obj ) = 0 then
            return "(⊥)-[(⊥)]->(⊥)";
        elif ObjectDatum( obj ) = 1 then
            return "(⊤)-[(⊤)]->(⊤)";
        else
            Error( "ObjectDatum( obj ) is not in [ 0, 1 ]\n" );
        fi;
    elif IsInitial( Source( mor ) ) and IsTerminal( Target( mor ) ) then
        return "(⊥)-[(⇒)]->(⊤)";
    else
        Error( "the morphism <mor> of the interval category is not well-defined\n" );
    fi;
    
end );

##
InstallMethod( ViewObj,
        "for a morphism in an interval category",
        [ IsMorphismInIntervalCategory ],
        
  function( mor )
    
    Print( PrintString( mor ) );
    
end );

##
InstallMethod( Display,
        "for a morphism in an interval category",
        [ IsMorphismInIntervalCategory ],
        
  function( mor )
    
    Print( PrintString( mor ), "\n" );
    
end );
