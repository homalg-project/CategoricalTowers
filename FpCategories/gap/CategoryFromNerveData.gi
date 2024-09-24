# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
InstallMethod( CategoryFromNerveData,
        "for a record",
        [ IsRecord ],
        
  function( input_record )
    local known_keys_with_filters, key, filter, nerve_data, C0, C, prop, V, s, t;
    
    ## check the keys of the given input record
    known_keys_with_filters :=
      rec( name := IsString,
           nerve_data := IsList,
           indices_of_generating_morphisms := IsList,
           decomposition_of_all_morphisms := IsList,
           relations := IsList,
           labels := IsList,
           properties := IsList );
    
    for key in RecNames( input_record ) do
        
        if IsBound( known_keys_with_filters.(key) ) then
            
            filter := known_keys_with_filters.(key);
            
            if not filter( input_record.(key) ) then
                
                # COVERAGE_IGNORE_NEXT_LINE
                Error( "The value of the key `", key, "` must lie in the filter ", filter );
                
            fi;
            
        else
            
            # COVERAGE_IGNORE_NEXT_LINE
            Error( "The following record key is not known to `CategoryFromNerveData`: ", key );
            
        fi;
        
    od;
    
    nerve_data := input_record.nerve_data;
    
    C0 := nerve_data[1][1];
    
    V := CapCategory( C0 );
    
    C := CreateCapCategoryWithDataTypes( input_record.name,
                 IsCategoryFromNerveData,
                 IsObjectInCategoryFromNerveData,
                 IsMorphismInCategoryFromNerveData,
                 IsCapCategoryTwoCell,
                 CapJitDataTypeOfMorphismOfCategory( V ),
                 CapJitDataTypeOfMorphismOfCategory( V ),
                 fail );
    
    SetIsFiniteCategory( C, true );
    
    for prop in input_record.properties do
        
        Setter( ValueGlobal( prop ) )( C, true );
        
    od;
    
    SetIndicesOfGeneratingMorphisms( C, input_record.indices_of_generating_morphisms );
    SetDecompositionIndicesOfAllMorphisms( C, input_record.decomposition_of_all_morphisms );
    SetRelationsAmongGeneratingMorphisms( C, input_record.relations );
    
    C!.labels := input_record.labels;
    
    SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( C, V );
    
    SetNerveData( C, nerve_data );
    
    ## s: C₁ → C₀
    s := nerve_data[2][2];
    
    ## t: C₁ → C₀
    t := nerve_data[2][3];
    
    SetDefiningTripleOfUnderlyingQuiver( C,
            Triple( Length( C0 ),
                    Length( input_record.indices_of_generating_morphisms ),
                    List( input_record.indices_of_generating_morphisms, i -> Pair( s( i ), t( i ) ) ) ) );
    
    C!.compiler_hints :=
      rec( category_attribute_names :=
           [ "NerveData",
             "IndicesOfGeneratingMorphisms",
             "DecompositionIndicesOfAllMorphisms",
             "RelationsAmongGeneratingMorphisms",
             "DefiningTripleOfUnderlyingQuiver",
             ] );
    
    ##
    AddObjectConstructor( C,
      function( C, obj_map )
        
        return CreateCapCategoryObjectWithAttributes( C,
                       MapOfObject, obj_map );
        
    end );
    
    ##
    AddObjectDatum( C,
      function( C, obj )
        
        return MapOfObject( obj );
        
    end );
    
    ##
    AddMorphismConstructor( C,
      function( C, source, mor_map, range )
        
        return CreateCapCategoryMorphismWithAttributes( C,
                       source,
                       range,
                       MapOfMorphism, mor_map );
        
    end );
    
    ##
    AddMorphismDatum( C,
      function( C, mor )
        
        return MapOfMorphism( mor );
        
    end );
    
    ##
    AddSetOfObjectsOfCategory( C,
      function( C )
        
        return List( [ 0 .. Length( NerveData( C )[1][1] ) - 1 ], i -> CreateObject( C, i ) );
        
    end );
    
    ##
    AddSetOfMorphismsOfFiniteCategory( C,
      function( C )
        
        return List( [ 0 .. Length( NerveData( C )[1][2] ) - 1 ], i -> CreateMorphism( C, i ) );
        
    end );
    
    ##
    AddSetOfGeneratingMorphismsOfCategory( C,
     function( C )
        
        return List( IndicesOfGeneratingMorphisms( C ), i -> CreateMorphism( C, i ) );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( C,
      function( C, obj )
        local V, C0, obj_map;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        C0 := NerveData( C )[1][1];
        
        obj_map := ObjectDatum( C, obj );
        
        return IsWellDefinedForMorphisms( V, obj_map ) and
               IsTerminal( V, Source( obj_map ) ) and
               IsEqualForObjects( V, C0, Target( obj_map ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( C,
      function( C, mor )
        local V, C1, mor_map;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        C1 := NerveData( C )[1][2];
        
        mor_map := MorphismDatum( C, mor );
        
        return IsWellDefinedForMorphisms( V, mor_map ) and
               IsTerminal( V, Source( mor_map ) ) and
               IsEqualForObjects( V, C1, Target( mor_map ) );
        
    end );
    
    ##
    AddIsEqualForObjects( C,
      function( C, obj_1, obj_2 )
        local V;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        return IsCongruentForMorphisms( V, ObjectDatum( C, obj_1 ), ObjectDatum( C, obj_2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( C,
      function( C, mor_1, mor_2 )
        local V;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        return IsEqualForMorphisms( V, MorphismDatum( C, mor_1 ), MorphismDatum( C, mor_2 ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( C,
      function( C, mor_1, mor_2 )
        local V;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        return IsCongruentForMorphisms( V, MorphismDatum( C, mor_1 ), MorphismDatum( C, mor_2 ) );
        
    end );
    
    ##
    AddIdentityMorphism( C,
      function( C, obj )
        local V, id;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        id := NerveData( C )[2][1];
        
        return MorphismConstructor( C,
                       obj,
                       PreCompose( V, ObjectDatum( C, obj ), id ),
                       obj );
        
    end );
    
    ##
    AddPreCompose( C,
      function( C, mor_1, mor_2 )
        local V, objs, mors, C2, s, t, ps, pt, mu, DC1xC1, C1xC1, C2_C1xC1, C1xC1_C2, mor_12;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        objs := NerveData( C )[1];
        mors := NerveData( C )[2];
        
        ## C₂
        C2 := objs[3];
        
        ## s: C₁ → C₀
        s := mors[2];
        
        ## t: C₁ → C₀
        t := mors[3];
        
        ## pₛ: C₂ → C₁
        ps := mors[6];
        
        ## pₜ: C₂ → C₁
        pt := mors[7];
        
        ## μ: C₂ → C₁
        mu := mors[8];
        
        DC1xC1 := [ t, s ];
        
        ## C₁ ×ₜₛ C₁
        C1xC1 := FiberProduct( V,
                         DC1xC1 );
        
        ## C₂ → C₁ ×ₜₛ C₁
        C2_C1xC1 := UniversalMorphismIntoFiberProductWithGivenFiberProduct( V,
                            DC1xC1,
                            C2,
                            [ ps, pt ],
                            C1xC1 );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsIsomorphism( V, C2_C1xC1 ) ); # the first condition for the simplicial set to be the nerve of a category
        
        ## C₁ ×ₜₛ C₁ → C₂
        C1xC1_C2 := InverseForMorphisms( V,
                            C2_C1xC1 );
        
        ## 1 → C₁ ×ₜₛ C₁ → C₂
        mor_12 := PreCompose( V,
                          UniversalMorphismIntoFiberProductWithGivenFiberProduct( V,
                                  DC1xC1,
                                  TerminalObject( V ),
                                  [ MorphismDatum( C, mor_1 ), MorphismDatum( C, mor_2 ) ],
                                  C1xC1 ),
                          C1xC1_C2 );
        
        return MorphismConstructor( C,
                       Source( mor_1 ),
                       PreCompose( V, mor_12, mu ),
                       Target( mor_2 ) );
        
    end );
    
    Assert( 0, IsIdenticalObj( V, RangeCategoryOfHomomorphismStructure( V ) ) );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( C,
      function( C )
        
        return DistinguishedObjectOfHomomorphismStructure( RangeCategoryOfHomomorphismStructure( C ) );
        
    end );
    
    ##
    AddHomomorphismStructureOnObjects( C,
      function( C, obj_1, obj_2 )
        local V, mors, s, t, Hom_o1_C, Hom_C_o2;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        mors := NerveData( C )[2];
        
        s := mors[2];
        t := mors[3];
        
        Hom_o1_C := ProjectionInFactorOfFiberProduct( V,
                            [ s, ObjectDatum( C, obj_1 ) ],
                            1 );
        
        Hom_C_o2 := ProjectionInFactorOfFiberProduct( V,
                            [ t, ObjectDatum( C, obj_2 ) ],
                            1 );
        
        return FiberProduct( V,
                       [ Hom_o1_C, Hom_C_o2 ] );
        
    end );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( C,
      function( C, source, phi_1, phi_2, range )
        local V, objs, mors, C2, s, t, ps, pt, mu, DC1xC1, C1xC1, C2_C1xC1, C1xC1_C2,
              DC3, C3, p12, p23, pss, ptt, mux1, mumu, Hom_r1_s2, Hom_s1_r2,
              phi_1xC2, C2xphi_2, iota;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        objs := NerveData( C )[1];
        mors := NerveData( C )[2];
        
        ## C₂
        C2 := objs[3];
        
        ## s: C₁ → C₀
        s := mors[2];
        
        ## t: C₁ → C₀
        t := mors[3];
        
        ## pₛ: C₂ → C₁
        ps := mors[6];
        
        ## pₜ: C₂ → C₁
        pt := mors[7];
        
        ## μ: C₂ → C₁
        mu := mors[8];
        
        DC1xC1 := [ t, s ];
        
        ## C₁ ×ₜₛ C₁
        C1xC1 := FiberProduct( V,
                         DC1xC1 );
        
        ## C₂ → C₁ ×ₜₛ C₁
        C2_C1xC1 := UniversalMorphismIntoFiberProductWithGivenFiberProduct( V,
                            DC1xC1,
                            C2,
                            [ ps, pt ],
                            C1xC1 );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsIsomorphism( V, C2_C1xC1 ) ); # the first condition for the simplicial set to be the nerve of a category
        
        ## C₁ ×ₜₛ C₁ → C₂
        C1xC1_C2 := InverseForMorphisms( V,
                            C2_C1xC1 );
        
        ## (pₜ, pₛ)
        DC3 := [ pt, ps ];
        
        ## C₃
        C3 := FiberProduct( V,
                      DC3 );
        
        ## p₁₂: C₃ → C₂
        p12 := ProjectionInFactorOfFiberProductWithGivenFiberProduct( V,
                       DC3,
                       1,
                       C3 );
        
        ## p₂₃: C₃ → C₂
        p23 := ProjectionInFactorOfFiberProductWithGivenFiberProduct( V,
                       DC3,
                       2,
                       C3 );
        
        ## pₛₛ: C₃ → C₂
        pss := PreCompose( V, p12, ps );
        
        ## pₜₜ: C₃ → C₂
        ptt := PreCompose( V, p23, pt );
        
        ## μ × 1: C₃ →  C₁ ×ₜₛ C₁ → C₂
        mux1 := PreCompose( V,
                        UniversalMorphismIntoFiberProductWithGivenFiberProduct( V,
                                DC1xC1,
                                C3,
                                [ PreCompose( V, p12, mu ),
                                  ptt ],
                                C1xC1 ),
                        C1xC1_C2 );
        
        ## μμ: C₃ → C₁
        mumu := PreCompose( V, mux1, mu );
        
        ## Hom(r₁,s₂) ↪ C₁
        Hom_r1_s2 := MorphismFromFiberProductToSinkWithGivenFiberProduct( V,
                             [ ProjectionInFactorOfFiberProduct( V,
                                     [ s, ObjectDatum( C, Target( phi_1 ) ) ],
                                     1 ),
                               ProjectionInFactorOfFiberProduct( V,
                                     [ t, ObjectDatum( C, Source( phi_2 ) ) ],
                                       1 ) ],
                             source );
        
        ## Hom(s₁,r₂) ↪ C₁
        Hom_s1_r2 := MorphismFromFiberProductToSinkWithGivenFiberProduct( V,
                             [ ProjectionInFactorOfFiberProduct( V,
                                     [ s, ObjectDatum( C, Source( phi_1 ) ) ],
                                     1 ),
                               ProjectionInFactorOfFiberProduct( V,
                                     [ t, ObjectDatum( C, Target( phi_2 ) ) ],
                                     1 ) ],
                             range );
        
        ## {φ₁} ×ₜₛ Hom(r₁,-) ×ₜₛ Hom(-,-) ↪ C₃
        phi_1xC2 := ProjectionInFactorOfFiberProduct( V,
                            [ pss, MorphismDatum( C, phi_1 ) ],
                            1 );
        
        ## Hom(-,-) ×ₜₛ Hom(-,s₂) ×ₜₛ {φ₂} ↪ C₃
        C2xphi_2 := ProjectionInFactorOfFiberProduct( V,
                            [ ptt, MorphismDatum( C, phi_2 ) ],
                            1 );
        
        ## ι: {φ₁} ×ₜₛ Hom(r₁,s₂) ×ₜₛ {φ₂} ↪ C₃ → C₁
        iota := PreCompose( V,
                        MorphismFromFiberProductToSink( V,
                                [ phi_1xC2, C2xphi_2 ] ),
                        mumu );
        
        ## {φ₁} ×ₜₛ Hom(r₁,s₂) ×ₜₛ {φ₂} → Hom(s₁,r₂)
        return LiftAlongMonomorphism( V,
                       Hom_s1_r2,
                       iota );
        
    end );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( C,
      function( C, mor )
        local V, mors, s, t, Hom_o1_C, Hom_C_o2, Hom_o1_o2;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        mors := NerveData( C )[2];
        
        s := mors[2];
        t := mors[3];
        
        Hom_o1_C := ProjectionInFactorOfFiberProduct( V,
                            [ s, ObjectDatum( C, Source( mor ) ) ],
                            1 );
        
        Hom_C_o2 := ProjectionInFactorOfFiberProduct( V,
                            [ t, ObjectDatum( C, Target( mor ) ) ],
                            1 );
        
        Hom_o1_o2 :=  MorphismFromFiberProductToSink( V,
                              [ Hom_o1_C, Hom_C_o2 ] );
        
        return LiftAlongMonomorphism( V,
                       Hom_o1_o2,
                       MorphismDatum( C, mor ) );
        
    end );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
      function( C, obj_1, obj_2, mor )
        local V, mors, s, t, Hom_o1_C, Hom_C_o2, Hom_o1_o2;
        
        V := RangeCategoryOfHomomorphismStructure( C );
        
        mors := NerveData( C )[2];
        
        s := mors[2];
        t := mors[3];
        
        Hom_o1_C := ProjectionInFactorOfFiberProduct( V,
                            [ s, ObjectDatum( C, obj_1 ) ],
                            1 );
        
        Hom_C_o2 := ProjectionInFactorOfFiberProduct( V,
                            [ t, ObjectDatum( C, obj_2 ) ],
                            1 );
        
        Hom_o1_o2 :=  MorphismFromFiberProductToSink( V,
                              [ Hom_o1_C, Hom_C_o2 ] );
        
        return MorphismConstructor( C,
                       obj_1,
                       PreCompose( V,
                               mor,
                               Hom_o1_o2 ),
                       obj_2 );
        
    end );
    
    #if false then
    if ValueOption( "no_precompiled_code" ) <> true then
        
        ADD_FUNCTIONS_FOR_CategoryFromNerveDataPrecompiled( C );
        ADD_FUNCTIONS_FOR_CategoryFromNerveDataHomStructureOnMorphismsPrecompiled( C );
        
    fi;
    
    Finalize( C );
    
    return C;
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a category from nerve data",
        [ IsCategoryFromNerveData ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a category from nerve data",
        [ IsCategoryFromNerveData ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallMethod( Size,
        "for a category from nerve data",
        [ IsCategoryFromNerveData ],
        
  function( C )
    
    return Length( NerveData( C )[1][2] );
    
end );

##
InstallMethodForCompilerForCAP( CreateObject,
        "for a category from nerve data and an integer",
        [ IsCategoryFromNerveData, IsInt ],
        
  function( C, o )
    local V, C0, obj_map;
    
    V := RangeCategoryOfHomomorphismStructure( C );
    
    C0 := NerveData( C )[1][1];
    
    obj_map := MorphismConstructor( V,
                       DistinguishedObjectOfHomomorphismStructure( C ),
                       [ o ],
                       C0 );
    
    return ObjectConstructor( C, obj_map );
    
end );

##
InstallMethod( \/,
        "for an integer and a category from nerve data",
        [ IsInt, IsCategoryFromNerveData ],
        
  function( o, C )
    
    return CreateObject( C, o );
    
end );

##
InstallMethodForCompilerForCAP( CreateMorphism,
        "for two objects in a category from nerve data and an integer",
        [ IsObjectInCategoryFromNerveData, IsInt, IsObjectInCategoryFromNerveData ],
        
  function( source, m, range )
    local C, V, C1, mor_map;
    
    C := CapCategory( source );
    
    V := RangeCategoryOfHomomorphismStructure( C );
    
    C1 := NerveData( C )[1][2];
    
    mor_map := MorphismConstructor( V,
                       DistinguishedObjectOfHomomorphismStructure( C ),
                       [ m ],
                       C1 );
    
    return MorphismConstructor( C,
                   source,
                   mor_map,
                   range );
    
end );

##
InstallMethodForCompilerForCAP( CreateMorphism,
        "for a category from nerve data and an integer",
        [ IsCategoryFromNerveData, IsInt ],
        
  function( C, m )
    local mors, s, t;
    
    mors := NerveData( C )[2];
    
    s := mors[2];
    t := mors[3];
    
    return CreateMorphism(
                   CreateObject( C, s( m ) ),
                   m,
                   CreateObject( C, t( m ) ) );
    
end );

##
InstallMethod( \.,
        "for a category from nerve data and a positive integer",
        [ IsCategoryFromNerveData, IsPosInt ],
        
  function( C, string_as_int )
    local name, labels;
    
    name := NameRNam( string_as_int );
    
    labels := C!.labels;
    
    if name in labels[1] then
        return CreateObject( C, -1 + SafePosition( labels[1], name ) );
    elif name in labels[2] then
        return CreateMorphism( C, IndicesOfGeneratingMorphisms( C )[SafePosition( labels[2], name )] );
    elif name[1] in [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ] then
        return CreateMorphism( C, Int( name ) );
    fi;
    
    Error( "no object or morphism of name ", name, "\n" );
    
end );

##
InstallMethod( OppositeNerveData,
        "for a list",
        [ IsList ],
        
  function( nerve_data )
    local objs, mors, C1, C2, V,
          id, s, t, is, it, ps, pt, mu,
          DC1_sxt_C1, C1_sxt_C1, pi_s, pi_t, C2_C1_sxt_C1,
          DC1_txs_C1, C1_txs_C1, C2_C1_txs_C1,
          C1_sxt_C1_C1_txs_C1, C1_txs_C1_C2, mu_op;
    
    objs := nerve_data[1];
    mors := nerve_data[2];
    
    C1 := objs[2];
    C2 := objs[3];
    
    V := CapCategory( C2 );
    
    id := mors[1];
    s := mors[2];
    t := mors[3];
    is := mors[4];
    it := mors[5];
    ps := mors[6];
    pt := mors[7];
    mu := mors[8];
    
    DC1_sxt_C1 := [ s, t ];
    
    ## C₁ ×ₛₜ C₁
    C1_sxt_C1 := FiberProduct( V,
                         DC1_sxt_C1 );
    
    ## C₂ → C₁ ×ₛₜ C₁
    C2_C1_sxt_C1 := UniversalMorphismIntoFiberProductWithGivenFiberProduct( V,
                            DC1_sxt_C1,
                            C2,
                            [ pt, ps ],
                            C1_sxt_C1 );
    
    ## πₛ: C₁ ×ₛₜ C₁ → C₁
    pi_s := ProjectionInFactorOfFiberProductWithGivenFiberProduct( V,
                    DC1_sxt_C1,
                    1,
                    C1_sxt_C1 );
    
    ## πₜ: C₁ ×ₛₜ C₁ → C₁
    pi_t := ProjectionInFactorOfFiberProductWithGivenFiberProduct( V,
                    DC1_sxt_C1,
                    2,
                    C1_sxt_C1 );
    
    DC1_txs_C1 := [ t, s ];
    
    ## C₁ ×ₜₛ C₁
    C1_txs_C1 := FiberProduct( V,
                         DC1_txs_C1 );
    
    ## C₁ ×ₛₜ C₁ → C₁ ×ₜₛ C₁
    C1_sxt_C1_C1_txs_C1 := UniversalMorphismIntoFiberProductWithGivenFiberProduct( V,
                                   DC1_txs_C1,
                                   C1_sxt_C1,
                                   [ pi_t, pi_s ],
                                   C1_txs_C1 );
    
    ## C₂ → C₁ ×ₜₛ C₁
    C2_C1_txs_C1 := UniversalMorphismIntoFiberProductWithGivenFiberProduct( V,
                            DC1_txs_C1,
                            C2,
                            [ ps, pt ],
                            C1_txs_C1 );
    
    ## C₁ ×ₜₛ C₁ → C₂
    C1_txs_C1_C2 := InverseForMorphisms( V,
                            C2_C1_txs_C1 );
    
    ## C₂ → C₁ ×ₛₜ C₁ → C₁ ×ₜₛ C₁ → C₂ → C₁
    mu_op := PreComposeList( V,
                     C2,
                     [ C2_C1_sxt_C1,
                       C1_sxt_C1_C1_txs_C1,
                       C1_txs_C1_C2,
                       mu ],
                     C1 );
    
    return Pair( objs,
                 NTuple( 8,
                         id,
                         t,
                         s,
                         it,
                         is,
                         pt,
                         ps,
                         mu_op ) );
    
end );

##
InstallMethod( OppositeCategoryFromNerveData,
        "for a category from nerve data",
        [ IsCategoryFromNerveData ],
        
  function( C )
    local Cop, C_op;
    
    Cop := CategoryFromNerveData(
                   rec( name := Concatenation( "Opposite( ", Name( C ), " )" ),
                        ## the following nerve data is not "normalized", as it is not the result of the method NerveTruncatedInDegree2Data:
                        nerve_data := OppositeNerveData( NerveData( C ) ),
                        indices_of_generating_morphisms := IndicesOfGeneratingMorphisms( C ),
                        decomposition_of_all_morphisms := TransposedMat( List( DecompositionIndicesOfAllMorphisms( C ), s -> List( s, t -> List( t, Reversed ) ) ) ),
                        relations := List( RelationsAmongGeneratingMorphisms( C ), pair -> Pair( Reversed( pair[1] ), Reversed( pair[2] ) ) ),
                        labels := C!.labels,
                        properties := ListKnownCategoricalProperties( Opposite( C ) ) ) );
    
    Assert( 0, IsIdenticalObj( IndicesOfGeneratingMorphisms( Cop ), IndicesOfGeneratingMorphisms( C ) ) );
    
    ## now construct the "normalized" opposite category
    C_op := CategoryFromNerveData(
                    rec( name := Name( Cop ),
                         ## now the "normalized" data tables
                         nerve_data := NerveTruncatedInDegree2Data( Cop ),
                         indices_of_generating_morphisms := IndicesOfGeneratingMorphismsFromHomStructure( Cop ),
                         decomposition_of_all_morphisms := DecompositionIndicesOfAllMorphisms( Cop ),
                         relations := RelationsAmongGeneratingMorphisms( Cop ),
                         labels := Cop!.labels,
                         properties := ListKnownCategoricalProperties( Cop ) ) );
    
    SetOppositeCategoryFromNerveData( C_op, C );
    
    return C_op;
    
end );

##
InstallMethod( DataTablesOfCategory,
        "for a category from nerve data",
        [ IsCategoryFromNerveData ],
        
  function( C )
    local V, T, nerve_data, objs, mors, C0, C1, s, t,
          identity_data,
          precompose, precompose_data,
          hom_on_objs, hom_on_objs_data,
          hom_on_mors, hom_on_mors_data,
          introduction, introduction_data,
          elimination, elimination_data;
    
    V := RangeCategoryOfHomomorphismStructure( C );
    
    T := DistinguishedObjectOfHomomorphismStructure( C );
    
    nerve_data := NerveData( C );
    
    objs := nerve_data[1];
    mors := nerve_data[2];
    
    C0 := objs[1];
    C1 := objs[2];
    
    s := mors[2];
    t := mors[3];
    
    identity_data := AsList( mors[1] );
    
    precompose :=
      function( i, j )
        
        if not t( i ) = s( j ) then
            return -1;
        fi;
        
        return MorphismDatum( C,
                       PreCompose( C,
                               CreateMorphism( C, i ),
                               CreateMorphism( C, j ) ) )( 0 );
        
    end;
    
    precompose_data :=
      List( [ 0 .. Length( C1 ) - 1 ], i ->
            List( [ 0 .. Length( C1 ) - 1 ], j ->
                  precompose( i, j ) ) );
    
    hom_on_objs :=
      function( i, j )
        
        return ObjectDatum( V,
                       HomomorphismStructureOnObjects( C,
                               CreateObject( C, i ),
                               CreateObject( C, j ) ) );
        
    end;
    
    hom_on_objs_data :=
      List( [ 0 .. Length( C0 ) - 1 ], i ->
            List( [ 0 .. Length( C0 ) - 1 ], j ->
                  hom_on_objs( i, j ) ) );
    
    hom_on_mors :=
      function( i, j )
        
        return MorphismDatum( V,
                       HomomorphismStructureOnMorphisms( C,
                               CreateMorphism( C, i ),
                               CreateMorphism( C, j ) ) );
        
    end;
    
    hom_on_mors_data :=
      List( [ 0 .. Length( C1 ) - 1 ], i ->
            List( [ 0 .. Length( C1 ) - 1 ], j ->
                  hom_on_mors( i, j ) ) );
    
    introduction :=
      function( i )
        
        return MorphismDatum( V,
                       InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( C,
                               CreateMorphism( C, i ) ) );
        
    end;
    
    introduction_data :=
      List( [ 0 .. Length( C1 ) - 1 ], i ->
            introduction( i ) );
    
    elimination :=
      function( i, j, k )
        
        return MorphismDatum( C,
                       InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
                               CreateObject( C, i ),
                               CreateObject( C, j ),
                               MorphismConstructor( V,
                                       T,
                                       [ k ],
                                       ObjectConstructor( V,
                                               hom_on_objs( i, j ) ) ) ) )( 0 );
        
    end;
    
    elimination_data :=
      List( [ 0 .. Length( C0 ) - 1 ], i ->
            List( [ 0 .. Length( C0 ) - 1 ], j ->
                  List( [ 0 .. hom_on_objs( i, j ) - 1 ], k ->
                  elimination( i, j, k ) ) ) );
    
    return Pair( Pair(
                   Length( C0 ),
                   Length( C1 ) ),
                 NTuple( 8,
                         identity_data,
                         AsList( s ),
                         AsList( t ),
                         precompose_data,
                         hom_on_objs_data,
                         hom_on_mors_data,
                         introduction_data,
                         elimination_data ) );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewString,
        "for an object in a category from nerve data",
        [ IsObjectInCategoryFromNerveData ],
        
  function( obj )
    
    return Concatenation( "<(", CapCategory( obj )!.labels[1][1 + MapOfObject( obj )( 0 )], ")>" );
    
end );

##
InstallMethod( ViewString,
        "for a morphism in a category from nerve data",
        [ IsMorphismInCategoryFromNerveData ],
        
  function( mor )
    local C, labels, s, t, i, pos;
    
    C := CapCategory( mor );
    
    labels := C!.labels;
    
    s := MapOfObject( Source( mor ) )( 0 );
    t := MapOfObject( Target( mor ) )( 0 );
    
    i := MapOfMorphism( mor )( 0 );
    
    pos := Position( IndicesOfGeneratingMorphisms( C ), i );
    
    if IsInt( pos ) then
        pos := labels[2][pos];
    else
        pos := Position( AsList( NerveTruncatedInDegree2Data( C )[2][1] ), i );
        if IsInt( pos ) then
            pos := labels[1][pos];
        else
            pos := JoinStringsWithSeparator(
                           List( DecompositionIndicesOfAllMorphisms( C )[1+t, 1+s][1 + HomStructure( mor )(0)], i -> labels[2][1 + i] ),
                           "⋅" );
        fi;
    fi;
    
    return Concatenation(
                   "(", labels[1][1 + s], ")",
                   "-[(", pos, ")]-≻",
                   "(", labels[1][1 + t], ")" );
    
end );

##
InstallMethod( PrintObj,
        "for an object in a category from nerve data",
        [ IsObjectInCategoryFromNerveData ],
        
  function( obj )
    
    ViewObj( obj );
    Print( "\n" );
    
end );

##
InstallMethod( PrintObj,
        "for a morphism in a category from nerve data",
        [ IsMorphismInCategoryFromNerveData ],
        
  function( mor )
    
    ViewObj( mor );
    Print( "\n" );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a category from nerve data",
        [ IsObjectInCategoryFromNerveData ],
        
  function( obj )
    
    return Concatenation( ViewString( obj ), "\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in a category from nerve data",
        [ IsMorphismInCategoryFromNerveData ],
        
  function( mor )
    
    return Concatenation( ViewString( mor ), "\n" );
    
end );

##
InstallMethod( LaTeXOutput,
        "for an object in a category from nerve data",
        [ IsObjectInCategoryFromNerveData ],
        
  function( obj )
    
    return String( MapOfObject( obj )( 0 ) );
    
end );

##
InstallMethod( LaTeXOutput,
        "for a morphism in a category from nerve data",
        [ IsMorphismInCategoryFromNerveData ],
        
  function( mor )
    local s;
    
    s := String( MapOfMorphism( mor )( 0 ) );
    
    if ValueOption( "OnlyDatum" ) = true then
        
        return s;
        
    fi;
    
    return Concatenation(
                   "{", LaTeXOutput( Source( mor ) ), "}",
                   "-\\left[{", s, "}\\right]\\rightarrow",
                   "{", LaTeXOutput( Target( mor ) ), "}" );
    
end );
