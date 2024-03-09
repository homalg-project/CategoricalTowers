# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

SetInfoLevel( InfoLocales, 1 );

InstallTrueMethod( IsThinCategory, IsDiscreteCategory );

InstallTrueMethod( IsFiniteCategory, IsThinCategory and IsObjectFiniteCategory );

InstallTrueMethod( IsMonoidalProset, IsThinCategory and IsMonoidalCategory );
InstallTrueMethod( IsThinCategory, IsMonoidalProset );
InstallTrueMethod( IsMonoidalCategory, IsMonoidalProset );

InstallTrueMethod( IsClosedMonoidalProset, IsMonoidalProset and IsClosedMonoidalCategory );
InstallTrueMethod( IsMonoidalProset, IsClosedMonoidalProset );
InstallTrueMethod( IsClosedMonoidalCategory, IsClosedMonoidalProset );

InstallTrueMethod( IsCoclosedMonoidalProset, IsMonoidalProset and IsCoclosedMonoidalCategory );
InstallTrueMethod( IsMonoidalProset, IsCoclosedMonoidalProset );
InstallTrueMethod( IsCoclosedMonoidalCategory, IsCoclosedMonoidalProset );

InstallTrueMethod( IsSymmetricMonoidalProset, IsThinCategory and IsSymmetricMonoidalCategory );
InstallTrueMethod( IsThinCategory, IsSymmetricMonoidalProset );
InstallTrueMethod( IsSymmetricMonoidalCategory, IsSymmetricMonoidalProset );

InstallTrueMethod( IsSymmetricClosedMonoidalProset, IsSymmetricMonoidalProset and IsSymmetricClosedMonoidalCategory );
InstallTrueMethod( IsSymmetricMonoidalProset, IsSymmetricClosedMonoidalProset );
InstallTrueMethod( IsSymmetricClosedMonoidalCategory, IsSymmetricClosedMonoidalProset );

InstallTrueMethod( IsSymmetricCoclosedMonoidalProset, IsSymmetricMonoidalProset and IsSymmetricCoclosedMonoidalCategory );
InstallTrueMethod( IsSymmetricMonoidalProset, IsSymmetricCoclosedMonoidalProset );
InstallTrueMethod( IsSymmetricCoclosedMonoidalCategory, IsSymmetricCoclosedMonoidalProset );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_PREORDERED_SETS,
  function( preordered_set )
    
    ADD_COMMON_METHODS_FOR_ENRICHMENT_OVER_INTERVAL_CATEGORY( preordered_set );
    
end );

##
InstallOtherMethod( Size,
        "for finite prosets",
        [ IsCapCategory and IsThinCategory and IsFiniteCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( P )
    local H, objs;
    
    H := RangeCategoryOfHomomorphismStructure( P );
    
    if not IsIntervalCategory( H ) then
        TryNextMethod( );
    fi;
    
    objs := SetOfObjects( P );
    
    return Sum( objs, s ->
                Sum( objs, t ->
                     Length( HomomorphismStructureOnObjects( P, s, t ) ) ) );
    
end );

##
InstallOtherMethod( CapFunctor,
        "for a thin category, two lists, and the interval category",
        [ IsThinCategory and IsFiniteCategory, IsList, IsList, IsIntervalCategory ],
        
  function( P, imgs_of_objs, imgs_of_gmors, interval_category )
    local F;
    
    F := CapFunctor( Concatenation( "Functor from ", Name( P ), " -> ", Name( interval_category ) ), P, interval_category );
    
    AddObjectFunction( F,
      function ( obj )
        
        return imgs_of_objs[SafeUniquePositionProperty( SetOfObjects( P ), o -> IsEqualForObjects( P, o, obj ) )];
        
    end );
    
    AddMorphismFunction( F,
      function ( F_s, mor, F_t )
        
        return UniqueMorphism( interval_category,
                       F_s,
                       F_t );
        
    end );
    
    return F;
    
end );

##
InstallMethod( Display,
        "for an object in a proset",
        [ IsMorphismInThinCategory ],

  function( u )
    
    Display( Target( u ) );
    Print( " ^\n |\n |\n" );
    Display( Source( u ) );
    
end );
