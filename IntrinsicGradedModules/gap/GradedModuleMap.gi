# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for operations:
#
####################################

##
InstallOtherMethod( UnderlyingMatrix,
        "for a f.p. graded module map",
        [ IsFpGradedLeftOrRightModulesMorphism ],

  function( phi )
    
    return UnderlyingHomalgMatrix( MorphismDatum( phi ) );
    
end );

##
InstallMethod( UnderlyingMorphismMutable,
        "for a homalg/CAP graded module",
        [ IsMapOfGradedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    
    return UnderlyingCell( ActiveCell( phi ) );
    
end );

##
InstallMethod( PairOfPositionsOfTheDefaultPresentations,
        "for a homalg/CAP graded module",
        [ IsMapOfGradedModulesRep and IsCapCategoryIntrinsicMorphism ],

  function( phi )
    
    return [ PositionOfTheDefaultPresentation( Source( phi ) ),
             PositionOfTheDefaultPresentation( Range( phi ) ) ];
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( GradedPresentationMorphismByFreyd,
        "for two f.p. graded modules and a homalg matrix",
        [ IsFpGradedLeftOrRightModulesObject, IsHomalgMatrix, IsFpGradedLeftOrRightModulesObject ],
        
  function( M, matrix, N )
    
    return FreydCategoryMorphism(
                   M,
                   GradedRowOrColumnMorphism(
                           Range( RelationMorphism( M ) ),
                           matrix,
                           Range( RelationMorphism( N ) ) ),
                   N );
    
end );

##
InstallMethod( GradedMap,
        "for a homalg matrix, two objects, a string and a homalg graded ring",
        [ IsHomalgMatrix, IsObject, IsObject, IsString, IsHomalgGradedRingRep ],
        
  function( matrix, source, target, s, S )
    local left, nr_gen_s, nr_gen_t, source2, pos_s, degrees_s, target2, pos_t, degrees_t, underlying_morphism, type, morphism;
    
    if IsHomalgModule( source ) and not IsCapCategoryIntrinsicObject( source ) then
        Error( "source is not an intrinsic module\n" );
    elif IsHomalgModule( target ) and not IsCapCategoryIntrinsicObject( target ) then
        Error( "target is not an intrinsic module\n" );
    fi;
    
    #check for information about left or right modules
    if IsStringRep( s ) and Length( s ) > 0 then
      if LowercaseString( s{[1..1]} ) = "r" then
        left := false;  ## we explicitly asked for a morphism of right modules
      else
        left := true;
      fi;
    fi;
    if not IsBound( left ) then
      if  IsHomalgModule( source ) then
        left := IsHomalgLeftObjectOrMorphismOfLeftObjects( source );
      elif IsList( source ) and not source = [ ] and IsHomalgModule( source[1] ) then
        left := IsHomalgLeftObjectOrMorphismOfLeftObjects( source[1] );
      elif IsHomalgModule( target ) then
        left := IsHomalgLeftObjectOrMorphismOfLeftObjects( target );
      elif IsList( target ) and IsHomalgModule( target[1] ) then
        left := IsHomalgLeftObjectOrMorphismOfLeftObjects( target[1] );
      fi;
    fi;
    if not IsBound( left ) then
      Error( "No information whether to construct a morphism between left modules or a morphism between right modules" );
    fi;
    
    #set nr of generators of both modules
    if left then
      nr_gen_s := NrRows( matrix );
      nr_gen_t := NrColumns( matrix );
    else
      nr_gen_t := NrRows( matrix );
      nr_gen_s := NrColumns( matrix );
    fi;

    #source from input
    if source = "free" then
      if left then
        source2 := FreeLeftModuleWithDegrees( nr_gen_s, S );
      else
        source2 := FreeRightModuleWithDegrees( nr_gen_s, S );
      fi;
    elif ( IsList( source ) and ( source = [ ] or not( IsString( source ) ) ) ) then
      if Length( source ) = 2 and IsHomalgGradedModule( source[1] ) and IsPosInt( source[2] ) then
        source2 := source[1];
        pos_s := source[2];
        if not IsBound( SetsOfRelations( source2 )!.( pos_s ) ) then
          Error( "the source module does not possess a ", source[2], ". set of relations (this positive number is given as the second entry of the list provided as the second argument)\n" );
        fi;
        degrees_s := DegreesOfGenerators( source2 );
      elif Length( source ) = 2 and IsHomalgModule( source[1] ) and IsPosInt( source[2] ) then
        source2 := GradedModule( source[1], S );
        pos_s := source[2];
        if not IsBound( SetsOfRelations( source2 )!.( pos_s ) ) then
          Error( "the source module does not possess a ", source[2], ". set of relations (this positive number is given as the second entry of the list provided as the second argument)\n" );
        fi;
      elif IsHomogeneousList( source ) and ( source = [] or IsInt( source[1] ) ) then
        degrees_s := source;
        if left then
          source2 := FreeLeftModuleWithDegrees( degrees_s, S );
        else
          source2 := FreeRightModuleWithDegrees( degrees_s, S );
        fi;
      else
        Error( "Unknow configuration of the second parameter: expected a list of a homalg graded module and an integer (indicating the position of the presentation) or a list of degrees" );
      fi;
    elif IsInt( source ) then
      if left then
        degrees_s := ListWithIdenticalEntries( NrRows( matrix ), source );
        source2 := FreeLeftModuleWithDegrees( degrees_s, S );
      else
        degrees_s := ListWithIdenticalEntries( NrColumns( matrix ), source );
        source2 := FreeRightModuleWithDegrees( degrees_s, S );
      fi;
    elif IsHomalgGradedModule( source ) then
      source2 := source;
      degrees_s := DegreesOfGenerators( source2 );
    else
      Error( "unknown type of second parameter" );
    fi;
    if not IsBound( pos_s ) then
      pos_s := PositionOfTheDefaultPresentation( source2 );
    fi;
    
    #target from input
    if target = "free" then
      if source <> "free" then
        Error( "not yet implemented" );
      fi;
      if left then
        target2 := FreeLeftModuleWithDegrees( nr_gen_t, S );
      else
        target2 := FreeRightModuleWithDegrees( nr_gen_t, S );
      fi;
    elif IsList( target ) then
      if Length( target ) = 2 and IsHomalgGradedModule( target[1] ) and IsPosInt( target[2] ) then
        target2 := target[1];
        pos_t := target[2];
        if not IsBound( SetsOfRelations( target2 )!.( pos_t ) ) then
          Error( "the target module does not possess a ", target[2], ". set of relations (this positive number is given as the second entry of the list provided as the third argument)\n" );
        fi;
      elif IsHomogeneousList( target ) and ( target = [] or IsInt( target[1] ) ) then
        degrees_t := target;
        if left then
          target2 := FreeLeftModuleWithDegrees( degrees_t, S );
        else
          target2 := FreeRightModuleWithDegrees( degrees_t, S );
        fi;
      else
        Error( "Unknow configuration of the third parameter: expected a list of a homalg graded module and an integer (indicating the position of the presentation) or a list of degrees" );
      fi;
    elif IsInt( target ) then
      if left then
        degrees_t := ListWithIdenticalEntries( NrColumns( matrix ), target );
        target2 := FreeLeftModuleWithDegrees( degrees_s, S );
      else
        degrees_t := ListWithIdenticalEntries( NrRows( matrix ), target );
        target2 := FreeRightModuleWithDegrees( degrees_s, S );
      fi;
    elif IsHomalgGradedModule( target ) then
      target2 := target;
    else
      Error( "unknown type of third parameter" );
    fi;
    if not IsBound( pos_t) then
      pos_t := PositionOfTheDefaultPresentation( target2 );
    fi;
    if not IsBound( degrees_t) then
      degrees_t := DegreesOfGenerators( target2 );
    fi;
    
    #construct degrees source according to degrees of target and with the help of generators
    if not IsBound( degrees_s ) then
      if left then
        if IsHomalgMatrixOverGradedRingRep( matrix ) then
          degrees_s := NonTrivialDegreePerRow( matrix, degrees_t );
        else
          degrees_s := NonTrivialDegreePerRow( matrix, S, degrees_t );
        fi;
        source2 := FreeLeftModuleWithDegrees( degrees_s, S );
      else
        if IsHomalgMatrixOverGradedRingRep( matrix ) then
          degrees_s := NonTrivialDegreePerColumn( matrix, degrees_t );
        else
          degrees_s := NonTrivialDegreePerColumn( matrix, S, degrees_t );
        fi;
        source2 := FreeRightModuleWithDegrees( degrees_s, S );
      fi;
    fi;
    
    #sanity check on input
    if not( IsIdenticalObj( HomalgRing( source2 ), S ) and IsIdenticalObj( HomalgRing( target2 ), S ) ) then
      Error( "Contradictory information about the ring over which to create a graded morphism" );
    fi;
    
    if not IsHomalgLeftObjectOrMorphismOfLeftObjects( source2 ) = IsHomalgLeftObjectOrMorphismOfLeftObjects( target2 ) then
      Error( "source and target are expected to be both left or right modules" );
    fi;
    
    if not IsHomalgLeftObjectOrMorphismOfLeftObjects( UnderlyingModule( source2 ) ) = IsHomalgLeftObjectOrMorphismOfLeftObjects( UnderlyingModule( target2 ) ) then
      Error( "underlying modules of source and target are expected to be both left or right modules" );
    fi;

    if not IsCapCategoryIntrinsicObject( source2 ) then
        Error( "source2 is not an intrinsic module\n" );
    elif not IsCapCategoryIntrinsicObject( target2 ) then
        Error( "target2 is not an intrinsic module\n" );
    fi;
    
    ResetFilterObj( matrix, IsMutable );
    
    morphism := GradedPresentationMorphismByFreyd(
                        RelationsOfModule( source2, pos_s ),
                        matrix,
                        RelationsOfModule( target2, pos_t ) );
    
    morphism := MorphismWithAmbientObject(
                        CertainCell( source2, pos_s ),
                        morphism,
                        CertainCell( target2, pos_t ) );
    
    morphism := Intrinsify( morphism, source2, pos_s, target2, pos_t );
    
    ## TODO: legacy
    morphism!.reduced_matrices := rec( );
    
    INSTALL_TODO_LISTS_FOR_HOMALG_MORPHISMS( [ morphism ], morphism );
    
    return morphism;
    
end ); 

##
InstallOtherMethod( GradedMap,
        "for graded module morphisms and two homalg/CAP graded modules",
        [ IsFpGradedLeftOrRightModulesMorphism,
          IsGradedModuleOrGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule,
          IsGradedModuleOrGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( morphism, source, target )
    local s, t;
    
    s := PositionOfActiveCell( source );
    t := PositionOfActiveCell( target );
    
    return
      Intrinsify(
              MorphismWithAmbientObject( CertainCell( source, s ), morphism, CertainCell( target, t ) ),
              source, s,
              target, t );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( Display,
        "for a homalg/CAP graded module map",
        [ IsMapOfGradedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( o )
    local mat, target;
    
    mat := MatrixOfMap( o );
    
    Display( mat );
    
    Print( "\nthe graded map is currently represented by the above ", NrRows( mat ), " x ", NrColumns( mat ), " matrix\n" );
    
    target := Range( o );
    
    if NrGenerators( target ) = 1 then
        Print( "\n(degree of generator of target: " );
        ViewObj( DegreesOfGenerators( target )[1] );
        Print( ")\n" );
    else
        Print( "\n(degrees of generators of target: " );
        ViewObj( DegreesOfGenerators( target ) );
        Print( ")\n" );
    fi;
    
end );
