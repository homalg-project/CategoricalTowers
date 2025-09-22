# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethodForCompilerForCAP( LeftUnitLawOfMonoid,
        "for a symmetric monoidal category, one object, and two morphisms therein",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( B, object, unit, mult )
    local lhs_left_unit, rhs_left_unit, bool, obstruction;
    
    lhs_left_unit := PreCompose( B,
                             TensorProductOnMorphisms( B,
                                     unit, IdentityMorphism( B, object ) ),
                             mult );
    
    rhs_left_unit := LeftUnitor( B, object );
    
    bool := IsCongruentForMorphisms( B, lhs_left_unit, rhs_left_unit );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    obstruction := ValueOption( "obstruction" );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not bool and not obstruction = fail then
        Add( obstruction, Pair( Pair( lhs_left_unit, rhs_left_unit ), "LeftUnitLawOfMonoid" ) );
        return true;
    fi;
    
    return bool;
    
end );

##
InstallMethodForCompilerForCAP( RightUnitLawOfMonoid,
        "for a symmetric monoidal category, one object, and two morphisms therein",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( B, object, unit, mult )
    local lhs_right_unit, rhs_right_unit, bool, obstruction;
    
    lhs_right_unit := PreCompose( B,
                             TensorProductOnMorphisms( B,
                                     IdentityMorphism( B, object ), unit ),
                             mult );
    
    rhs_right_unit := RightUnitor( B, object );
    
    bool := IsCongruentForMorphisms( B, lhs_right_unit, rhs_right_unit );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    obstruction := ValueOption( "obstruction" );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not bool and not obstruction = fail then
        Add( obstruction, Pair( Pair( lhs_right_unit, rhs_right_unit ), "RightUnitLawOfMonoid" ) );
        return true;
    fi;
    
    return bool;
    
end );

##
InstallMethodForCompilerForCAP( AssociativitiyLawOfMonoid,
        "for a symmetric monoidal category, an object, and a morphism therein",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism ],
        
  function( B, object, mult )
    local lhs_associativity, rhs_associativity, bool, obstruction;

    lhs_associativity := PreCompose( B,
                                 PreCompose( B,
                                         AssociatorLeftToRight( B, object, object, object ),
                                         TensorProductOnMorphisms( B, IdentityMorphism( B, object ), mult ) ),
                                 mult );
    
    rhs_associativity := PreCompose( B,
                                 TensorProductOnMorphisms( B, mult, IdentityMorphism( B, object ) ),
                                 mult );
    
    bool := IsCongruentForMorphisms( B, lhs_associativity, rhs_associativity );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    obstruction := ValueOption( "obstruction" );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not bool and not obstruction = fail then
        Add( obstruction, Pair( Pair( lhs_associativity, rhs_associativity ), "AssociativitiyLawOfMonoid" ) );
        return true;
    fi;
    
    return bool;
    
end );

##
InstallMethodForCompilerForCAP( UnitLawOfMonoidMorphism,
        "for a symmetric monoidal category and three morphisms therein",
        [ IsMonoidalCategory, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( B, unit_of_source, unit_of_target, morphism )
    local lhs_preserves_unit, rhs_preserves_unit, bool, obstruction;
    
    lhs_preserves_unit := PreCompose( B, unit_of_source, morphism );
    
    rhs_preserves_unit := unit_of_target;
    
    bool := IsCongruentForMorphisms( B, lhs_preserves_unit, rhs_preserves_unit );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    obstruction := ValueOption( "obstruction" );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not bool and not obstruction = fail then
        Add( obstruction, Pair( Pair( lhs_preserves_unit, rhs_preserves_unit ), "UnitLawOfMonoidMorphism" ) );
        return true;
    fi;
    
    return bool;
    
end );

##
InstallMethodForCompilerForCAP( MultiplicativelyLawOfMonoidMorphism,
        "for a symmetric monoidal category and three morphisms therein",
        [ IsMonoidalCategory, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( B, mult_of_source, mult_of_target, morphism )
    local lhs_preserves_mult, rhs_preserves_mult, bool, obstruction;
    
    lhs_preserves_mult := PreCompose( B, TensorProductOnMorphisms( B, morphism, morphism ), mult_of_target );
    
    rhs_preserves_mult := PreCompose( B, mult_of_source, morphism );
    
    bool := IsCongruentForMorphisms( B, lhs_preserves_mult, rhs_preserves_mult );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    obstruction := ValueOption( "obstruction" );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not bool and not obstruction = fail then
        Add( obstruction, Pair( Pair( lhs_preserves_mult, rhs_preserves_mult ), "MultiplicativelyLawOfMonoidMorphism" ) );
        return true;
    fi;
    
    return bool;
    
end );

##
InstallMethod( CATEGORY_OF_MONOIDS,
        "for a monoidal category",
        [ IsCapCategory and IsMonoidalCategory ],
        
  FunctionWithNamedArguments(
  [ [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, B )
    local name, object_datum_type, morphism_datum_type, MonB, cart, add, sym;
    
    ##
    name := Concatenation( "CategoryOfMonoids( ", Name( B ), " )" );
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 3,
              CapJitDataTypeOfObjectOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ) );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( B );
    
    ##
    MonB :=
      CreateCapCategoryWithDataTypes( name,
              IsCategoryOfInternalMonoids,
              IsObjectInCategoryOfInternalMonoids,
              IsMorphismInCategoryOfInternalMonoids,
              IsCapCategoryTwoCell,
              object_datum_type,
              morphism_datum_type,
              fail );
    
    if IsBound( B!.supports_empty_limits ) and B!.supports_empty_limits = true then
        MonB!.supports_empty_limits := true;
    fi;
    
    SetUnderlyingCategory( MonB, B );
    
    MonB!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingCategory",
             ] );
    
    cart := HasIsCartesianCategory( B ) and IsCartesianCategory( B ) and
            HasIsSymmetricMonoidalCategoryStructureGivenByDirectProduct( B ) and IsSymmetricMonoidalCategoryStructureGivenByDirectProduct( B );
    
    add := HasIsAdditiveMonoidalCategory( B ) and IsAdditiveMonoidalCategory( B );
    
    if cart or add then
        SetIsCartesianCategory( MonB, true );
    fi;
    
    sym := HasIsSymmetricMonoidalCategory( B ) and IsSymmetricMonoidalCategory( B );
    
    if sym then
        SetIsCategoryWithInitialObject( MonB, true );
        SetIsSymmetricMonoidalCategory( MonB, true );
    fi;
    
    ##
    AddObjectConstructor( MonB,
      function( MonB, triple_of_object_unit_multiplication )
        
        return CreateCapCategoryObjectWithAttributes( MonB,
                       DefiningTripleOfInternalMonoid, triple_of_object_unit_multiplication );
        
    end );
    
    ##
    AddObjectDatum( MonB,
      function( MonB, monoid )
        
        return DefiningTripleOfInternalMonoid( monoid );
        
    end );
    
    ##
    AddMorphismConstructor( MonB,
      function( MonB, source, morphism, target )
        
        return CreateCapCategoryMorphismWithAttributes( MonB,
                       source,
                       target,
                       UnderlyingMorphism, morphism );
        
    end );
    
    ##
    AddMorphismDatum( MonB,
      function( MonB, monoid_morphism )
        
        return UnderlyingMorphism( monoid_morphism );
        
    end );
    
    ##
    AddIsEqualForObjects( MonB,
      function( MonB, object1, object2 )
        local B, triple1, triple2;
        
        B := UnderlyingCategory( MonB );
        
        triple1 := ObjectDatum( MonB, object1 );
        triple2 := ObjectDatum( MonB, object2 );
        
        return IsEqualForObjects( B, triple1[1], triple2[1] ) and
               IsCongruentForMorphisms( B, triple1[2], triple2[2] ) and
               IsCongruentForMorphisms( B, triple1[3], triple2[3] );
        
    end );
    
    ##
    AddIsEqualForMorphisms( MonB,
      function( MonB, morphism1, morphism2 )
        
        return IsEqualForMorphisms( UnderlyingCategory( MonB ),
                       MorphismDatum( MonB, morphism1 ),
                       MorphismDatum( MonB, morphism2 ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( MonB,
      function( MonB, morphism1, morphism2 )
        
        return IsCongruentForMorphisms( UnderlyingCategory( MonB ),
                       MorphismDatum( MonB, morphism1 ),
                       MorphismDatum( MonB, morphism2 ) );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( MonB,
      function( MonB, monoid )
        local B, triple, object, unit, mult;
        
        B := UnderlyingCategory( MonB );
        
        triple := ObjectDatum( MonB, monoid );
        
        object := triple[1];
        unit := triple[2];
        mult := triple[3];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        if IsBound( monoid!.tensorands ) and IsList( monoid!.tensorands ) and Length( monoid!.tensorands ) = 2 then
            return IsWellDefinedForObjects( MonB, monoid!.tensorands[1] ) and
                   IsWellDefinedForObjects( MonB, monoid!.tensorands[2] );
        fi;
        
        return IsWellDefinedForObjects( B, object ) and
               IsWellDefinedForMorphisms( B, unit ) and
               IsWellDefinedForMorphisms( B, mult ) and
               IsEqualForObjects( B, Source( unit ), TensorUnit( B ) ) and
               IsEqualForObjects( B, Target( unit ), object ) and
               IsEqualForObjects( B, Target( mult ), object ) and
               IsEqualForObjects( B, Source( mult ), TensorProductOnObjects( B, object, object ) ) and
               LeftUnitLawOfMonoid( B, object, unit, mult ) and
               RightUnitLawOfMonoid( B, object, unit, mult ) and
               AssociativitiyLawOfMonoid( B, object, mult );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( MonB,
      function( MonB, monoid_morphism )
        local B, morphism, triple_of_source, triple_of_target,
              object_of_source, unit_of_source, mult_of_source, object_of_target, unit_of_target, mult_of_target,
              lhs_preserves_unit, rhs_preserves_unit, lhs_preserves_mult, rhs_preserves_mult;
        
        B := UnderlyingCategory( MonB );
        
        morphism := MorphismDatum( MonB, monoid_morphism );
        
        triple_of_source := ObjectDatum( MonB, Source( monoid_morphism ) );
        triple_of_target := ObjectDatum( MonB, Target( monoid_morphism ) );
        
        object_of_source := triple_of_source[1];
        unit_of_source := triple_of_source[2];
        mult_of_source := triple_of_source[3];
        
        object_of_target := triple_of_target[1];
        unit_of_target := triple_of_target[2];
        mult_of_target := triple_of_target[3];
        
        return IsEqualForObjects( B, Source( morphism ), object_of_source ) and
               IsEqualForObjects( B, Target( morphism ), object_of_target ) and
               IsWellDefinedForMorphisms( B, morphism ) and
               UnitLawOfMonoidMorphism( B, unit_of_source, unit_of_target, morphism ) and
               MultiplicativelyLawOfMonoidMorphism( B, mult_of_source, mult_of_target, morphism );
        
    end );
    
    ##
    AddIdentityMorphism( MonB,
      function( MonB, object )
        local B;
        
        B := UnderlyingCategory( MonB );
        
        return MorphismConstructor( MonB,
                       object,
                       IdentityMorphism( B,
                               ObjectDatum( MonB, object )[1] ),
                       object );
        
    end );
    
    ##
    AddPreCompose( MonB,
      function( MonB, pre_morphism, post_morphism )
        local B;
        
        B := UnderlyingCategory( MonB );
        
        return MorphismConstructor( MonB,
                       Source( pre_morphism ),
                       PreCompose( B,
                               MorphismDatum( MonB, pre_morphism ),
                               MorphismDatum( MonB, post_morphism ) ),
                       Target( post_morphism ) );
        
    end );
    
    ##
    AddIsIsomorphism( MonB,
      function( MonB, monoid_morphism )
        local B;
        
        B := UnderlyingCategory( MonB );
        
        return IsIsomorphism( B,
                       MorphismDatum( MonB,
                               monoid_morphism ) );
        
    end );
    
    ##
    AddInverseForMorphisms( MonB,
      function( MonB, monoid_morphism )
        local B;
        
        B := UnderlyingCategory( MonB );
        
        return MorphismConstructor( MonB,
                       Target( monoid_morphism ),
                       InverseForMorphisms( B,
                               MorphismDatum( MonB,
                                       monoid_morphism ) ),
                       Source( monoid_morphism ) );
        
    end );
    
    ##
    if cart and IsEmpty( MissingOperationsForConstructivenessOfCategory( B, "IsCartesianCategory" ) ) then
        
        ##
        AddDirectProduct( MonB,
          function( MonB, monoids )
            local B, U, l, factors, units, mults, product, unit, source_diagram, target_diagram, ids, perm, mult;
            
            B := UnderlyingCategory( MonB );
            
            U := TensorUnit( B );
            
            l := Length( factors );
            
            factors := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[1] );
            units := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[2] );
            mults := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[3] );
            
            product := DirectProduct( B, factors );
            
            unit := PreCompose( B,
                            CartesianDiagonal( B,
                                    U,
                                    l ),
                            DirectProductFunctorial( B,
                                    units ) );
            
            source_diagram := Concatenation( factors, factors );
            target_diagram := Concatenation( List( factors, factor -> [ factor, factor ] ) );
            
            ids := List( factors, factor -> IdentityMorphism( B, factor ) );
            perm := Concatenation( List( [ 0 .. l - 1 ], i -> 2 * i ), List( [ 0 .. l - 1 ], i -> 2 * i + 1 ) );
            
            mult := PreCompose( B,
                            MorphismBetweenDirectProducts( B,
                                    source_diagram,
                                    Pair( perm,
                                          Concatenation( ids, ids ) ),
                                    target_diagram ),
                            DirectProductFunctorial( B,
                                    mults ) );
            
            return ObjectConstructor( MonB,
                           Triple( product,
                                   unit,
                                   mult ) );
            
        end );
        
        ##
        AddProjectionInFactorOfDirectProductWithGivenDirectProduct( MonB,
          function( MonB, monoids, k, P )
            local B, l, factors, product;
            
            B := UnderlyingCategory( MonB );
            
            l := Length( factors );
            
            factors := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[1] );
            product := ObjectDatum( MonB, P )[1];
            
            return MorphismConstructor( MonB,
                           P,
                           ProjectionInFactorOfDirectProductWithGivenDirectProduct( B,
                                   factors,
                                   k,
                                   product ),
                           monoids[k] );
            
        end );
        
        ##
        AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( MonB,
          function( MonB, monoids, source, tau, P )
            local B, l, factors, s, product, morphisms;
            
            B := UnderlyingCategory( MonB );
            
            l := Length( monoids );
            
            factors := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[1] );
            s := ObjectDatum( MonB, source )[1];
            product := ObjectDatum( MonB, P )[1];
            
            morphisms := List( [ 1 .. l ], i -> MorphismDatum( MonB, tau[i] ) );
            
            return MorphismConstructor( MonB,
                           source,
                           UniversalMorphismIntoDirectProductWithGivenDirectProduct( B,
                                   factors,
                                   s,
                                   morphisms,
                                   product ),
                           P );
            
        end );
        
    elif add and IsEmpty( MissingOperationsForConstructivenessOfCategory( B, "IsAdditiveMonoidalCategory" ) ) then
        
        ##
        AddDirectProduct( MonB,
          function( MonB, monoids )
            local B, U, l, summands, units, mults, unit, sum,
                  right_expand, left_summands, left_projections, left_expands, all, projections, mult;
            
            B := UnderlyingCategory( MonB );
            
            U := TensorUnit( B );
            
            l := Length( monoids );
            
            summands := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[1] );
            units := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[2] );
            mults := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[3] );
            
            unit := PreCompose( B,
                            CartesianDiagonal( B,
                                    U,
                                    l ),
                            DirectProductFunctorial( B,
                                    units ) );
            
            sum := DirectSum( B,
                           summands );
            
            right_expand := RightDistributivityExpanding( B,
                                    summands,
                                    sum );
            
            left_summands := List( [ 1 .. l ], i ->
                                   TensorProductOnObjects( B,
                                           summands[i],
                                           sum ) );
            
            left_projections := List( [ 1 .. l ], i ->
                                      ProjectionInFactorOfDirectSum( B,
                                              left_summands,
                                              i ) );
            
            left_expands := List( [ 1 .. l ], i ->
                                  LeftDistributivityExpanding( B,
                                          summands[i],
                                          summands ) );
            
            all := List( [ 1 .. l ], i ->
                         List( [ 1 .. l ], j ->
                               TensorProductOnObjects( B,
                                       summands[i],
                                       summands[j] ) ) );
            
            projections := List( [ 1 .. l ], i ->
                                 ProjectionInFactorOfDirectSum( B,
                                         all[i],
                                         i ) );
            
            mult := UniversalMorphismIntoDirectSum( B,
                            TensorProductOnObjects( B,
                                    sum,
                                    sum ),
                            List( [ 1 .. l ], i ->
                                  PreComposeList( B,
                                          [ right_expand,
                                            left_projections[i],
                                            left_expands[i],
                                            projections[i],
                                            mults[i] ] ) ) );
            
            return ObjectConstructor( MonB,
                           Triple( sum,
                                   unit,
                                   mult ) );
            
        end );
        
        ##
        AddProjectionInFactorOfDirectProductWithGivenDirectProduct( MonB,
          function( MonB, monoids, k, P )
            local B, l, summands, sum;
            
            B := UnderlyingCategory( MonB );
            
            l := Length( monoids );
            
            summands := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[1] );
            sum := ObjectDatum( MonB, P )[1];
            
            return MorphismConstructor( MonB,
                           P,
                           ProjectionInFactorOfDirectSumWithGivenDirectSum( B,
                                   summands,
                                   k,
                                   sum ),
                           monoids[k] );
            
        end );
        
        ##
        AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( MonB,
          function( MonB, monoids, source, tau, P )
            local B, l, summands, s, sum, morphisms;
            
            B := UnderlyingCategory( MonB );
            
            l := Length( monoids );
            
            summands := List( [ 1 .. l ], i -> ObjectDatum( MonB, monoids[i] )[1] );
            s := ObjectDatum( MonB, source )[1];
            sum := ObjectDatum( MonB, P )[1];
            
            morphisms := List( [ 1 .. l ], i -> MorphismDatum( MonB, tau[i] ) );
            
            return MorphismConstructor( MonB,
                           source,
                           UniversalMorphismIntoDirectSumWithGivenDirectSum( B,
                                   summands,
                                   s,
                                   morphisms,
                                   sum ),
                           P );
            
        end );
        
    fi;
    
    if sym then
        
        ##
        AddTensorUnit( MonB,
          function( MonB )
            local B, U;
            
            B := UnderlyingCategory( MonB );
            
            U := TensorUnit( B );
            
            return ObjectConstructor( MonB,
                           Triple( U,
                                   IdentityMorphism( B, U ),
                                   LeftUnitor( B, U ) ) );
            
        end );
        
        ##
        AddTensorProductOnObjects( MonB,
          function( MonB, monoid1, monoid2 )
            local B, U, triple1, triple2, object1, object2, object, unit, mult, tensor_product_monoid;
            
            B := UnderlyingCategory( MonB );
            
            U := TensorUnit( B );
            
            triple1 := ObjectDatum( MonB, monoid1 );
            triple2 := ObjectDatum( MonB, monoid2 );
            
            object1 := triple1[1];
            object2 := triple2[1];
            
            object := TensorProductOnObjects( B,
                              object1,
                              object2 );
            
            unit := PreCompose( B,
                            LeftUnitorInverse( B, U ),
                            TensorProductOnMorphisms( B,
                                    triple1[2],
                                    triple2[2] ) );
            
            mult := PreComposeList( B,
                            TensorProductOnObjects( B, object, object ),
                            [ AssociatorRightToLeft( B,
                                    TensorProductOnObjects( B,
                                            object1,
                                            object2 ),
                                    object1,
                                    object2 ),
                              TensorProductOnMorphisms( B,
                                      AssociatorLeftToRight( B,
                                              object1,
                                              object2,
                                              object1 ),
                                      IdentityMorphism( B,
                                              object2 ) ),
                              TensorProductOnMorphisms( B,
                                    TensorProductOnMorphisms( B,
                                            IdentityMorphism( B,
                                                    object1 ),
                                            Braiding( B,
                                                    object2,
                                                    object1 ) ),
                                    IdentityMorphism( B,
                                            object2 ) ),
                              TensorProductOnMorphisms( B,
                                      AssociatorRightToLeft( B,
                                              object1,
                                              object1,
                                              object2 ),
                                      IdentityMorphism( B,
                                              object2 ) ),
                              AssociatorLeftToRight( B,
                                      TensorProductOnObjects( B,
                                              object1,
                                              object1 ),
                                      object2,
                                      object2 ),
                              TensorProductOnMorphisms( B,
                                      triple1[3],
                                      triple2[3] ) ],
                            object );
            
            tensor_product_monoid := ObjectConstructor( MonB,
                                             Triple( object, unit, mult ) );
            
            #% CAP_JIT_DROP_NEXT_STATEMENT
            tensor_product_monoid!.tensorands := [ monoid1, monoid2 ];
            
            return tensor_product_monoid;
            
        end );
        
        ##
        AddTensorProductOnMorphismsWithGivenTensorProducts( MonB,
          function( MonB, source, monoid_morphism1, monoid_morphism2, target )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           source,
                           TensorProductOnMorphisms( B,
                                   MorphismDatum( MonB, monoid_morphism1 ),
                                   MorphismDatum( MonB, monoid_morphism2 ) ),
                           target );
            
        end );
        
        ##
        AddLeftUnitorWithGivenTensorProduct( MonB,
          function( MonB, object, source )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           source,
                           LeftUnitorWithGivenTensorProduct( B,
                                   ObjectDatum( MonB, object )[1],
                                   ObjectDatum( MonB, source )[1] ),
                           object );
            
        end );
        
        ##
        AddLeftUnitorInverseWithGivenTensorProduct( MonB,
          function( MonB, object, target )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           object,
                           LeftUnitorInverseWithGivenTensorProduct( B,
                                   ObjectDatum( MonB, object )[1],
                                   ObjectDatum( MonB, target )[1] ),
                           target );
            
        end );
        
        ##
        AddRightUnitorWithGivenTensorProduct( MonB,
          function( MonB, object, source )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           source,
                           RightUnitorWithGivenTensorProduct( B,
                                   ObjectDatum( MonB, object )[1],
                                   ObjectDatum( MonB, source )[1] ),
                           object );
            
        end );
        
        ##
        AddRightUnitorInverseWithGivenTensorProduct( MonB,
          function( MonB, object, target )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           object,
                           RightUnitorInverseWithGivenTensorProduct( B,
                                   ObjectDatum( MonB, object )[1],
                                   ObjectDatum( MonB, target )[1] ),
                           target );
            
        end );
        
        ##
        AddAssociatorLeftToRightWithGivenTensorProducts( MonB,
          function( MonB, source, object1, object2, object3, target )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           source,
                           AssociatorLeftToRightWithGivenTensorProducts( B,
                                   ObjectDatum( MonB, source )[1],
                                   ObjectDatum( MonB, object1 )[1],
                                   ObjectDatum( MonB, object2 )[1],
                                   ObjectDatum( MonB, object3 )[1],
                                   ObjectDatum( MonB, target )[1] ),
                           target );
            
        end );
        
        ##
        AddAssociatorRightToLeftWithGivenTensorProducts( MonB,
          function( MonB, source, object1, object2, object3, target )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           source,
                           AssociatorRightToLeftWithGivenTensorProducts( B,
                                   ObjectDatum( MonB, source )[1],
                                   ObjectDatum( MonB, object1 )[1],
                                   ObjectDatum( MonB, object2 )[1],
                                   ObjectDatum( MonB, object3 )[1],
                                   ObjectDatum( MonB, target )[1] ),
                           target );
            
        end );
        
        ##
        AddBraidingWithGivenTensorProducts( MonB,
          function( MonB, source, object1, object2, target )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           source,
                           BraidingWithGivenTensorProducts( B,
                                   ObjectDatum( MonB, source )[1],
                                   ObjectDatum( MonB, object1 )[1],
                                   ObjectDatum( MonB, object2 )[1],
                                   ObjectDatum( MonB, target )[1] ),
                           target );
            
        end );
        
        ##
        AddBraidingInverseWithGivenTensorProducts( MonB,
          function( MonB, source, object1, object2, target )
            local B;
            
            B := UnderlyingCategory( MonB );
            
            return MorphismConstructor( MonB,
                           source,
                           BraidingInverseWithGivenTensorProducts( B,
                                   ObjectDatum( MonB, source )[1],
                                   ObjectDatum( MonB, object1 )[1],
                                   ObjectDatum( MonB, object2 )[1],
                                   ObjectDatum( MonB, target )[1] ),
                           target );
            
        end );
        
        ##
        AddInitialObject( MonB,
          function( MonB )
            
            return TensorUnit( MonB );
            
        end );
        
        ##
        AddUniversalMorphismFromInitialObjectWithGivenInitialObject( MonB,
          function( MonB, object, unit )
            
            return MorphismConstructor( MonB,
                           unit,
                           ObjectDatum( MonB, object )[2],
                           object );
            
        end );
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( MonB );
    fi;
    
    return MonB;
    
end ) );

##
InstallMethod( CategoryOfMonoids,
        "for a monoidal category",
        [ IsCapCategory and IsMonoidalCategory ],
        
  function( B )
    
    return CATEGORY_OF_MONOIDS( B );
    
end );

##
InstallMethod( UnderlyingObject,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids ],
        
  function( monoid )
    
    return ObjectDatum( monoid )[1];
    
end );

##
InstallMethod( \.,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids, IsPosInt ],
        
  function ( monoid, string_as_int )
    local name, datum;
    
    name := NameRNam( string_as_int );
    
    datum := ObjectDatum( monoid );
    
    if name = "object" then
        return datum[1];
    elif name = "unit" then
        return datum[2];
    elif name = "mult" or name = "multiplication" then
        return datum[3];
    elif HasUnderlyingAlgebra( monoid ) then
        if HasAmbientCategory( UnderlyingAlgebra( monoid ) ) then
            return AmbientCategory( UnderlyingAlgebra( monoid ) ).(name);
        else
            return UnderlyingAlgebra( monoid ).(name);
        fi;
    else
        Error( "the monoid only has the componenets `object`, `unit`, `mult` (or `multiplication`)" );
    fi;
    
end );

##
InstallMethod( AssociatedCategoryOfComonoids,
        "for a category of internal monoids",
        [ IsCategoryOfInternalMonoids ],
        
  function( MonB )
    
    return CategoryOfComonoids( UnderlyingCategory( MonB ) );
    
end );

##
InstallMethod( FullMatrixAlgebraAsInternalMonoid,
        "for an integer and a category of internal monoids",
        [ IsInt, IsCategoryOfInternalMonoids ],
        
  function( n, MonB )
    local B, U, V, V2, k, unit, mult, counit, comult;
    
    B := UnderlyingCategory( MonB );
    
    Assert( 0, HasIsLinearCategoryOverCommutativeRing( B ) and IsLinearCategoryOverCommutativeRing( B ) and HasCommutativeRingOfLinearCategory( B ) );
    
    U := TensorUnit( B );
    V := n^2 / B;
    V2 := TensorProduct( V, V );
    
    k := CommutativeRingOfLinearCategory( B );
    
    unit := HomalgIdentityMatrix( n, k );;
    unit := ConvertMatrixToRow( unit );;
    unit := CategoryOfRowsMorphism( U, unit, V );
    
    mult := HomalgIdentityMatrix( n^2, k );;
    mult := List( [ 1 .. n^2 ], r -> ConvertRowToMatrix( CertainRows( mult, [ r ] ), n, n ) );;
    mult := List( mult, a -> List( mult, b -> ConvertMatrixToRow( a * b ) ) );;
    mult := UnionOfRows( Concatenation( mult ) );;
    mult := CategoryOfRowsMorphism( V2, mult, V );
    
    return ObjectConstructor( MonB, Triple( V, unit, mult ) );
    
end );

##
InstallMethod( FullMatrixAlgebraAsInternalMonoid,
        "for an integer and a linear category",
        [ IsInt, IsCapCategory and IsLinearCategoryOverCommutativeRing and HasCommutativeRingOfLinearCategory ],
        
  function( n, B )
    
    return FullMatrixAlgebraAsInternalMonoid( n, CategoryOfMonoids( B ) );
    
end );

##
InstallMethod( FullMatrixAlgebraAsInternalMonoid,
        "for an integer and a commutative homalg ring",
        [ IsInt, IsHomalgRing and IsCommutative ],
        
  function( n, k )
    
    return FullMatrixAlgebraAsInternalMonoid( n, CategoryOfRows( k ) );
    
end );

##
InstallMethod( \/,
        "for a linear category on one object and a category of internal monoids",
        [ IsCapCategory and IsObjectFiniteCategory and IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms, IsCategoryOfInternalMonoids ],
        
  function( fp_linear_category_on_one_object, MonB )
    local B, o, object, unit, basis, mult, monoid;
    
    B := UnderlyingCategory( MonB );
    
    Assert( 0, IsIdenticalObj( B, RangeCategoryOfHomomorphismStructure( fp_linear_category_on_one_object ) ) );
    
    o := SetOfObjects( fp_linear_category_on_one_object );
    
    Assert( 0, Length( o ) = 1 );
    
    o := o[1];
    
    object := HomStructure( o, o );
    
    unit := HomStructure( IdentityMorphism( o ) );
    
    basis := BasisOfExternalHom( o, o );
    
    ## this basis of the tensor square of the algebra consists
    ## (decomposable) tensor products of pairs of basis elements of the algebra;
    ## the convention below "List( basis, pre -> List( basis, post -> ... ) )"
    ## reflects the convention in CategoryOfRows where TensorProductOnMorphisms uses KroneckerMat
    ## For DualKroneckerMat one must switch to List( basis, post -> List( basis, pre -> ... ) )
    mult := List( basis, pre ->
                  List( basis, post ->
                        HomStructure( PreCompose( pre, post ) ) ) );
    
    mult := Concatenation( mult );
    
    mult := UniversalMorphismFromDirectSum( mult );
    
    monoid := ObjectConstructor( MonB,
                      Triple( object,
                              unit,
                              mult ) );
    
    SetUnderlyingAlgebra( monoid, fp_linear_category_on_one_object );
    
    return monoid;
    
end );

##
InstallMethod( LinearCategoryOnOneObjectAsInternalMonoid,
        "a linear category on one object",
        [ IsCapCategory and IsObjectFiniteCategory and IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms ],
        
  function( fp_linear_category_on_one_object )
    local B;
    
    B := RangeCategoryOfHomomorphismStructure( fp_linear_category_on_one_object );
    
    return fp_linear_category_on_one_object / CategoryOfMonoids( B );
    
end );

##
InstallMethod( OppositeMonoid,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids ],
        
  function( monoid )
    local MonB, B, triple, object;
    
    MonB := CapCategory( monoid );
    
    B := UnderlyingCategory( MonB );
    
    triple := ObjectDatum( MonB, monoid );
    
    object := triple[1];
    
    return ObjectConstructor( MonB,
                   Triple( object,
                           triple[2],
                           PreCompose( B,
                                   Braiding( B,
                                           object,
                                           object ),
                                   triple[3] ) ) );
    
end );

##
InstallMethod( IsCommutative,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids ],
        
  function( monoid )
    
    return OppositeMonoid( monoid ) = monoid;
    
end );


##
InstallMethod( DualComonoid,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids ],
        
  function( monoid )
    local MonB, B, ComonB, triple, dual;
    
    MonB := CapCategory( monoid );
    
    B := UnderlyingCategory( MonB );
    
    if not CanCompute( B, "DualOnMorphisms" ) then
        TryNextMethod( );
    fi;
    
    ComonB := CategoryOfComonoids( B );
    
    triple := ObjectDatum( MonB, monoid );
    
    dual := DualOnObjects( B, triple[1] );
    
    return ObjectConstructor( ComonB,
                   Triple( dual,
                           DualOnMorphismsWithGivenDuals( B,
                                   dual,
                                   triple[2],
                                   TensorUnit( B ) ),
                           DualOnMorphismsWithGivenDuals( B,
                                   dual,
                                   triple[3],
                                   TensorProductOnObjects( B,
                                           dual,
                                           dual ) ) ) );
    
end );

##
InstallMethod( TransformedMonoid,
        "for a morphism and an internal monoid",
        [ IsCapCategoryMorphism, IsObjectInCategoryOfInternalMonoids ],
        
  function( iso, monoid )
    local MonB, B, triple, object, unit, mult, inv;
    
    MonB := CapCategory( monoid );
    
    B := UnderlyingCategory( MonB );
    
    triple := ObjectDatum( MonB, monoid );
    
    object := triple[1];
    unit := triple[2];
    mult := triple[3];
    
    if not IsIdenticalObj( B, CapCategory( iso ) ) then
        Error( "the category of the isomorphism `iso` and the underlying category `B` do not coincide\n" );
    fi;
    
    Assert( 0, IsEndomorphism( iso ) and IsEqualForObjects( B, Source( iso ), object ) );
    Assert( 0, IsIsomorphism( iso ) );
    
    inv := InverseForMorphisms( B, iso );
    
    return ObjectConstructor( MonB,
                   Triple( object,
                           PreCompose( B,
                                   unit,
                                   iso ),
                           PreComposeList( B,
                                   Source( mult ),
                                   [ TensorProductOnMorphisms( B,
                                           inv,
                                           inv ),
                                     mult,
                                     iso ],
                                   Target( mult ) ) ) );
    
end );

##
InstallMethod( Counit,
        "for an internal monoid and a list",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsList ],
        
  function( monoid, counit_on_generators )
    local MonB, B, k, id, counit, Q, basis_decomp;
    
    MonB := CapCategory( monoid );
    
    B := UnderlyingCategory( MonB );
    
    k := CommutativeRingOfLinearCategory( B );
    
    ## begin: normalize counit_on_generators:
    
    id := IdentityMorphism( TensorUnit( B ) );
    
    counit := List( counit_on_generators, r -> ( r / k ) * id );
    
    ## end: normalize counit_on_generators
    
    Q := UnderlyingAlgebra( monoid );
    
    basis_decomp := DecompositionOfBasisOfLinearCategory( Q );
    
    counit := List( basis_decomp, indices -> List( indices, i -> counit[i] ) );
    counit := List( counit, images -> Iterated( images, { a, b } -> TensorProduct( a, b ), id ) );
    counit := UniversalMorphismFromDirectSum( counit );
    
    return MorphismConstructor( MonB, monoid, counit, TensorUnit( MonB ) );
    
end );

##
InstallMethod( Comultiplication,
        "for an internal monoid and two lists",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsList ],
        
  function( monoid, comult_on_generators )
    local MonB, B, k, Q, normalize_summand, comult, basis_decomp, monoid2, unit2, mult2;
    
    MonB := CapCategory( monoid );
    
    B := UnderlyingCategory( MonB );
    
    k := CommutativeRingOfLinearCategory( B );
    
    Q := UnderlyingAlgebra( monoid );
    
    ## begin: normalize comult_on_generators:
    
    normalize_summand :=
      function( summand )
        local r, image;
        
        Assert( 0, IsList( summand ) and Length( summand ) = 2 );
        
        if IsList( summand[2] ) then
            
            Assert( 0, IsRingElement( summand[1] ) and Length( summand[2] ) = 2 );
            
            r := summand[1] / k;
            
            summand := summand[2];
            
        else
            
            r := One( k );
            
        fi;
        
        image := TensorProduct( HomStructure( summand[1] / Q ), HomStructure( summand[2] / Q ) );
        
        if not IsIdenticalObj( CapCategory( image ), B ) then
            image := ( k * MorphismDatum( image ) ) / B;
        fi;
        
        if not IsOne( r ) then
            image := r * image;
        fi;
        
        return image;
        
    end;
    
    comult := List( comult_on_generators, gen -> Sum( gen, normalize_summand ) );
    
    ## end: normalize comult_on_generators
    
    basis_decomp := DecompositionOfBasisOfLinearCategory( Q );
    
    monoid2 := TensorProduct( monoid, monoid );
    
    unit2 := monoid2.unit;
    mult2 := monoid2.mult;
    
    comult := List( basis_decomp, indices -> List( indices, i -> comult[i] ) );
    comult := List( comult, images -> Iterated( images, { a, b } -> PreCompose( TensorProduct( a, b ), mult2 ), unit2 ) );
    comult := UniversalMorphismFromDirectSum( comult );
    
    return MorphismConstructor( MonB, monoid, comult, monoid2 );
    
end );

##
InstallMethod( Antipode,
        "for an internal monoid and two lists",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsList ],
        
  function( monoid, antipode_on_generators )
    local MonB, B, k, Q, ensure_image_is_list, image_of_antipode_on_a_generator, antipode, basis_decomp, unit, mult;
    
    MonB := CapCategory( monoid );
    
    B := UnderlyingCategory( MonB );
    
    k := CommutativeRingOfLinearCategory( B );
    
    Q := UnderlyingAlgebra( monoid );
    
    ## begin: normalize antipode_on_generators:
    
    ensure_image_is_list :=
      function( image )
        if not IsList( image ) then
            return [ image ];
        else
            return image;
        fi;
    end;
    
    antipode := List( antipode_on_generators, ensure_image_is_list );
    
    image_of_antipode_on_a_generator :=
      function( summand )
        local r, image;
        
        if IsList( summand ) then
            
            Assert( 0, IsRingElement( summand[1] ) );
            
            r := summand[1] / k;
            
            summand := summand[2];
            
        else
            
            r := One( k );
            
        fi;
        
        image := HomStructure( summand / Q );
        
        if not IsIdenticalObj( CapCategory( image ), B ) then
            image := ( k * MorphismDatum( image ) ) / B;
        fi;
        
        if not IsOne( r ) then
            image := r * image;
        fi;
        
        return image;
        
    end;
    
    antipode := List( antipode, gen -> Sum( gen, image_of_antipode_on_a_generator ) );
    
    ## end: normalize antipode_on_generators
    
    basis_decomp := DecompositionOfBasisOfLinearCategory( Q );
    
    unit := monoid.unit;
    mult := monoid.mult;
    
    antipode := List( basis_decomp, indices -> List( indices, i -> antipode[i] ) );
    antipode := List( antipode, images -> Iterated( images, { a, b } -> PreCompose( TensorProduct( b, a ), mult ), unit ) );
    
    return UniversalMorphismFromDirectSum( antipode );
    
end );

##
InstallMethod( Counit,
        "for a f.p. linear category on one object and a record",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and HasCommutativeRingOfLinearCategory, IsRecord ],
        
  function( Q, counit_on_generators )
    local gens, g, counit_gen_names, counit_unknown, vars, counit_func;
    
    Assert( 0, CanCompute( Q, "SetOfGeneratingMorphismsOfCategory" ) );
    
    gens := SetOfGeneratingMorphisms( Q );
    
    g := Length( gens );
    
    counit_gen_names := LabelsOfMorphisms( UnderlyingQuiver( Q ) );
    
    Assert( 0, Length( counit_gen_names ) = g );
    
    counit_unknown := Filtered( counit_gen_names, k -> not IsBound( counit_on_generators.(k) ) or counit_on_generators.(k) = fail );
    
    if IsEmpty( counit_unknown ) then
        
        counit_func := k -> counit_on_generators.(k);
        
    else
        
        vars := List( [ 1 .. Length( counit_unknown ) ], i -> Concatenation( "e_", counit_unknown[i], "_", String( i ) ) );
        
        counit_func :=
          function( gen_name )
            local pos;
            
            pos := Position( counit_unknown, gen_name );
            
            if IsInt( pos ) then
                return vars[pos];
            else
                return counit_on_generators.(gen_name);
            fi;
            
        end;
        
    fi;
    
    return List( counit_gen_names, counit_func );
    
end );

##
InstallMethod( Comultiplication,
        "for a f.p. linear category on one object and a record",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and HasCommutativeRingOfLinearCategory and HasRangeCategoryOfHomomorphismStructure, IsRecord ],
        
  function( Q, comult_on_generators )
    local gens, g, comult_gen_names, comult_unknown, basis, dim, comult_vars, vars, basis_pairs, summand_func, comult_func;
    
    Assert( 0, CanCompute( Q, "SetOfGeneratingMorphismsOfCategory" ) );
    
    gens := SetOfGeneratingMorphisms( Q );
    
    g := Length( gens );
    
    comult_gen_names := LabelsOfMorphisms( UnderlyingQuiver( Q ) );
    
    Assert( 0, Length( comult_gen_names ) = g );
    
    comult_unknown := Filtered( comult_gen_names, k -> not IsBound( comult_on_generators.(k) ) or comult_on_generators.(k) = fail );
    
    summand_func :=
      function( summand )
        
        Assert( 0, IsList( summand ) and Length( summand ) = 2 );
        
        if IsRingElement( summand[1] ) then
            return summand;
        fi;
        
        Assert( 0, ForAll( summand, IsLinearClosureMorphism ) );
        
        return [ 1, summand ];
        
    end;
        
    if IsEmpty( comult_unknown ) then
        
        comult_func :=
          function( gen_name )
            
            return List( comult_on_generators.(gen_name), summand_func );
            
        end;
        
    else
        
        Assert( 0, CanCompute( Q, "BasisOfExternalHom" ) );
        
        basis := BasisOfExternalHom( Q.o, Q.o );
        
        if IsQuotientCategory( Q ) then
            basis := List( basis, CanonicalRepresentative );
        fi;
        
        dim := Length( basis );
        
        comult_vars := List( [ 1 .. Length( comult_unknown ) ], i -> List( [ 1 .. dim^2 ], j -> Concatenation( "c_", comult_unknown[i], "_", String( j ) ) ) );
        
        vars := Concatenation( comult_vars );
        
        ## must be compatible with corresponding line in method LinearCategoryOnOneObjectAsInternalMonoid (or \/ above it)
        basis_pairs := List( basis, l ->
                             List( basis, r ->
                                   Pair( l, r ) ) );
        
        basis_pairs := Concatenation( basis_pairs );
        
        comult_func :=
          function( gen_name )
            local pos, coeffs;
            
            pos := Position( comult_unknown, gen_name );
            
            if IsInt( pos ) then
                coeffs := comult_vars[pos];
                return List( [ 1 .. dim^2 ], i -> [ coeffs[i], [ basis_pairs[i][1], basis_pairs[i][2] ] ] );
            fi;
            
            return List( comult_on_generators.(gen_name), summand_func );
            
        end;
        
    fi;
    
    return List( comult_gen_names, comult_func );
    
end );

##
InstallMethod( Antipode,
        "for a f.p. linear category on one object and a record",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and HasCommutativeRingOfLinearCategory and HasRangeCategoryOfHomomorphismStructure, IsRecord ],
        
  function( Q, antipode_on_generators )
    local gens, g, antipode_gen_names, antipode_unknown, basis, dim, antipode_vars, vars, normalize_func, antipode_func;
    
    Assert( 0, CanCompute( Q, "SetOfGeneratingMorphismsOfCategory" ) );
    
    gens := SetOfGeneratingMorphisms( Q );
    
    g := Length( gens );
    
    antipode_gen_names := LabelsOfMorphisms( UnderlyingQuiver( Q ) );
    
    Assert( 0, Length( antipode_gen_names ) = g );
    
    antipode_unknown := Filtered( antipode_gen_names, k -> not IsBound( antipode_on_generators.(k) ) or antipode_on_generators.(k) = fail );
    
    normalize_func :=
      function( image )
        
        if IsList( image ) then
            return image;
        fi;
        
        return [ Pair( 1, image ) ];
        
    end;
        
    if IsEmpty( antipode_unknown ) then
        
        antipode_func :=
          function( gen_name )
            
            return normalize_func( antipode_on_generators.(gen_name) );
            
        end;
        
    else
        
        Assert( 0, CanCompute( Q, "BasisOfExternalHom" ) );
        
        basis := BasisOfExternalHom( Q.o, Q.o );
        
        if IsQuotientCategory( Q ) then
            basis := List( basis, CanonicalRepresentative );
        fi;
        
        dim := Length( basis );
        
        antipode_vars := List( [ 1 .. Length( antipode_unknown ) ], i -> List( [ 1 .. dim ], j -> Concatenation( "s_", antipode_unknown[i], "_", String( j ) ) ) );
        
        vars := Concatenation( antipode_vars );
        
        antipode_func :=
          function( gen_name )
            local pos, coeffs;
            
            pos := Position( antipode_unknown, gen_name );
            
            if IsInt( pos ) then
                coeffs := antipode_vars[pos];
                return List( [ 1 .. dim ], i -> [ coeffs[i], basis[i] ] );
            fi;
            
            return normalize_func( antipode_on_generators.(gen_name) );
            
        end;
        
    fi;
    
    return List( antipode_gen_names, antipode_func );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids ],
        
  function( monoid )
    local triple;

    triple := ObjectDatum( monoid );
    
    return Concatenation(
                   StringDisplay( triple[3] ),
                   "\nMultiplication of monoid given by the above morphism\n\n",
                   StringDisplay( triple[2] ),
                   "\nUnit of monoid given by the above morphism\n\n",
                   StringDisplay( triple[1] ),
                   "\nObject of monoid given by the above data\n\n",
                   "A monoid given by the above data" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of internal monoids",
        [ IsMorphismInCategoryOfInternalMonoids ],
        
  function( monoid_morphism )
    
    return Concatenation(
                   StringDisplay( MorphismDatum( monoid_morphism ) ),
                   "\nA monoid morphism given by the above data" );
    
end );
