# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( CATEGORY_OF_FP_BIALGEBRAS,
        "for a category of finitely presented algebras",
        [ IsCategoryOfFpAlgebras ],
        
  FunctionWithNamedArguments(
  [ [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, FpAlg_k )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          ComonFpAlg_k,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          FpBialg_k;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 9,
              rec( category := false, filter := IsLinearClosure ),
              rec( category := false, filter := IsLinearClosureObject ),
              IsBigInt,
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ),
              IsBigInt,
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ),
              CapJitDataTypeOfListOf( IsStringRep ),
              ## counit:
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ),
              ## comultiplication:
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ) );
    
    ##
    object_constructor :=
      function( FpBialg_k, nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult )
        
        return CreateCapCategoryObjectWithAttributes( FpBialg_k,
                       DefiningNonupleOfFinitelyPresentedBialgebra,
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult );
        
    end;
    
    ##
    object_datum := { FpBialg_k, fp_bialgebra } -> DefiningNonupleOfFinitelyPresentedBialgebra( fp_bialgebra );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) );
    
    ##
    morphism_constructor :=
      function ( FpBialg_k, source, list_of_images, target )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, NrGenerators( source ) = Length( list_of_images ) );
        
        return CreateCapCategoryMorphismWithAttributes( FpBialg_k,
                       source,
                       target,
                       ListOfImages, list_of_images );
        
    end;
    
    ##
    morphism_datum := { FpBialg_k, fp_bialgebra_morphism } -> ListOfImages( fp_bialgebra_morphism );
    
    ## building the categorical tower:
    
    ComonFpAlg_k := CATEGORY_OF_COMONOIDS( FpAlg_k : FinalizeCategory := false );
    
    SetIsCategoryWithZeroObject( ComonFpAlg_k, true );
    
    AddZeroObject( ComonFpAlg_k,
      function( ComonFpAlg_k )
        
        return TerminalObject( ComonFpAlg_k );
        
    end );
    
    AddUniversalMorphismIntoZeroObjectWithGivenZeroObject( ComonFpAlg_k,
      function( ComonFpAlg_k, comon_on_fp_algebra, zero_object )
        
        return UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( ComonFpAlg_k, comon_on_fp_algebra, zero_object );
        
    end );
    
    AddUniversalMorphismFromZeroObjectWithGivenZeroObject( ComonFpAlg_k,
      function( ComonFpAlg_k, comon_on_fp_algebra, zero_object )
        local FpAlg_k, unit;
        
        FpAlg_k := UnderlyingCategory( ComonFpAlg_k );
        
        unit := Unit( FpAlg_k, ObjectDatum( ComonFpAlg_k, comon_on_fp_algebra )[1] );
        
        return MorphismConstructor( ComonFpAlg_k,
                       zero_object,
                       unit,
                       comon_on_fp_algebra );
        
    end );
    
    Finalize( ComonFpAlg_k : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( FpBialg_k, nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult )
        local ComonFpAlg_k, FpAlg_k, fp_algebra, counit, comult;
        
        ComonFpAlg_k := ModelingCategory( FpBialg_k );
        
        FpAlg_k := UnderlyingCategory( ComonFpAlg_k );
        
        fp_algebra := ObjectConstructor( FpAlg_k,
                              NTuple( 7,
                                      nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[1],
                                      nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[2],
                                      nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[3],
                                      nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[4],
                                      nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[5],
                                      nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[6],
                                      nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[7] ) );
        
        counit := MorphismConstructor( FpAlg_k,
                          fp_algebra,
                          nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[8],
                          TensorUnit( FpAlg_k ) );
        
        comult := MorphismConstructor( FpAlg_k,
                          fp_algebra,
                          nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[9],
                          TensorProductOnObjects( FpAlg_k,
                                  fp_algebra,
                                  fp_algebra ) );
        
        return ObjectConstructor( ComonFpAlg_k,
                       Triple( fp_algebra,
                               counit,
                               comult ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( FpBialg_k, comonoid_on_fp_algebra )
        local ComonFpAlg_k, FpAlg_k, triple_of_fp_algebra_counit_comultiplication, septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens, counit, comult;
        
        ComonFpAlg_k := ModelingCategory( FpBialg_k );
        
        FpAlg_k := UnderlyingCategory( ComonFpAlg_k );
        
        triple_of_fp_algebra_counit_comultiplication := ObjectDatum( ComonFpAlg_k, comonoid_on_fp_algebra );
        
        septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens := ObjectDatum( FpAlg_k, triple_of_fp_algebra_counit_comultiplication[1] );
        
        counit := MorphismDatum( FpAlg_k, triple_of_fp_algebra_counit_comultiplication[2] );
        comult := MorphismDatum( FpAlg_k, triple_of_fp_algebra_counit_comultiplication[3] );
        
        return NTuple( 9,
                       septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens[1],
                       septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens[2],
                       septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens[3],
                       septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens[4],
                       septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens[5],
                       septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens[6],
                       septuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens[7],
                       counit,
                       comult );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( FpBialg_k, source, morphism, target )
        local ComonFpAlg_k, FpAlg_k;
        
        ComonFpAlg_k := ModelingCategory( FpBialg_k );
        
        FpAlg_k := UnderlyingCategory( ComonFpAlg_k );
        
        return MorphismConstructor( ComonFpAlg_k,
                       source,
                       MorphismConstructor( FpAlg_k,
                               ObjectDatum( ComonFpAlg_k, source )[1],
                               morphism,
                               ObjectDatum( ComonFpAlg_k, target )[1] ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( FpBialg_k, phi )
        local ComonFpAlg_k, FpAlg_k;
        
        ComonFpAlg_k := ModelingCategory( FpBialg_k );
        
        FpAlg_k := UnderlyingCategory( ComonFpAlg_k );
        
        return MorphismDatum( FpAlg_k,
                       MorphismDatum( ComonFpAlg_k, phi ) );
        
    end;
    
    ##
    FpBialg_k :=
      ReinterpretationOfCategory( ComonFpAlg_k,
              rec( name := Concatenation( "CategoryOfFpBialgebras( ", RingName( CoefficientsRing( FpAlg_k ) ), " )" ),
                   category_filter := IsCategoryOfFpBialgebras,
                   category_object_filter := IsObjectInCategoryOfFpBialgebras,
                   category_morphism_filter := IsMorphismInCategoryOfFpBialgebras,
                   object_datum_type := object_datum_type,
                   morphism_datum_type := morphism_datum_type,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true )
              : FinalizeCategory := false );
    
    SetFilterObj( FpBialg_k, IsCategoryOfBimonoids );
    
    SetCoefficientsRing( FpBialg_k, CoefficientsRing( FpAlg_k ) );
    
    SetUnderlyingCategory( FpBialg_k, FpAlg_k );
    
    SetUnderlyingCategoryOfMatrices( FpBialg_k, UnderlyingCategoryOfMatrices( FpAlg_k ) );
    
    Append( FpBialg_k!.compiler_hints.category_attribute_names,
            [ "CoefficientsRing",
              "UnderlyingCategory",
              "UnderlyingCategoryOfMatrices",
              ] );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( FpBialg_k );
    fi;
    
    return FpBialg_k;
    
end ) );

##
InstallMethod( CategoryOfFpBialgebras,
        "for a category of finitely presented algebras",
        [ IsCategoryOfFpAlgebras ],
        
  function( FpAlg_k )
    
    return CATEGORY_OF_FP_BIALGEBRAS( FpAlg_k );
    
end );

##
InstallMethod( CategoryOfFpBialgebras,
        "for a linear category",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing ],
        
  function( linear_category )
    
    return CategoryOfFpBialgebras( CategoryOfFpAlgebras( linear_category ) );
    
end );

##
InstallMethod( CategoryOfFpBialgebras,
        "for a commutative homalg ring",
        [ IsHomalgRing and IsCommutative ],
        
  function( k )
    
    return CategoryOfFpBialgebras( CategoryOfFpAlgebras( k ) );
    
end );

##
InstallMethod( CoefficientsRing,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    
    return CoefficientsRing( CapCategory( fp_bialgebra ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingObject,
        "for a category of finitely presented bialgebras and an object therein",
        [ IsCategoryOfFpBialgebras, IsObjectInCategoryOfFpBialgebras ],
        
  function( FpBialg_k, fp_bialgebra )
    
    return DefiningTripleOfInternalComonoid( ModelingObject( FpBialg_k, fp_bialgebra ) )[1];
    
end );

##
InstallOtherMethodForCompilerForCAP( Unit,
        "for a category of finitely presented bialgebras and an object therein",
        [ IsCategoryOfFpBialgebras, IsObjectInCategoryOfFpBialgebras ],
        
  function( FpBialg_k, fp_bialgebra )
    
    return Unit( UnderlyingCategory( FpBialg_k ), UnderlyingObject( FpBialg_k, fp_bialgebra ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( Multiplication,
        "for a category of finitely presented bialgebras and an object therein",
        [ IsCategoryOfFpBialgebras, IsObjectInCategoryOfFpBialgebras ],
        
  function( FpBialg_k, fp_bialgebra )
    
    return Multiplication( UnderlyingCategory( FpBialg_k ), UnderlyingObject( FpBialg_k, fp_bialgebra ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( Counit,
        "for a category of finitely presented bialgebras and an object therein",
        [ IsCategoryOfFpBialgebras, IsObjectInCategoryOfFpBialgebras ],
        
  function( FpBialg_k, fp_bialgebra )
    
    return DefiningTripleOfInternalComonoid( ModelingObject( FpBialg_k, fp_bialgebra ) )[2];
    
end );

##
InstallOtherMethodForCompilerForCAP( Comultiplication,
        "for a category of finitely presented bialgebras and an object therein",
        [ IsCategoryOfFpBialgebras, IsObjectInCategoryOfFpBialgebras ],
        
  function( FpBialg_k, fp_bialgebra )
    
    return DefiningTripleOfInternalComonoid( ModelingObject( FpBialg_k, fp_bialgebra ) )[3];
    
end );

##
InstallMethod( UnderlyingFpAlgebra,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    
    return UnderlyingObject( CapCategory( fp_bialgebra ), fp_bialgebra );
    
end );

##
InstallMethod( NrGenerators,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    
    return NrGenerators( UnderlyingFpAlgebra( fp_bialgebra ) );
    
end );

##
InstallMethod( Dimension,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    
    return Dimension( UnderlyingFpAlgebra( fp_bialgebra ) );
    
end );

##
InstallMethod( AssociatedLinearClosureOfPathCategory,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    
    return AssociatedLinearClosureOfPathCategory( UnderlyingFpAlgebra( fp_bialgebra ) );
    
end );

##
InstallMethod( AssociatedQuotientCategoryOfLinearClosureOfPathCategory,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    
    return AssociatedQuotientCategoryOfLinearClosureOfPathCategory( UnderlyingFpAlgebra( fp_bialgebra ) );
    
end );

##
InstallMethod( \.,
        "for a finitely presented bialgebra and a positive integer",
        [ IsObjectInCategoryOfFpBialgebras, IsPosInt ],
        
  function( fp_bialgebra, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    ## never use AssociatedQuotientCategoryOfLinearClosureOfPathCategory below since it
    ## will trigger a GB computation followed by a HasFiniteNumberOfMacaulayMorphisms/MacaulayMorphisms:
    return AssociatedLinearClosureOfPathCategory( fp_bialgebra ).(name);
    
end );

##
InstallMethod( BaseChangeToDifferentLinearClosure,
        "for a finitely presented bialgebra, a ring map, and an endomorphism of linear closures",
        [ IsObjectInCategoryOfFpBialgebras, IsHomalgRingMap, IsLinearClosureMorphism ],
        
  function( fp_bialgebra, ring_map, mor )
    
    return BaseChangeToDifferentLinearClosure( UnderlyingFpAlgebra( fp_bialgebra ), ring_map, mor );
    
end );

##
InstallOtherMethod( \/,
        "for an endomorphism of linear closures and a finitely presented bialgebra",
        [ IsLinearClosureMorphism, IsObjectInCategoryOfFpBialgebras ],
        
  function( mor, fp_bialgebra )
    
    return mor / UnderlyingFpAlgebra( fp_bialgebra );
    
end );

##
InstallMethod( Pullback,
        "for a category of finitely presented bialgebras, a ring map, and a finitely presented bialgebra",
        [ IsCategoryOfFpBialgebras, IsHomalgRingMap, IsObjectInCategoryOfFpBialgebras ],
        
  function( FpBialg_R, ring_map, fp_bialgebra )
    local B, R, fp_algebra, FpAlg_R, R_fp_algebra, R_U, R_fp_algebra_square, nonuple, counit, comult, septuple;
    
    B := UnderlyingCategoryOfMatrices( FpBialg_R );
    
    R := CommutativeRingOfLinearCategory( B );
    
    fp_algebra := UnderlyingFpAlgebra( fp_bialgebra );
    
    FpAlg_R := UnderlyingCategory( FpBialg_R );
    
    R_fp_algebra := Pullback( FpAlg_R, ring_map, fp_algebra );
    
    R_U := TensorUnit( FpAlg_R );
    
    R_fp_algebra_square := TensorProductOnObjects( FpAlg_R, R_fp_algebra, R_fp_algebra );
    
    nonuple := DefiningNonupleOfFinitelyPresentedBialgebra( fp_bialgebra );
    
    counit := List( nonuple[8], mor -> BaseChangeToDifferentLinearClosure( R_U, ring_map, mor ) );
    
    comult := List( nonuple[9], mor -> BaseChangeToDifferentLinearClosure( R_fp_algebra_square, ring_map, mor ) );
    
    septuple := DefiningSeptupleOfFinitelyPresentedAlgebra( R_fp_algebra );
    
    return ObjectConstructor( FpBialg_R,
                   NTuple( 9,
                           septuple[1],
                           septuple[2],
                           septuple[3],
                           septuple[4],
                           septuple[5],
                           septuple[6],
                           septuple[7],
                           counit,
                           comult ) );
    
end );

##
InstallMethod( Pullback,
        "for a ring map, and a finitely presented bialgebra",
        [ IsHomalgRingMap, IsObjectInCategoryOfFpBialgebras ],
        
  function( ring_map, fp_bialgebra )
    local FpBialg_R;
    
    FpBialg_R := CategoryOfFpBialgebras( Range( ring_map ) );
    
    return Pullback( FpBialg_R, ring_map, fp_bialgebra );
    
end );

##
InstallMethod( \/,
        "for a finitely presented bialgebra and a category of finitely presented bialgebras",
        [ IsObjectInCategoryOfFpBialgebras, IsCategoryOfFpBialgebras ],
        
  function( fp_bialgebra, FpBialg_R )
    local B, R, fp_algebra, FpAlg_R, R_fp_algebra, R_U, R_fp_algebra_square, nonuple, counit, comult, septuple;
    
    B := UnderlyingCategoryOfMatrices( FpBialg_R );
    
    R := CommutativeRingOfLinearCategory( B );
    
    fp_algebra := UnderlyingFpAlgebra( fp_bialgebra );
    
    FpAlg_R := UnderlyingCategory( FpBialg_R );
    
    R_fp_algebra := fp_algebra / FpAlg_R;
    
    R_U := TensorUnit( FpAlg_R );
    
    R_fp_algebra_square := TensorProductOnObjects( FpAlg_R, R_fp_algebra, R_fp_algebra );
    
    nonuple := DefiningNonupleOfFinitelyPresentedBialgebra( fp_bialgebra );
    
    counit := List( nonuple[8], mor -> mor / R_U );
    
    comult := List( nonuple[9], mor -> mor / R_fp_algebra_square );
    
    septuple := DefiningSeptupleOfFinitelyPresentedAlgebra( R_fp_algebra );
    
    return ObjectConstructor( FpBialg_R,
                   NTuple( 9,
                           septuple[1],
                           septuple[2],
                           septuple[3],
                           septuple[4],
                           septuple[5],
                           septuple[6],
                           septuple[7],
                           counit,
                           comult ) );
    
end );

##
InstallMethod( \*,
        "for a homalg ring and a finitely presented bialgebra",
        [ IsHomalgRing, IsObjectInCategoryOfFpBialgebras ],
        
  function( R, fp_bialgebra )
    
    return fp_bialgebra / CategoryOfFpBialgebras( R );
    
end );

##
InstallMethod( Bimonoid,
        "for a category of finitely presented bialgebras, a finitely presented algebra, and two morphisms of finitely presented algebras",
        [ IsCategoryOfFpBialgebras, IsObjectInCategoryOfFpAlgebras, IsMorphismInCategoryOfFpAlgebras, IsMorphismInCategoryOfFpAlgebras ],
        
  function( FpBialg_k, fp_algebra, counit, comult )
    local FpAlg_k, fp_bialgebra;
    
    FpAlg_k := UnderlyingCategory( FpBialg_k );
    
    Assert( 0, IsIdenticalObj( CapCategory( fp_algebra ), FpAlg_k ) );
    Assert( 0, IsIdenticalObj( CapCategory( counit ), FpAlg_k ) );
    Assert( 0, IsIdenticalObj( CapCategory( comult ), FpAlg_k ) );
    
    fp_bialgebra := ReinterpretationOfObject( FpBialg_k,
                            ObjectConstructor( ModelingCategory( FpBialg_k ),
                                    Triple( fp_algebra,
                                            counit,
                                            comult ) ) );
    
    SetUnderlyingFpAlgebra( fp_bialgebra, fp_algebra );
    
    return fp_bialgebra;
    
end );

##
InstallMethod( Bimonoid,
        "for a finitely presented algebra, and two morphisms of finitely presented algebras",
        [ IsObjectInCategoryOfFpAlgebras, IsMorphismInCategoryOfFpAlgebras, IsMorphismInCategoryOfFpAlgebras ],
        
  function( fp_algebra, counit, comult )
    local FpAlg_k, FpBialg_k;
    
    FpAlg_k := CapCategory( fp_algebra );
    
    FpBialg_k := CategoryOfBimonoids( FpAlg_k );
    
    return Bimonoid( FpBialg_k, fp_algebra, counit, comult );
    
end );

##
InstallMethod( Bimonoid,
        "for a category of finitely presented bialgebras, a finitely presented algebra, and two lists",
        [ IsCategoryOfFpBialgebras, IsObjectInCategoryOfFpAlgebras, IsList, IsList ],
        
  function( FpBialg_k, fp_algebra, counit_on_generators, comult_on_generators )
    local counit, comult;
    
    Assert( 0, IsIdenticalObj( CapCategory( fp_algebra ), UnderlyingCategory( FpBialg_k ) ) );
    
    counit := Counit( fp_algebra, counit_on_generators );
    
    comult := Comultiplication( fp_algebra, comult_on_generators );
    
    return Bimonoid( FpBialg_k, fp_algebra, counit, comult );
    
end );

##
InstallMethod( Bimonoid,
        "for a finitely presented algebra and two lists",
        [ IsObjectInCategoryOfFpAlgebras, IsList, IsList ],
        
  function( fp_algebra, counit_on_generators, comult_on_generators )
    local FpAlg_k, FpBialg_k;
    
    FpAlg_k := CapCategory( fp_algebra );
    
    FpBialg_k := CategoryOfFpBialgebras( FpAlg_k );
    
    return Bimonoid( FpBialg_k, fp_algebra, counit_on_generators, comult_on_generators );
    
end );

##
InstallMethod( Bimonoid,
        "for a finitely presented algebra and two records",
        [ IsObjectInCategoryOfFpAlgebras, IsRecord, IsRecord ],
        
  function( fp_algebra, counit_record, comult_record )
    local Q, counit, comult, counit_vars, comult_vars, vars, FpAlg_k, k, R;
    
    Q := AssociatedQuotientCategoryOfLinearClosureOfPathCategory( fp_algebra );
    
    counit := Counit( Q, counit_record );
    comult := Comultiplication( Q, comult_record );
    
    counit_vars := Filtered( counit, IsString );
    
    comult_vars := List( comult, image ->
                         List( Filtered( image, pair -> IsList( pair ) and IsList( pair ) and Length( pair ) = 2 and IsString( pair[1] ) ),
                               pair -> pair[1] ) );
    
    vars := Concatenation( counit_vars, Concatenation( comult_vars ) );
    
    FpAlg_k := CapCategory( fp_algebra );
    
    k := CoefficientsRing( FpAlg_k );
    
    if IsEmpty( vars ) then
        
        R := k;
        
    else
        
        R := k * vars;
        
        if Length( vars ) > 3 then
            SetName( R, Concatenation( RingName( k ), "[", vars[1], ",...,", vars[Length( vars )], "]" ) );
        fi;
        
        ## redefine fp_algebra:
        
        fp_algebra := R * fp_algebra;
        
    fi;
    
    counit := List( counit, image -> image / R );
    comult := List( comult, image -> List( image, summand -> Pair( summand[1] / R, summand[2] ) ) );
    
    return Bimonoid( fp_algebra, counit, comult );
    
end );

##
InstallMethod( Bimonoid,
        "for a finitely presented algebra",
        [ IsObjectInCategoryOfFpAlgebras ],
        
  function( fp_algebra )
    
    return Bimonoid( fp_algebra, rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfBimonoids,
        "for a finitely presented algebra and two records",
        [ IsObjectInCategoryOfFpAlgebras, IsRecord, IsRecord ],
        
  function( fp_algebra, counit_record, comult_record )
    local bimonoid, R, obstruction, obstruction1, obstruction2, relations1, relations2, bimonoid_variety;
    
    bimonoid := Bimonoid( fp_algebra, counit_record, comult_record );
    
    R := CoefficientsRing( bimonoid );
    
    obstruction := [ ];
    
    IsWellDefined( bimonoid : obstruction := obstruction );
    
    obstruction1 := Filtered( obstruction, pair -> pair[2] = "IsWellDefinedForMorphisms" );
    obstruction2 := Filtered( obstruction, pair -> not pair[2] = "IsWellDefinedForMorphisms" );
    
    relations1 := List( obstruction1, pair ->
                        Concatenation( List( pair[1], CoefficientsList ) ) );
    
    relations2 := List( obstruction2, pair ->
                        List( ListN( ListOfImages( Opposite( pair[1][1] ) ), ListOfImages( Opposite( pair[1][2] ) ), { a, b } -> a - b ), CoefficientsList ) );
    
    relations1 := Concatenation( relations1 );
    relations2 := Concatenation( relations2 );
    
    relations1 := HomalgMatrix( relations1, Length( relations1 ), 1, R );
    relations2 := HomalgMatrix( relations2, Length( relations2 ), 1, R );
    
    relations1 := CertainRows( relations1, NonZeroRows( relations1 ) );
    relations2 := CertainRows( relations2, NonZeroRows( relations2 ) );
    
    bimonoid_variety := ClosedSubsetOfSpec( UnionOfRows( relations1, relations2 ) );
    SetParametrizedObject( bimonoid_variety, bimonoid );
    
    return bimonoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfBimonoids,
        "for a finitely presented algebra",
        [ IsObjectInCategoryOfFpAlgebras ],
        
  function( fp_algebra )
    
    return AffineVarietyOfBimonoids( fp_algebra, rec( ), rec( ) );
    
end );

##
InstallMethod( \/,
        "for a finitely presented bialgebra and a category of internal bimonoids",
        [ IsObjectInCategoryOfFpBialgebras, IsCategoryOfInternalBimonoids ],
        
  function( fp_bialgebra, BimonB )
    local FpBialg_k, triple, Q, MonB, B, monoid, datum, counit, comult,
          FpAlg_k, fp_algebra, trafo, bimonoid;
    
    FpBialg_k := CapCategory( fp_bialgebra );
    
    triple := DefiningTripleOfInternalComonoid( ModelingObject( FpBialg_k, fp_bialgebra ) );
    
    Q := AssociatedQuotientCategoryOfLinearClosureOfPathCategory( fp_bialgebra );
    
    SetAssociatedQuotientCategoryOfLinearClosureOfPathCategory( triple[1], Q );
    
    MonB := AssociatedCategoryOfMonoids( BimonB );
    
    B := UnderlyingCategory( MonB );
    
    monoid := triple[1] / MonB;
    
    datum := ObjectDatum( monoid );
    
    counit := triple[2] / B;
    comult := triple[3] / B;
    
    ## now we need to rewrite comult with respect to
    ## the basis of the tensor square of the algebra consisting of
    ## (decomposable) tensor products of pairs of basis elements of the algebra
    
    FpAlg_k := UnderlyingCategory( FpBialg_k );
    
    fp_algebra := UnderlyingFpAlgebra( fp_bialgebra );
    
    trafo := TransformationExpressingSquareOfMacaulayBasisInMacaulayBasisOfSquare( FpAlg_k, fp_algebra );
    
    bimonoid := ObjectConstructor( BimonB,
                        NTuple( 5,
                                datum[1],
                                datum[2],
                                datum[3],
                                counit,
                                PreCompose( comult, InverseForMorphisms( trafo ) ) ) );
    
    SetUnderlyingFpBialgebra( bimonoid, fp_bialgebra );
    
    SetUnderlyingAlgebra( bimonoid, Q );
    
    return bimonoid;
    
end );

##
InstallMethod( FpBialgebraAsInternalBimonoid,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    local B;
    
    B := UnderlyingCategoryOfMatrices( CapCategory( fp_bialgebra ) );
    
    return fp_bialgebra / CategoryOfBimonoids( B );
    
end );

##
InstallMethod( \.,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids and HasUnderlyingFpBialgebra, IsPosInt ],
        
  function ( bimonoid, string_as_int )
    local name, datum;
    
    name := NameRNam( string_as_int );
    
    datum := ObjectDatum( bimonoid );
    
    if name = "object" then
        return datum[1];
    elif name = "unit" then
        return datum[2];
    elif name = "mult" or name = "multiplication" then
        return datum[3];
    elif name = "counit" then
        return datum[4];
    elif name = "comult" or name = "comultiplication" then
        return datum[5];
    else
        return UnderlyingFpBialgebra( bimonoid ).(name);
    fi;
    
end );

##
InstallMethod( Antipode,
        "for a finitely presented bialgebra and a list",
        [ IsObjectInCategoryOfFpBialgebras, IsList ],
        
  function( fp_bialgebra, antipode_on_generators )
    local fp_algebra;
    
    fp_algebra := UnderlyingFpAlgebra( fp_bialgebra );
    
    ## this is an algebra morphism if the bialgebra is commutative
    return Antipode( fp_algebra, antipode_on_generators );
    
end );

##
InstallMethod( AsMorphismInUnderlyingCategory,
        "for a category of finitely presented bialgebras and a morphism therein",
        [ IsCategoryOfFpBialgebras, IsMorphismInCategoryOfFpBialgebras ],
        
  function( FpBialg_k, fp_bialgebra_morphism )
    local FpAlg_k;
    
    FpAlg_k := UnderlyingCategory( FpBialg_k );
    
    return MorphismConstructor( FpAlg_k,
                   UnderlyingObject( FpBialg_k, Source( fp_bialgebra_morphism ) ),
                   MorphismDatum( FpBialg_k, fp_bialgebra_morphism ),
                   UnderlyingObject( FpBialg_k, Target( fp_bialgebra_morphism ) ) );
    
end );

##
InstallMethod( \/,
        "for a morphism of finitely presented bialgebras and a linear category",
        [ IsMorphismInCategoryOfFpBialgebras, IsCapCategory and IsLinearCategoryOverCommutativeRing and HasCommutativeRingOfLinearCategory ],
        
  function( fp_bialgebra_morphism, B )
    
    return AsMorphismInUnderlyingCategory( CapCategory( fp_bialgebra_morphism ), fp_bialgebra_morphism ) / B;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    local triple;
    
    triple := DefiningTripleOfInternalComonoid( ModelingObject( CapCategory( fp_bialgebra ), fp_bialgebra ) );
    
    return Concatenation(
                   DisplayString( triple[2] ),
                   "\nCounit given by the above morphism\n\n",
                   DisplayString( triple[3] ),
                   "\nComultiplication given by the above morphism\n\n",
                   "A finitely presented bialgebra given by the above data\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of finitely presented bialgebras",
        [ IsMorphismInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra_morphism )
    local q, images;
    
    q := UnderlyingQuiver( AssociatedLinearClosureOfPathCategory( Source( fp_bialgebra_morphism ) ) );
    
    images := MorphismDatum( fp_bialgebra_morphism );
    
    images := Concatenation( "[ ", JoinStringsWithSeparator( List( images, image -> CAP_INTERNAL_EXTRACT_STRING_OF_PATH( q, image ) ), ", " ), " ]\n" );
    
    return Concatenation(
                   DisplayString( Target( fp_bialgebra_morphism ) ),
                   " ^\n |\n",
                   images,
                   " |\n",
                   DisplayString( Source( fp_bialgebra_morphism ) ) );
    
end );
