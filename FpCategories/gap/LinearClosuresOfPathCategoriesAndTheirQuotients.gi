# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

BindGlobal( "LINEAR_CLOSURE_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS",
  
  function ( k, C )
    local admissible_order, colors, sorting_func, kC;
    
    admissible_order := ValueOption( "admissible_order" );
    
    if admissible_order = fail then
        
        if IsPathCategory( C ) then
          admissible_order := C!.admissible_order;
        else
          admissible_order := UnderlyingCategory( C )!.admissible_order;
        fi;
        
    elif not admissible_order in [ "Dp", "dp" ] then
        
        Error( "only \"Dp\" and \"dp\" admissible orders are supported!\n" );
        
    fi;
    
    colors := ValueOption( "colors" );
    
    if colors = fail then
        
        colors := rec( coeff := "", other := "", reset := "" );
        
    elif colors = true then
        
        colors := rec( coeff := TextAttr.5, other := TextAttr.1, reset := TextAttr.reset );
        
    fi;
    
    if IsPathCategory( C ) then
        
        sorting_func := { mor_1, mor_2 } -> IsDescendingForMorphisms( C, mor_1, mor_2, admissible_order );
        
    else
        
        sorting_func := { mor_1, mor_2 } -> IsDescendingForMorphisms( UnderlyingCategory( C ), CanonicalRepresentative( mor_1 ), CanonicalRepresentative( mor_2 ), admissible_order );
        
    fi;
    
    kC := LinearClosure( k, C, sorting_func : FinalizeCategory := false ); # every morphism starts by its maximum monomial

    kC!.Name := Concatenation( RingName( k ), "-", kC!.Name );
    
    kC!.admissible_order := admissible_order;
    
    kC!.colors := colors;
    
    SetUnderlyingQuiver( kC, UnderlyingQuiver( C ) );
    
    SetSetOfObjects( kC,
          List( SetOfObjects( C ),
                    o -> ObjectConstructor( kC, o ) ) );
    
    SetSetOfGeneratingMorphisms( kC,
          List( SetOfGeneratingMorphisms( C ),
                    m -> MorphismConstructor( kC,
                              SetOfObjects( kC )[ObjectIndex( Source( m ) )],
                              Pair( [ One( UnderlyingRing( kC ) ) ], [ m ] ),
                              SetOfObjects( kC )[ObjectIndex( Target( m ) )] ) ) );
    
    SetDefiningTripleOfUnderlyingQuiver( kC, DefiningTripleOfUnderlyingQuiver( C ) );
    ## this is a hotfix: delete as soon as we install all derivations at once in Finalize instead of the step-by-step addition of derivations in the Add-functions.
    Reevaluate( kC!.derivations_weight_list );
    
    if CanCompute( C, "MorphismsOfExternalHom" ) then
        
        ##
        AddBasisOfExternalHom( kC,
          
          function ( kC, source, target )
            local k, C;
            
            k := UnderlyingRing( kC );
            C := UnderlyingCategory( kC );
            
            return List( MorphismsOfExternalHom( C, ObjectDatum( kC, source ), ObjectDatum( kC, target ) ),
                            m -> MorphismConstructor( kC, source, Pair( [ One( k ) ], [ m ] ), target ) );
            
        end );
        
        ##
        AddCoefficientsOfMorphism( kC,
          
          function ( kC, alpha )
            local k, C, supp, coef, external_hom, indices;
            
            k := UnderlyingRing( kC );
            C := UnderlyingCategory( kC );
            
            supp := SupportMorphisms( alpha );
            coef := CoefficientsList( alpha );
            
            external_hom := MorphismsOfExternalHom( C, ObjectDatum( kC, Source( alpha ) ), ObjectDatum( kC, Target( alpha ) ) );
            
            indices := List( supp, mor -> PositionProperty( external_hom, m -> IsCongruentForMorphisms( C, m, mor ) ) );
            
            return List( [ 1 .. Length( external_hom ) ],
                    function ( i )
                      local p;
                      
                      p := Position( indices, i );
                      
                      if p <> fail then
                          return coef[p];
                      else
                          return Zero( k );
                      fi;
                      
                    end );
            
        end );
         
    fi;
    
    INSTALL_VIEW_AND_DISPLAY_METHODS_IN_LINEAR_CLOSURES_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS( kC );
    
    Append( kC!.compiler_hints.category_attribute_names,
            [ "UnderlyingQuiver",
              "DefiningTripleOfUnderlyingQuiver",
              ] );
    
    Finalize( kC );
    
    return kC;
    
end );

##
InstallOtherMethod( LinearClosure,
          [ IsHomalgRing, IsPathCategory ],
  
  LINEAR_CLOSURE_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS
);

##
InstallOtherMethod( \[\],
          [ IsHomalgRing, IsPathCategory ],
  
  function ( k, C )
    
    return LinearClosure( k, C );
    
end );

##
InstallOtherMethod( LinearClosure,
          [ IsHomalgRing, IsQuotientOfPathCategory ],
  
  LINEAR_CLOSURE_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS
);

##
InstallOtherMethod( \[\],
          [ IsHomalgRing, IsQuotientOfPathCategory ],
  
  function ( k, C )
    
    return LinearClosure( k, C );
    
end );

##
InstallGlobalFunction( "INSTALL_VIEW_AND_DISPLAY_METHODS_IN_LINEAR_CLOSURES_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS",
  
  function ( kC )
    local C;
     
    C := UnderlyingCategory( kC );
    
    if IsQuotientOfPathCategory( C ) then
        
        C := UnderlyingCategory( C );
        
    fi;
    
    ##
    InstallMethod( ViewString,
              [ ObjectFilter( kC ) ],
      
      function ( obj )
        
        return ViewString( ObjectDatum( obj ) );
        
    end );
    
    ##
    InstallMethod( DisplayString,
              [ ObjectFilter( kC ) ],
      
      obj -> Concatenation( ViewString( obj ), "\n" )
    );
    
    ##
    InstallMethod( ViewString,
              [ MorphismFilter( kC ) ],
      
      function ( alpha )
        local kC, Q, coeffs, labels, datum_string;
        
        kC := CapCategory( alpha );
        
        Q := UnderlyingQuiver( C );
        
        coeffs := List( CoefficientsList( alpha ), c -> Concatenation( kC!.colors.coeff, String( c ), kC!.colors.reset ) );
        
        labels := List( SupportMorphisms( alpha ), m -> ( str -> str{[1 .. PositionSublist( str, Concatenation( Q!.colors.other, ":" ) ) - 1]} )( ViewString( m ) ) );
        
        if IsEmpty( labels ) then
            
            datum_string := Concatenation( kC!.colors.coeff, "0", kC!.colors.reset );
            
        else
            
            datum_string := JoinStringsWithSeparator( ListN( coeffs, labels, { c, l } -> Concatenation( c, "*", l ) ), Concatenation( kC!.colors.reset, " + " ) );
            datum_string := ReplacedString( datum_string, Concatenation( "+ ", kC!.colors.coeff, "-" ), Concatenation( "- ", kC!.colors.coeff ) );
        fi;
        
        return
          Concatenation(
              datum_string,
              Q!.colors.other,
              ":",
              ViewString( UnderlyingOriginalObject( Source( alpha ) ) ),
              Q!.colors.other,
              " -≻ ",
              ViewString( UnderlyingOriginalObject( Target( alpha ) ) ) );
          
    end );
    
    ##
    InstallMethod( DisplayString,
              [ MorphismFilter( kC ) ],
      
      mor -> Concatenation( ViewString( mor ), "\n" )
    );
    
end );

##
InstallMethod( \.,
          [ IsLinearClosure, IsPosInt ],
  
  function ( kC, string_as_int )
    local name, cell;
    
    name := NameRNam( string_as_int );
    
    cell := UnderlyingCategory( kC ).( name );
    
    if IsCapCategoryObject( cell ) then
        
        return ObjectConstructor( kC, cell );
        
    else
        
        return MorphismConstructor( kC,
                    ObjectConstructor( kC, Source( cell ) ),
                    Pair( [ One( UnderlyingRing( kC ) ) ], [ cell ] ),
                    ObjectConstructor( kC, Target( cell ) ) );
        
    fi;
    
end );

##
InstallMethod( DataTablesOfCategory,
            "for hom-finite k-linear closures of path categories",
          [ IsLinearClosure ],
  
  function ( kC )
    local C, q, objs, gmors, external_homs;
    
    if not HasRangeCategoryOfHomomorphismStructure( kC ) then
        Error( "the linear closure category passed to 'DataTablesOfCategory' must be hom-finite!" );
    fi;
    
    C := UnderlyingCategory( kC );
    
    if not (IsPathCategory( C ) or IsQuotientOfPathCategory( C ))  then
        
        TryNextMethod( );
        
    fi;
    
    q := UnderlyingQuiver( C );
    
    objs := SetOfObjects( kC );
    gmors := SetOfGeneratingMorphisms( kC );
    
    external_homs :=  List( objs, s -> List( objs, t -> BasisOfExternalHom( kC, s, t ) ) );
    
    return
      NTuple( 5,
      
      #coefficients_ring,
      UnderlyingRing( kC ),
      
      #quiver
      q,
      
      #decomposition_indices_of_bases_elements
      List( external_homs,
        s -> List( s, hom_st -> List( hom_st, m -> MorphismIndices( CanonicalRepresentative( SupportMorphisms( m )[1] ) ) ) ) ),
      
      # hom_structure_objs_gmors
      List( objs,
        o -> List( gmors,
          gm -> EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( HomomorphismStructureOnMorphisms( kC, IdentityMorphism( kC, o ), gm ) ) ) ) ),
      
      #hom_structure_gmors_objs
      List( objs,
        o -> List( gmors,
          gm -> EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( HomomorphismStructureOnMorphisms( kC, gm, IdentityMorphism( kC, o ) ) ) ) ) ) );
    
end );

