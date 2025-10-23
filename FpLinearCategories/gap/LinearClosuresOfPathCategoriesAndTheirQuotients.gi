# SPDX-License-Identifier: GPL-2.0-or-later
# FpLinearCategories: Finitely presented linear categories by generating quivers and relations
#
# Implementations
#

BindGlobal( "LINEAR_CLOSURE_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS",
  
  function ( rows, C )
    local k, admissible_order, colors, sorting_func, kC;
    
    k := CommutativeRingOfLinearCategory( rows );
    
    admissible_order := ValueOption( "admissible_order" );
    
    if admissible_order = fail then
        
        if IsPathCategory( C ) then
            admissible_order := C!.admissible_order;
        elif IsQuotientCategory( C ) then
            admissible_order := AmbientCategory( C )!.admissible_order;
        else
            Error( "the category `C` is neither IsPathCategory nor IsQuotientCategory" );
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
        
        sorting_func := { mor_1, mor_2 } -> IsDescendingForMorphisms( AmbientCategory( C ), CanonicalRepresentative( mor_1 ), CanonicalRepresentative( mor_2 ), admissible_order );
        
    fi;
    
    kC := LinearClosure( rows, C, sorting_func : FinalizeCategory := false ); # every morphism starts by its maximum monomial
    
    SetIsObjectFiniteCategory( kC, true );
    
    kC!.Name := Concatenation( RingName( k ), "-", kC!.Name );
    
    kC!.admissible_order := admissible_order;
    
    kC!.colors := colors;
    
    SetUnderlyingQuiver( kC, UnderlyingQuiver( C ) );
    
    AddSetOfObjectsOfCategory( kC,
      function( kC )
        local C;
        
        C := UnderlyingCategory( kC );
        
        return List( SetOfObjects( C ), o -> ObjectConstructor( kC, o ) );
        
    end );
    
    AddSetOfGeneratingMorphismsOfCategory( kC,
      function( kC )
        local C;
        
        C := UnderlyingCategory( kC );
        
        return List( SetOfGeneratingMorphisms( C ), m ->
                     MorphismConstructor( kC,
                             SetOfObjects( kC )[ObjectIndex( Source( m ) )],
                             Pair( [ One( UnderlyingRing( kC ) ) ], [ m ] ),
                             SetOfObjects( kC )[ObjectIndex( Target( m ) )] ) );
        
    end );
    
    SetDefiningTripleOfUnderlyingQuiver( kC, DefiningTripleOfUnderlyingQuiver( C ) );
    
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
          [ IsCategoryOfRows, IsPathCategory ],
        
  function ( rows, C )
    
    return LINEAR_CLOSURE_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS( rows, C );
    
end );

##
InstallOtherMethod( LinearClosure,
          [ IsHomalgRing, IsPathCategory ],
        
  function ( k, C )
    
    return LinearClosure( CategoryOfRows( k ), C );
    
end );

##
InstallOtherMethod( \[\],
          [ IsHomalgRing, IsPathCategory ],
  
  function ( k, C )
    
    return LinearClosure( k, C );
    
end );

##
InstallOtherMethod( LinearClosure,
          [ IsCategoryOfRows, IsQuotientOfPathCategory ],
  
  function ( rows, C )
    
    return LINEAR_CLOSURE_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS( rows, C );
    
end );

##
InstallOtherMethod( LinearClosure,
          [ IsHomalgRing, IsQuotientOfPathCategory ],
  
  function ( k, C )
    
    return LinearClosure( CategoryOfRows( k ), C );
    
end );

##
InstallOtherMethod( \[\],
          [ IsHomalgRing, IsQuotientOfPathCategory ],
  
  function ( k, C )
    
    return LinearClosure( k, C );
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a linear closure category",
        [ IsLinearClosure ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a linear closure category",
        [ IsLinearClosure ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallOtherMethod( AssignSetOfObjects,
        [ IsLinearClosure, IsString ],
        
  function( A, label )
    local names, objects, func;
    
    if not ( IsPathCategory( UnderlyingCategory( A ) ) or IsQuotientOfPathCategory( UnderlyingCategory( A ) ) ) then
        TryNextMethod( );
    fi;
    
    names := LabelsOfObjects( UnderlyingQuiver( A ) );
    
    objects := SetOfObjects( A );
    
    func := function( name, o )
              
              if Int( name ) <> fail and label = "" then
                  Error( "The second argument should be a non-empty string" );
              fi;
              
              name := Concatenation( label, ReplacedString( name, "-", "m" ) );
              
              MakeReadWriteGlobal( name );
              
              DeclareSynonym( name, o );
              
              return 1;
              
            end;
            
    ListN( names, objects, func );
    
end );

##
InstallOtherMethod( AssignSetOfObjects,
        [ IsLinearClosure ],
        
  function( A )
    
    AssignSetOfObjects( A, "" );
    
end );

##
InstallOtherMethod( AssignSetOfGeneratingMorphisms,
        [ IsLinearClosure, IsString ],
        
  function( A, label )
    local names, morphisms, func;
    
    if not ( IsPathCategory( UnderlyingCategory( A ) ) or IsQuotientOfPathCategory( UnderlyingCategory( A ) ) ) then
        TryNextMethod( );
    fi;
    
    names := LabelsOfMorphisms( UnderlyingQuiver( A ) );
    
    morphisms := SetOfGeneratingMorphisms( A );
    
    func := function( name, m )
              
              if Int( name ) <> fail and label = "" then
                  Error( "The second argument should be a non-empty string" );
              fi;
              
              name := Concatenation( label, ReplacedString( name, "-", "m" ) );
              
              MakeReadWriteGlobal( name );
              
              DeclareSynonym( name, m );
              
              return 1;
              
            end;
            
    ListN( names, morphisms, func );
    
end );

##
InstallOtherMethod( AssignSetOfGeneratingMorphisms,
        [ IsLinearClosure ],
        
  function( A )
    
    AssignSetOfGeneratingMorphisms( A, "" );
    
end );

##
InstallGlobalFunction( "INSTALL_VIEW_AND_DISPLAY_METHODS_IN_LINEAR_CLOSURES_OF_PATH_CATEGORIES_OR_THEIR_QUOTIENTS",
  
  function ( kC )
    local C;
     
    C := UnderlyingCategory( kC );
    
    if IsQuotientOfPathCategory( C ) then
        
        C := AmbientCategory( C );
        
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
        local kC, Q, bracket, coeffs, labels, datum_string;
        
        kC := CapCategory( alpha );
        
        Q := UnderlyingQuiver( C );
        
        bracket :=
          function( str )
            if Position( str, '+' ) = fail and Position( str, '-' ) = fail then
                return str;
            else
                return Concatenation( "(", str, ")" );
            fi;
        end;
        
        coeffs := List( CoefficientsList( alpha ), c -> bracket( Concatenation( kC!.colors.coeff, String( c ), kC!.colors.reset ) ) );
        
        labels := List( SupportMorphisms( alpha ), m -> ( str -> str{[1 .. PositionSublist( str, Concatenation( Q!.colors.other, ":" ) ) - 1]} )( ViewString( m ) ) );
        
        if IsEmpty( labels ) then
            
            datum_string := Concatenation( kC!.colors.coeff, "0", kC!.colors.reset );
            
        else
            
            datum_string := JoinStringsWithSeparator( ListN( coeffs, labels, { c, l } -> Concatenation( c, "*", l ) ), Concatenation( kC!.colors.reset, " + " ) );
            
        fi;
        
        return
          Concatenation(
              datum_string,
              Q!.colors.other,
              ":",
              ViewString( UnderlyingOriginalObject( Source( alpha ) ) ),
              Q!.colors.other,
              " → ",
              ViewString( UnderlyingOriginalObject( Target( alpha ) ) ) );
          
    end );
    
    ##
    InstallMethod( DisplayString,
              [ MorphismFilter( kC ) ],
      
      mor -> Concatenation( ViewString( mor ), "\n" )
    );
    
end );

##
InstallOtherMethod( \/,
          [ IsString, IsLinearClosure ],
  
  function ( name, kC )
    local cell;
    
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
#= comment for Julia
##
INSTALL_DOT_METHOD( IsLinearClosure );
# =#

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

##
InstallMethod( DatumOfCellAsEvaluatableString,
        [ IsLinearClosureMorphism, IsList ],
        
  function( mor, list_of_evaluatable_strings )
    local datum;
    
    datum := MorphismDatum( mor );
    
    return Concatenation(
                   "Pair( ", String( datum[1] ),
                   ", [ ",
                   JoinStringsWithSeparator( List( datum[2], e -> CellAsEvaluatableString( e, list_of_evaluatable_strings ) ), ", " ),
                   " ] )" );
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToAlgebroidData,
        "for a two categories and a pair of functions",
        [ IsLinearClosure, IsList, IsCapCategory ],
        
  function( LC, pair_of_funcs, category )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for categories
    
    extended_functor_on_objects :=
      function( objLC )
        local objC;
        
        objC := ObjectDatum( LC, objLC );
        
        return functor_on_objects( objC );
        
    end;
    
    extended_functor_on_morphisms :=
      function( source, morLC, target )
        local morC;
        
        morC := MorphismDatum( LC, morLC );
        
        return LinearCombinationOfMorphisms( category,
                       source,
                       morC[1], ## coeffs
                       List( morC[2], mor ->
                             functor_on_morphisms(
                                     functor_on_objects( Source( mor ) ),
                                     mor,
                                     functor_on_objects( Target( mor ) ) ) ),
                       target );
        
    end;
    
    return Triple( LC,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   category );
    
end );

##
InstallMethodForCompilerForCAP( EvaluateLinearClosureEndomorphism,
        "for a linear closure category, a morphism therein, a linear category, an object therein, and a list of endomorphisms thereof",
        [ IsLinearClosure, IsLinearClosureMorphism, IsCapCategory, IsCapCategoryObject, IsList ],
        
  function( linear_closure, morphism, V, rep_obj, rep_mors )
    local functor_on_obj, functor_on_mors, functor;
    
    functor_on_obj :=
      function( objC )
        
        return rep_obj;
        
    end;
    
    functor_on_mors :=
      function( source, morC, target )
        
        return PreComposeList( source, rep_mors{MorphismIndices( morC )}, target );
        
    end;
    
    functor := ExtendFunctorToAlgebroidData( linear_closure,
                       Pair( functor_on_obj, functor_on_mors ),
                       V );
    
    return functor[2][2]( rep_obj, morphism, rep_obj );
    
end );
