# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( OpenSubsetOfProj,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZF;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZF := ZariskiFrameOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZF,
            PreMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProj,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfProj( AsMorphismInCategoryOfRows( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByReducedMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiFrameOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ReducedMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProjByReducedMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfProjByReducedMorphism( AsMorphismInCategoryOfRows( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByListOfMorphismsOfRank1Range,
        "for a list",
        [ IsList ],

  function( L )
    local R, A, ZF;
    
    R := UnderlyingRing( CapCategory( L[1] ) );
    
    A := rec( );
    
    ZF := ZariskiFrameOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZF,
            ListOfMorphismsOfRank1RangeOfUnderlyingCategory, L,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProjByStandardMorphism,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],

  function( I )
    local R, A, ZC;
    
    R := UnderlyingRing( CapCategory( I ) );
    
    A := rec( );
    
    ZC := ZariskiFrameOfProjUsingCategoryOfRows( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            StandardMorphismOfUnderlyingCategory, I,
            UnderlyingRing, R,
            IsOpen, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProjByStandardMorphism,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( mat )
    
    return OpenSubsetOfProjByStandardMorphism( AsMorphismInCategoryOfRows( mat ) );
    
end );

##
InstallMethod( OpenSubsetOfProj,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfProj( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByReducedMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfProjByReducedMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByStandardMorphism,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return OpenSubsetOfProjByStandardMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiFrameOfProjUsingCategoryOfRows,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiFrame;
    
    name := "The frame of Zariski open subsets of the Proj of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiFrame := CreateCapCategory( name );
    
    ZariskiFrame!.category_as_first_argument := true;
    
    SetUnderlyingRing( ZariskiFrame, R );
    
    if not IsBound( R!.CategoryOfRows ) then
        R!.CategoryOfRows := CategoryOfRows( R : overhead := false );
    fi;
    
    ZariskiFrame!.UnderlyingCategory := R!.CategoryOfRows;
    
    ZariskiFrame!.Constructor := OpenSubsetOfProj;
    ZariskiFrame!.ConstructorByListOfMorphismsOfRank1Range := OpenSubsetOfProjByListOfMorphismsOfRank1Range;
    ZariskiFrame!.ConstructorByReducedMorphism := OpenSubsetOfProjByReducedMorphism;
    ZariskiFrame!.ConstructorByStandardMorphism := OpenSubsetOfProjByStandardMorphism;
    
    AddObjectRepresentation( ZariskiFrame, IsObjectInZariskiFrameOfAProjectiveVariety );
    
    AddMorphismRepresentation( ZariskiFrame, IsMorphismInZariskiFrameOfAProjectiveVariety );
    
    ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS( ZariskiFrame );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows( ZariskiFrame );
    
    ##
    AddIsHomSetInhabited( ZariskiFrame,
      { cat, S, T } -> IsHomSetInhabitedForFramesUsingCategoryOfRows( S, T ) );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiFrame,
          function( cat, S, T )
            
            S := UnderlyingMatrix( MorphismOfUnderlyingCategory( S ) );
            T := UnderlyingMatrix( MorphismOfUnderlyingCategory( T ) );
            
            return HilbertPoincareSeries( S ) = HilbertPoincareSeries( T );
            
        end );
        
    fi;
    
    ##
    AddIsEqualForObjects( ZariskiFrame,
      function( cat, A, B )
        
        if not DimensionOfComplement( A ) = DimensionOfComplement( B ) then
            return false;
        fi;
        
        return IsHomSetInhabited( A, B ) and IsEqualForObjectsIfIsHomSetInhabited( A, B );
        
    end );
    
    ##
    AddTerminalObject( ZariskiFrame,
      function( cat )
        local T;
        
        T := OpenSubsetOfProjByStandardMorphism( HomalgIdentityMatrix( 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiFrame,
      function( cat )
        local I;
        
        I := OpenSubsetOfProjByStandardMorphism( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddIsTerminal( ZariskiFrame,
      function( cat, A )
        local mor;
        
        mor := ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory( A );
        
        return ForAll( mor, IsSplitEpimorphism );
        
    end );
    
    ##
    AddIsInitial( ZariskiFrame,
      function( cat, A )
        
        return IsZero( MorphismOfRank1RangeOfUnderlyingCategory( A ) );
        
    end );
    
    ##
    AddCoproduct( ZariskiFrame,
      function( cat, L )
        local l;
        
        ## triggers radical computations which we want to avoid by all means
        #L := MaximalObjects( L, IsHomSetInhabited );
        ## instead:
        
        l := L[1];
        
        ## testing the membership of 1 might be very expensive for some ideals in the sum
        if ForAny( L, a -> HasIsTerminal( a ) and IsTerminal( a ) ) then
            return TerminalObject( CapCategory( l ) );
        fi;
        
        L := Filtered( L, A -> not IsInitial( A ) );
        
        if L = [ ] then
            return InitialObject( CapCategory( l ) );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, MorphismOfRank1RangeOfUnderlyingCategory );
        
        L := DuplicateFreeList( L );
        
        ## examples show that the GB computations of the entries of L
        ## (needed to check IsLiftable) might be immensely more expensive
        ## than the GB of the resulting UniversalMorphismFromDirectSum( L ),
        ## so never execute the next line:
        #L := MaximalObjects( L, IsLiftable );
        
        l := UniversalMorphismFromDirectSum( L );
        
        l := OpenSubsetOfProj( l );
        
        SetIsInitial( l, false );
        
        return l;
        
    end );
    
    ##
    AddDirectProduct( ZariskiFrame,
      function( cat, L )
        local l;
        
        l := L[1];
        
        if ForAny( L, IsInitial ) then
            return InitialObject( CapCategory( l ) );
        fi;
        
        L := Filtered( L, A -> not IsTerminal( A ) );
        
        if L = [ ] then
            return TerminalObject( CapCategory( l ) );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, ListOfMorphismsOfRank1RangeOfUnderlyingCategory );
        
        L := Concatenation( L );
        
        l := OpenSubsetOfProjByListOfMorphismsOfRank1Range( L );
        
        SetIsTerminal( l, false );
        
        return l;
        
    end );
    
    ##
    AddExponentialOnObjects( ZariskiFrame,
      function( cat, A, B )
        local L;
        
        A := MorphismOfUnderlyingCategory( A );
        
        if IsZero( A ) then
            return TerminalObject( CapCategory( B ) );
        fi;
        
        B := MorphismOfUnderlyingCategory( B );
        
        A := UnderlyingMatrix( A );
        B := UnderlyingMatrix( B );
        
        L := List( [ 1 .. NrRows( A ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( A, [ r ] ), B ) );
        
        L := List( L, OpenSubsetOfProjByReducedMorphism );
        
        return DirectProduct( L );
        
    end );
    
    Finalize( ZariskiFrame );
    
    ZariskiFrame!.ZariskiCoframe := ZariskiCoframeOfProjUsingCategoryOfRows( R );
    
    return ZariskiFrame;
    
end );

##
InstallMethod( IsClosedSubobject,
        "for an object in a Zariski frame of a projective variety",
        [ IsObjectInZariskiFrameOfAProjectiveVariety ],

  function( A )
    
    return IsOpen( -A );
    
end );

##
InstallMethod( DimensionOfComplement,
        "for an object in a Zariski frame of a projective variety",
        [ IsObjectInZariskiFrameOfAProjectiveVariety ],
        
  function( A )
    local dim;
    
    A := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    A := List( A, UnderlyingMatrix );
    
    dim := Maximum( List( A, AffineDimension ) );
    
    if dim < 0 then
        return dim;
    fi;
    
    return dim - 1;
    
end );

##
InstallMethod( DegreeOfComplement,
        "for an object in a Zariski frame of a projective variety",
        [ IsObjectInZariskiFrameOfAProjectiveVariety ],
        
  function( A )
    
    return ProjectiveDegree( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) );
    
end );
