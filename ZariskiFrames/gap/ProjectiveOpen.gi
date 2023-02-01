# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( OpenSubsetOfProj,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( I )
    local R, ZF, A;
    
    R := HomalgRing( I );
    
    ZF := ZariskiFrameOfProj( R );
    
    A := ObjectInZariskiFrameOrCoframe( ZF, I );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProjByRadicalColumn,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( I )
    local R, ZF, A;
    
    R := HomalgRing( I );
    
    ZF := ZariskiFrameOfProj( R );
    
    A := ObjectInZariskiFrameOrCoframeByRadicalColumn( ZF, I );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProjByListOfColumns,
        "for a list",
        [ IsList ],
        
  function( L )
    local R, ZF, A;
    
    R := HomalgRing( L[1] );
    
    ZF := ZariskiFrameOfProj( R );
    
    A := ObjectInZariskiFrameOrCoframeByListOfColumns( ZF, L );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProjByStandardColumn,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( I )
    local R, ZF, A;
    
    R := HomalgRing( I );
    
    ZF := ZariskiFrameOfProj( R );
    
    A := ObjectInZariskiFrameOrCoframeByStandardColumn( ZF, I );
    
    Assert( 4, IsWellDefined( A ) );
    
    return A;
    
end );

##
InstallMethod( OpenSubsetOfProj,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],
        
  function( str, R )
    
    return OpenSubsetOfProj( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByRadicalColumn,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],
        
  function( str, R )
    
    return OpenSubsetOfProjByRadicalColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( OpenSubsetOfProjByStandardColumn,
        "for a string and a homalg ring",
        [ IsString, IsHomalgRing ],
        
  function( str, R )
    
    return OpenSubsetOfProjByStandardColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallMethod( ZariskiFrameOfProj,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local name, ZariskiFrame;
    
    name := "The frame of Zariski open subsets of the Proj of ";
    
    name := Concatenation( name, RingName( R ) );
    
    ZariskiFrame := CreateCapCategory( name,
                            IsZariskiFrameOfAProjectiveVariety,
                            IsObjectInZariskiFrameOfAProjectiveVariety,
                            IsMorphismInZariskiFrameOfAProjectiveVariety,
                            IsCapCategoryTwoCell );
    
    ZariskiFrame!.category_as_first_argument := true;
    
    SetIsHeytingAlgebra( ZariskiFrame, true );
    
    ZariskiFrame!.Constructor := OpenSubsetOfProj;
    ZariskiFrame!.ConstructorByListOfColumns := OpenSubsetOfProjByListOfColumns;
    ZariskiFrame!.ConstructorByRadicalColumn := OpenSubsetOfProjByRadicalColumn;
    ZariskiFrame!.ConstructorByStandardColumn := OpenSubsetOfProjByStandardColumn;
    
    SetUnderlyingRing( ZariskiFrame, R );
    
    ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES( ZariskiFrame );
    
    ##
    AddIsHomSetInhabited( ZariskiFrame,
      { cat, S, T } -> IsHomSetInhabitedForFrames( S, T ) );
    
    ##
    if IsBound( homalgTable( R )!.CoefficientsOfUnreducedNumeratorOfWeightedHilbertPoincareSeries ) then
        
        ##
        AddIsEqualForObjectsIfIsHomSetInhabited( ZariskiFrame,
          function( cat, S, T )
            
            S := BestUnderlyingColumn( S );
            T := BestUnderlyingColumn( T );
            
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
        
        T := OpenSubsetOfProjByStandardColumn( HomalgIdentityMatrix( 1, R ) );
        
        SetIsTerminal( T, true );
        
        return T;
        
    end );
    
    ##
    AddInitialObject( ZariskiFrame,
      function( cat )
        local I;
        
        I := OpenSubsetOfProjByStandardColumn( HomalgZeroMatrix( 0, 1, R ) );
        
        SetIsInitial( I, true );
        
        return I;
        
    end );
    
    ##
    AddIsTerminal( ZariskiFrame,
      function( cat, A )
        local R, id, mats;
        
        R := UnderlyingRing( cat );
        
        id := HomalgIdentityMatrix( 1, R );
        
        mats := UnderlyingListOfSaturatedColumns( A );
        
        return ForAll( mats, mat -> IsZero( DecideZeroRows( id, mat ) ) );
        
    end );
    
    ##
    AddIsInitial( ZariskiFrame,
      function( cat, A )
        
        return IsZero( UnderlyingColumn( A ) );
        
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
        
        L := List( L, UnderlyingColumn );
        
        L := DuplicateFreeList( L );
        
        ## examples show that the GB computations of the entries of L
        ## (needed to check IsZero @ DecideZeroRows) might be immensely more expensive
        ## than the GB of the resulting UnionOfRows( L ),
        ## so never execute the next line:
        #L := MaximalObjects( L, { a, b } -> IsZero( DecideZeroRows( a, b ) ) );
        
        l := UnionOfRows( L );
        
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
        
        L := List( L, UnderlyingListOfColumns );
        
        L := Concatenation( L );
        
        l := OpenSubsetOfProjByListOfColumns( L );
        
        SetIsTerminal( l, false );
        
        return l;
        
    end );
    
    ##
    AddExponentialOnObjects( ZariskiFrame,
      function( cat, A, B )
        local L;
        
        A := BestUnderlyingColumn( A );
        
        if IsZero( A ) then
            return TerminalObject( CapCategory( B ) );
        fi;
        
        B := BestUnderlyingColumn( B );
        
        L := List( [ 1 .. NrRows( A ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( A, [ r ] ), B ) );
        
        L := List( L, OpenSubsetOfProjByRadicalColumn );
        
        return DirectProduct( L );
        
    end );
    
    Finalize( ZariskiFrame );
    
    ZariskiFrame!.ZariskiCoframe := ZariskiCoframeOfProj( R );
    
    return ZariskiFrame;
    
end );

##
InstallOtherMethod( IsClosedSubobject,
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
    
    A := UnderlyingListOfColumns( A );
    
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
    
    return ProjectiveDegree( BestUnderlyingColumn( A ) );
    
end );
