# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( ClosedSubsetOfProj,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( I )
    local R, A, ZC;
    
    R := HomalgRing( I );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfProj( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            PreUnderlyingMatrix, I,
            UnderlyingRing, R,
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfProjByReducedColumn,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( I )
    local R, A, ZC;
    
    R := HomalgRing( I );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfProj( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ReducedUnderlyingColumn, I,
            UnderlyingRing, R,
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfProjByListOfColumns,
        "for a list",
        [ IsList ],

  function( L )
    local R, A, ZC;
    
    R := HomalgRing( L[1] );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfProj( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            ListOfUnderlyingColumns, L,
            UnderlyingRing, R,
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfProjByStandardColumn,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( I )
    local R, A, ZC;
    
    R := HomalgMatrix( I );
    
    A := rec( );
    
    ZC := ZariskiCoframeOfProj( R );
    
    ObjectifyObjectForCAPWithAttributes( A, ZC,
            StandardUnderlyingColumn, I,
            UnderlyingRing, R,
            IsClosedSubobject, true
            );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( ClosedSubsetOfProj,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfProj( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ClosedSubsetOfProjByReducedColumn,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfProjByReducedColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ClosedSubsetOfProjByStandardColumn,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],

  function( str, R )
    
    return ClosedSubsetOfProjByStandardColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiCoframeOfProj,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiCoframe;
    
    name := "The coframe of Zariski closed subsets of the Proj of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiCoframe := CreateCapCategory( name );
    
    ZariskiCoframe!.category_as_first_argument := true;
    
    ZariskiCoframe!.Constructor := ClosedSubsetOfProj;
    ZariskiCoframe!.ConstructorByListOfColumns := ClosedSubsetOfProjByListOfColumns;
    ZariskiCoframe!.ConstructorByReducedColumn := ClosedSubsetOfProjByReducedColumn;
    ZariskiCoframe!.ConstructorByStandardColumn := ClosedSubsetOfProjByStandardColumn;
    
    SetUnderlyingRing( ZariskiCoframe, R );
    
    AddObjectRepresentation( ZariskiCoframe, IsObjectInZariskiCoframeOfAProjectiveVariety );
    
    AddMorphismRepresentation( ZariskiCoframe, IsMorphismInZariskiCoframeOfAProjectiveVariety );
    
    ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS( ZariskiCoframe );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES( ZariskiCoframe );
    
    ##
    AddIsHomSetInhabited( ZariskiCoframe,
      { cat, S, T } -> IsHomSetInhabitedForCoframes( S, T ) );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiCoframe,
          function( cat, S, T )
            
            S := BestUnderlyingColumn( S );
            T := BestUnderlyingColumn( T );
            
            return HilbertPoincareSeries( S ) = HilbertPoincareSeries( T );
            
        end );
        
    fi;
    
    ##
    AddIsEqualForObjects( ZariskiCoframe,
      function( cat, A, B )
        
        if not Dimension( A ) = Dimension( B ) then
            return false;
        fi;
        
        return IsHomSetInhabited( A, B ) and IsEqualForObjectsIfIsHomSetInhabited( A, B );
        
    end );
    
    ##
    AddTerminalObject( ZariskiCoframe,
      function( cat )
        local T;
        
        T := ClosedSubsetOfProjByStandardColumn( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiCoframe,
      function( cat )
        local I;
        
        I := ClosedSubsetOfProjByStandardColumn( HomalgIdentityMatrix( 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddIsTerminal( ZariskiCoframe,
      function( cat, A )
        
        return IsZero( UnderlyingColumn( A ) );
        
    end );
    
    ##
    AddIsInitial( ZariskiCoframe,
      function( cat, A )
        local R, id, mats;
        
        R := UnderlyingRing( cat );
        
        id := HomalgIdentityMatrix( 1, R );
        
        mats := ListOfSaturatedUnderlyingColumns( A );
        
        return ForAll( mats, mat -> IsZero( DecideZeroRows( id, mat ) ) );
        
    end );
    
    ##
    AddCoproduct( ZariskiCoframe,
      function( cat, L )
        local l;
        
        l := L[1];
        
        if ForAny( L, IsTerminal ) then
            return TerminalObject( CapCategory( l ) );
        fi;
        
        L := Filtered( L, A -> not IsInitial( A ) );
        
        if L = [ ] then
            return InitialObject( CapCategory( l ) );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, ListOfUnderlyingColumns );
        
        L := Concatenation( L );
        
        l := ClosedSubsetOfProjByListOfColumns( L );
        
        SetIsInitial( l, false );
        
        return l;
        
    end );
    
    ##
    AddDirectProduct( ZariskiCoframe,
      function( cat, L )
        local l;
        
        ## triggers radical computations which we want to avoid by all means
        #L := MaximalObjects( L, IsSubset );
        ## instead:
        
        l := L[1];
        
        ## testing the membership of 1 might be very expensive for some ideals in the sum
        if ForAny( L, a -> HasIsInitial( a ) and IsInitial( a ) ) then
            return InitialObject( CapCategory( l ) );
        fi;
        
        L := Filtered( L, A -> not IsTerminal( A ) );
        
        if L = [ ] then
            return TerminalObject( CapCategory( l ) );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, UnderlyingColumn );
        
        L := DuplicateFreeList( L );
        
        ## examples show that the GB computations of the entries of L
        ## (needed to check IsZero @ DecideZeroRows) might be immensely more expensive
        ## than the GB of the resulting UnionOfRows( L ),
        ## so never execute the next line:
        #L := MaximalObjects( L, { a, b } -> IsZero( DecideZeroRows( a, b ) ) );
        
        l := UnionOfRows( L );
        
        l := ClosedSubsetOfProj( l );
        
        SetIsTerminal( l, false );
        
        return l;
        
    end );
    
    ## the closure of the set theortic difference
    AddCoexponentialOnObjects( ZariskiCoframe,
      function( cat, A, B )
        local L;
        
        B := BestUnderlyingColumn( B );
        
        if IsZero( B ) then
            return InitialObject( CapCategory( A ) );
        fi;
        
        A := BestUnderlyingColumn( A );
        
        L := List( [ 1 .. NrRows( B ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( B, [ r ] ), A ) );
        
        L := List( L, ClosedSubsetOfProjByReducedColumn );
        
        return Coproduct( L );
        
    end );
    
    Finalize( ZariskiCoframe );
    
    return ZariskiCoframe;
    
end );

##
InstallMethod( IsOpen,
        "for an object in a Zariski coframe of a projective variety",
        [ IsObjectInZariskiCoframeOfAProjectiveVariety ],

  function( A )
    
    return IsClosed( -A );
    
end );

##
InstallMethod( Dimension,
        "for an object in a Zariski coframe of a projective variety",
        [ IsObjectInZariskiCoframeOfAProjectiveVariety ],
        
  function( A )
    local dim;
    
    A := ListOfUnderlyingColumns( A );
    
    dim := Maximum( List( A, AffineDimension ) );
    
    if dim < 0 then
        return dim;
    fi;
    
    return dim - 1;
    
end );

##
InstallMethod( DegreeAttr,
        "for an object in a Zariski coframe of a projective variety",
        [ IsObjectInZariskiCoframeOfAProjectiveVariety ],

  function( A )
    
    return ProjectiveDegree( BestUnderlyingColumn( A ) );
    
end );
