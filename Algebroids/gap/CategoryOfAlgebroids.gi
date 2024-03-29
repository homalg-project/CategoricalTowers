# SPDX-License-Identifier: GPL-2.0-or-later
# Algebroids: Algebroids and bialgebroids as preadditive categories generated by enhanced quivers
#
# Implementations
#

####################################
#
# methods for properties:
#
####################################

##
InstallMethod( IsCommutative,
        "for a commutative algebra",
        [ IsCategoryOfAlgebroidsObject ],
        
  function( B )
    
    return IsCommutative( AsCapCategory( B ) );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( CategoryOfAlgebroidsObject,
                        [ IsAlgebroid ],
               
  function( A )
    local category;

    category := CategoryOfAlgebroids( CommutativeRingOfLinearCategory( A ), Parity( A ) );
    
    return CreateCapCategoryObjectWithAttributes( category,
                                                  AsCapCategory, A );

    
end );

##
InstallMethod( CategoryOfAlgebroidsMorphism,
               [ IsCategoryOfAlgebroidsObject, IsAlgebroidMorphism, IsCategoryOfAlgebroidsObject ],
               
  function( s , morphism, r )
    local category, source, range;
    
    Assert( 0, IsIdenticalObj( CapCategory( s ), CapCategory( r ) ) );
    Assert( 0, IsIdenticalObj( CapCategory( r ), CapCategory( CategoryOfAlgebroidsObject( AsCapCategory( Target( morphism ) ) ) ) ) );
    Assert( 0, IsIdenticalObj( CapCategory( s ), CapCategory( CategoryOfAlgebroidsObject( AsCapCategory( Source( morphism ) ) ) ) ) );
    
    category := CapCategory(s);
    
    return CreateCapCategoryMorphismWithAttributes( category,
                                                    s,
                                                    r,
                                                    AsCapFunctor, morphism );
    
end );

##
InstallMethod( CategoryOfAlgebroidsMorphism,
               [ IsAlgebroidMorphism ],
               
  function( morphism )
    local category, source, range;
    
    return CategoryOfAlgebroidsMorphism( CategoryOfAlgebroidsObject(AsCapCategory(Source(morphism))),
                                         morphism,
                                         CategoryOfAlgebroidsObject(AsCapCategory(Target(morphism)))
                                         );
    
end );

##
InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_CATEGORY_OF_ALGEBROIDS,
  
  function( category )
    local ring, parity;
    
    ring := UnderlyingRing( category );
    parity := Parity( category );

    ## Equality basic operations for objects and morphisms
    ##
    AddIsEqualForObjects( category,
      function( cat, object_1, object_2 )
      
        return UnderlyingQuiverAlgebra( AsCapCategory ( object_1 ) )
               = UnderlyingQuiverAlgebra( AsCapCategory ( object_2 ) );
       
    end );
    
    ##
    AddIsCongruentForMorphisms( category,
      function( cat, morphism_1, morphism_2 )
        local source1, morphism_1_underlying_functor, morphism_2_underlying_functor, objects_in_source1, morphisms_in_source1, o, m;
        
        source1 := AsCapCategory( Source( morphism_1 ) );

        morphism_1_underlying_functor := AsCapFunctor( morphism_1 );
        morphism_2_underlying_functor := AsCapFunctor( morphism_2 );
        
        objects_in_source1 := SetOfObjects( source1 );

        for o in objects_in_source1 do
            if not IsEqualForObjects( ApplyFunctor( morphism_1_underlying_functor, o ),
                                      ApplyFunctor( morphism_2_underlying_functor, o ) ) then
                return false;
            fi;
        od;
        
        morphisms_in_source1 := SetOfGeneratingMorphisms( source1 );
        
        for m in morphisms_in_source1 do
            if not IsCongruentForMorphisms( ApplyFunctor( morphism_1_underlying_functor, m ),
                                        ApplyFunctor( morphism_2_underlying_functor, m ) ) then
                return false;
            fi;
        od;

        return true;
        
    end );
    
    ## Basic operations for a category
    ##
    AddIdentityMorphism( category,
      
      function( cat, object )
        
        return CategoryOfAlgebroidsMorphism( object, IdentityFunctor( AsCapCategory( object ) ), object );
        
    end );
    
    AddPreCompose( category,
        function( cat, morphism_1, morphism_2 )
            local composition;
            
            composition := PreCompose( AsCapFunctor(morphism_1), AsCapFunctor(morphism_2) );

            SetFilterObj( composition, IsAlgebroidMorphism );
            
            return CategoryOfAlgebroidsMorphism( Source( morphism_1 ), composition, Target( morphism_2 ) );
            
           end
    );
    
    AddTensorProductOnObjects( category,
        function( cat, object_1, object_2 )
            return CategoryOfAlgebroidsObject( TensorProductOnObjects( AsCapCategory( object_1 ), AsCapCategory( object_2 ) ) );
        end
    );

    AddTensorProductOnMorphismsWithGivenTensorProducts( category,
        function( cat, source_1_x_source_2, morphism_1, morphism_2, range_1_x_range_2 )
            return CategoryOfAlgebroidsMorphism( source_1_x_source_2, TensorProductOnMorphisms(AsCapFunctor( morphism_1 ), AsCapFunctor( morphism_2 ) ), range_1_x_range_2 );
        end
    );
    
    AddTensorUnit( category,
        function( cat )
            return CategoryOfAlgebroidsObject( TrivialAlgebroid( ring, parity ) );
        end
    );

    AddLeftUnitorWithGivenTensorProduct( category,
        function( cat, a, 1_otimes_a )
            return CategoryOfAlgebroidsMorphism( LeftUnitorAsFunctor( AsCapCategory( a ) ) );
        end
    );

    AddLeftUnitorInverseWithGivenTensorProduct( category,
        function( cat, a, 1_otimes_a )
            return CategoryOfAlgebroidsMorphism( LeftUnitorInverseAsFunctor( AsCapCategory( a ) ) );
        end
    );
    
    AddRightUnitorWithGivenTensorProduct( category,
        function( cat, a, a_otimes_1 )
            return CategoryOfAlgebroidsMorphism( RightUnitorAsFunctor( AsCapCategory( a ) ) );
        end
    );
    
    AddRightUnitorInverseWithGivenTensorProduct( category,
        function( cat, a, a_otimes_1 )
            return CategoryOfAlgebroidsMorphism( RightUnitorInverseAsFunctor( AsCapCategory( a ) ) );
        end
    );

    AddAssociatorLeftToRightWithGivenTensorProducts( category,
        function( cat, AxB_C, A, B, C, A_BxC )
            local AxB_C_as_category, A_as_category, B_as_category, C_as_category, A_BxC_as_category;
            
            AxB_C_as_category := AsCapCategory( AxB_C );
            A_as_category := AsCapCategory( A );
            B_as_category := AsCapCategory( B );
            C_as_category := AsCapCategory( C );
            A_BxC_as_category := AsCapCategory( A_BxC );

            return CategoryOfAlgebroidsMorphism( AssociatorLeftToRightWithGivenTensorProductsAsFunctor( AxB_C_as_category, A_as_category, B_as_category, C_as_category, A_BxC_as_category ) );
        end
    );

    AddAssociatorRightToLeftWithGivenTensorProducts( category,
        function( cat, A_BxC, A, B, C, AxB_C )
            local AxB_C_as_category, A_as_category, B_as_category, C_as_category, A_BxC_as_category;
            A_BxC_as_category := AsCapCategory( A_BxC );
            A_as_category := AsCapCategory( A );
            B_as_category := AsCapCategory( B );
            C_as_category := AsCapCategory( C );
            AxB_C_as_category := AsCapCategory( AxB_C );

            return CategoryOfAlgebroidsMorphism( AssociatorRightToLeftWithGivenTensorProductsAsFunctor( A_BxC_as_category, A_as_category, B_as_category, C_as_category, AxB_C_as_category ) );
        end
    );
    
end );

##
InstallMethodWithCache( CategoryOfAlgebroids,
               [ IsHomalgRing, IsString ],
               
  function( homalg_ring, parity )
    local category;
    
    category := CreateCapCategoryWithDataTypes( Concatenation( "(", parity, ") Algebroids( ", RingName( homalg_ring )," )" ),
                                                IsCategoryOfAlgebroids,
                                                IsCategoryOfAlgebroidsObject,
                                                IsCategoryOfAlgebroidsMorphism,
                                                IsCapCategoryTwoCell,
                                                fail,
                                                fail,
                                                fail );
    
    SetUnderlyingRing( category, homalg_ring );
    
    SetParity( category, parity );
    
    INSTALL_FUNCTIONS_FOR_CATEGORY_OF_ALGEBROIDS( category );
    
    Finalize( category );
    
    return category;
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( TensorProductOnObjects,
        "for algebroids",
        [ IsAlgebroid, IsAlgebroid ],
        
  function( X, Y )

    return X * Y;

end );

##
InstallMethod( TensorProductOnMorphisms,
        "for morphisms between algebroids",
        [ IsAlgebroidMorphism, IsAlgebroidMorphism ],
        
  function( F, G )
    local SF, SG, TF, TG, SF_objects, SG_objects, SFxSG, SFxSG_quiver_algebra, images_of_SF_objects_under_F, images_of_SG_objects_under_G, TFxTG, record_with_images_of_objects, a, b, axb, Gb, Fa, SF_mor, SG_mor, SF_mor_underlying_quiver_algebra_elements, SG_mor_underlying_quiver_algebra_elements, SF_mor_underlying_paths, SG_mor_underlying_paths, record_with_images_of_generating_morphisms, g, axg, f, TF_objects, TG_objects, l, fxb, Ts, product_of_sources, product_of_targets, objects_of_product_of_targets, objects_of_product_of_sources, s, t, p, rp, lp, products_of_quiver_algebra_elements_of_generating_morphisms_of_sources, x;

    SF := AsCapCategory( Source( F ) );
    SG := AsCapCategory( Source( G ) );

    TF := AsCapCategory( Target( F ) );
    TG := AsCapCategory( Target( G ) );

    SF_objects := SetOfObjects( SF );
    SG_objects := SetOfObjects( SG );

    images_of_SF_objects_under_F := List( SF_objects, obj -> ApplyFunctor( F, obj ) );
    images_of_SG_objects_under_G := List( SG_objects, obj -> ApplyFunctor( G, obj ) );
    
    SFxSG := SF * SG;
    TFxTG := TF * TG;
    
    SFxSG_quiver_algebra := UnderlyingQuiverAlgebra( SFxSG );
    
    record_with_images_of_objects := rec();
    for a in SF_objects do
      for b in SG_objects do

        axb := ElementaryTensor( a, b, SFxSG );

        Fa := ApplyFunctor( F, a );
        Gb := ApplyFunctor( G, b );

        record_with_images_of_objects.( String( UnderlyingVertex( axb ) ) ) := ElementaryTensor( Fa, Gb, TFxTG );

      od;
    od;

    SF_mor := SetOfGeneratingMorphisms( SF );
    SG_mor := SetOfGeneratingMorphisms( SG );

    SF_mor_underlying_quiver_algebra_elements := List( SF_mor, UnderlyingQuiverAlgebraElement );
    SG_mor_underlying_quiver_algebra_elements := List( SG_mor, UnderlyingQuiverAlgebraElement );
    
    record_with_images_of_generating_morphisms := rec();

    for a in SF_objects do
      for g in SG_mor do

        axg := ElementaryTensor( a, g, SFxSG );
        axg := UnderlyingQuiverAlgebraElement( axg );
        
        if not IsPathAlgebraElement( axg ) then
        
          axg := Representative( axg );

        fi;
        
        axg := String( LeadingPath( axg ) );

        record_with_images_of_generating_morphisms.(axg) := ElementaryTensor( ApplyFunctor( F, a ), ApplyFunctor( G, g ), TFxTG );

      od;
    od;

    for f in SF_mor do
      for b in SG_objects do

        fxb := ElementaryTensor( f, b, SFxSG );
        fxb := UnderlyingQuiverAlgebraElement( fxb );

        if not IsPathAlgebraElement( fxb ) then

          fxb := Representative( fxb );

        fi;

        fxb := String( LeadingPath( fxb ) );

        record_with_images_of_generating_morphisms.(fxb) := ElementaryTensor( ApplyFunctor( F, f ), ApplyFunctor( G, b ), TFxTG );

      od;
    od;

    TF_objects := SetOfObjects( TF );
    TG_objects := SetOfObjects( TG );

    l := Length( SF_mor );
    Ts := List( [1..l], x -> SFxSG_quiver_algebra );
    
    product_of_sources := SF*SG;
    product_of_targets := TF*TG;

    objects_of_product_of_sources := SetOfObjects( product_of_sources );
    objects_of_product_of_targets := SetOfObjects( product_of_targets );

    products_of_quiver_algebra_elements_of_generating_morphisms_of_sources :=
      ListX( SF_mor_underlying_quiver_algebra_elements, SG_mor_underlying_quiver_algebra_elements, Ts, ElementaryTensor );

    return CapFunctor( SFxSG, record_with_images_of_objects, record_with_images_of_generating_morphisms );

end );

##
InstallMethod( LeftUnitorAsFunctor,
        "for algebroid as category",
        [ IsAlgebroid ],
        
  function( A )
    local objects_in_A, k, kxA, unique_object_in_k, objects_in_kxA,
          unitor_functor_images_of_objects,
          unitor_functor_images_of_generating_morphisms,
          s, o, m;
    
    objects_in_A := SetOfObjects( A );
    
    k := A^0;
    
    kxA := TensorProductOnObjects(k, A);

    unique_object_in_k := SetOfObjects( k )[1];
    
    objects_in_kxA := SetOfObjects( kxA )[1];

    unitor_functor_images_of_objects := rec( );
    for o in objects_in_A do
        unitor_functor_images_of_objects.(String(UnderlyingVertex(ElementaryTensor( unique_object_in_k, o, kxA ) ) ) ) := o;
    od;
    
    unitor_functor_images_of_generating_morphisms := rec();
    for m in SetOfGeneratingMorphisms( A ) do
        s := String( Paths( UnderlyingQuiverAlgebraElement( ElementaryTensor( unique_object_in_k, m, kxA) ) )[1] );
        unitor_functor_images_of_generating_morphisms.(s) := m;
    od;

    return CapFunctor(kxA, unitor_functor_images_of_objects, unitor_functor_images_of_generating_morphisms);

end );

##
InstallMethod( RightUnitorAsFunctor,
        "for algebroid as category",
        [ IsAlgebroid ],
        
  function( A )
    local objects_in_A, k, Axk, unique_object_in_k, objects_in_Axk,
          unitor_functor_images_of_objects,
          unitor_functor_images_of_generating_morphisms,
          s, o, m;
    
    objects_in_A := SetOfObjects( A );
    
    k := A^0;
    
    Axk := TensorProductOnObjects(A, k);

    unique_object_in_k := SetOfObjects( k )[1];
    
    objects_in_Axk := SetOfObjects( Axk )[1];
    
    unitor_functor_images_of_objects := rec( );
    for o in objects_in_A do
        unitor_functor_images_of_objects.(String(UnderlyingVertex(ElementaryTensor( o, unique_object_in_k, Axk ) ) ) ) := o;
    od;
    
    unitor_functor_images_of_generating_morphisms := rec();
    for m in SetOfGeneratingMorphisms( A ) do
        s := String( Paths( UnderlyingQuiverAlgebraElement( ElementaryTensor( m, unique_object_in_k, Axk ) ) )[1] );
        unitor_functor_images_of_generating_morphisms.(s) := m;
    od;

    return CapFunctor(Axk, unitor_functor_images_of_objects, unitor_functor_images_of_generating_morphisms);

end );

##
InstallMethod( LeftUnitorInverseAsFunctor,
        "for algebroid as category",
        [ IsAlgebroid ],
        
  function( A )
    local objects_in_A, k, kxA, unique_object_in_k, objects_in_kxA,
          unitor_inverse_functor_images_of_objects,
          unitor_inverse_functor_images_of_generating_morphisms,
          s, o, m;

    objects_in_A := SetOfObjects( A );
    
    k := A^0;
    
    kxA := TensorProductOnObjects(k, A);

    unique_object_in_k := SetOfObjects( k )[1];
    
    objects_in_kxA := SetOfObjects( kxA )[1];

    unitor_inverse_functor_images_of_objects := rec( );
    for o in objects_in_A do
        unitor_inverse_functor_images_of_objects.(String(UnderlyingVertex(o))) := ElementaryTensor( unique_object_in_k, o, kxA );
    od;
    
    unitor_inverse_functor_images_of_generating_morphisms := rec();
    for m in SetOfGeneratingMorphisms( A ) do
        s := String( Paths(UnderlyingQuiverAlgebraElement(m))[1] );
        unitor_inverse_functor_images_of_generating_morphisms.(s) := ElementaryTensor(unique_object_in_k, m, kxA);
    od;

    return CapFunctor(A, unitor_inverse_functor_images_of_objects, unitor_inverse_functor_images_of_generating_morphisms);

end );

InstallMethod( RightUnitorInverseAsFunctor,
        "for algebroid as category",
        [ IsAlgebroid ],
        
  function( A )
    local objects_in_A, k, Axk, unique_object_in_k,
          unitor_inverse_functor_images_of_objects,
          unitor_inverse_functor_images_of_generating_morphisms,
          s, o, m;

    objects_in_A := SetOfObjects( A );
    
    k := A^0;
    
    Axk := TensorProductOnObjects(A, k);

    unique_object_in_k := SetOfObjects( k )[1];

    unitor_inverse_functor_images_of_objects := rec( );
    for o in objects_in_A do
        unitor_inverse_functor_images_of_objects.(String(UnderlyingVertex(o))) := ElementaryTensor( o, unique_object_in_k, Axk );
    od;
    
    unitor_inverse_functor_images_of_generating_morphisms := rec();
    
    for m in SetOfGeneratingMorphisms( A ) do
        s := String( Paths(UnderlyingQuiverAlgebraElement(m))[1] );
        unitor_inverse_functor_images_of_generating_morphisms.(s) := ElementaryTensor( m, unique_object_in_k, Axk );
    od;

    return CapFunctor( A, unitor_inverse_functor_images_of_objects, unitor_inverse_functor_images_of_generating_morphisms );

end );

##
InstallMethod( AssociatorLeftToRightWithGivenTensorProductsAsFunctor,
        "for algebroids as categories",
        [ IsAlgebroid, IsAlgebroid, IsAlgebroid, IsAlgebroid, IsAlgebroid ],
        
  function( AxB_C, A, B, C, A_BxC )
    local algebra_of_AxB_C, algebra_of_A_BxC, iso_to_flat, iso_from_flat,
          functor_images_of_generating_morphisms, functor_images_of_objects,
          m_flat, m_right, m_string, m_right_string,
          o_string, o_flat, o_right, o_right_string, m, o;

    algebra_of_AxB_C := UnderlyingQuiverAlgebra(AxB_C);
    algebra_of_A_BxC := UnderlyingQuiverAlgebra(A_BxC);
    iso_to_flat := IsomorphismToFlatTensorProduct(algebra_of_AxB_C);
    iso_from_flat := IsomorphismFromFlatTensorProduct(algebra_of_A_BxC);
  
    functor_images_of_generating_morphisms := rec();
    functor_images_of_objects := rec();

    for m in SetOfGeneratingMorphisms( AxB_C ) do
        m_flat := ImageElm( iso_to_flat, UnderlyingQuiverAlgebraElement(m) );
        m_right := ImageElm( iso_from_flat, m_flat );
        m_string := String(Paths(UnderlyingQuiverAlgebraElement(m))[1]);
        m_right_string := String(Paths(m_right)[1]);
        functor_images_of_generating_morphisms.(m_string) := A_BxC.(m_right_string);
    od;
    for o in SetOfObjects( AxB_C ) do
        o_string := String( UnderlyingVertex( o ) );
        o_flat := ImageElm( iso_to_flat, PathAsAlgebraElement( algebra_of_AxB_C, UnderlyingVertex(o) ) );
        o_right := ImageElm( iso_from_flat, o_flat );
        o_right_string := String(Paths(o_right)[1]);
        functor_images_of_objects.(o_string) := A_BxC.(o_right_string);
    od;

    return CapFunctor( AxB_C, functor_images_of_objects, functor_images_of_generating_morphisms );

end );

##
InstallMethod( AssociatorRightToLeftWithGivenTensorProductsAsFunctor,
        "for algebroids as categories",
        [ IsAlgebroid, IsAlgebroid, IsAlgebroid, IsAlgebroid, IsAlgebroid ],
  function( A_BxC, A, B, C, AxB_C )
    local algebra_of_A_BxC, algebra_of_AxB_C, iso_to_flat, iso_from_flat,
          functor_images_of_generating_morphisms, functor_images_of_objects,
          m_flat, m_right, s, o_string, o_flat, o_left, o_left_string, m, o;

    algebra_of_A_BxC := UnderlyingQuiverAlgebra(A_BxC);
    algebra_of_AxB_C := UnderlyingQuiverAlgebra(AxB_C);
    iso_to_flat := IsomorphismToFlatTensorProduct(algebra_of_A_BxC);
    iso_from_flat := IsomorphismFromFlatTensorProduct(algebra_of_AxB_C);
  
    functor_images_of_generating_morphisms := rec();
    functor_images_of_objects := rec();

    for m in SetOfGeneratingMorphisms( A_BxC ) do
        m_flat := ImageElm( iso_to_flat, UnderlyingQuiverAlgebraElement(m) );
        m_right := ImageElm( iso_from_flat, m_flat );
        s := String(Paths(m_right)[1]);
        functor_images_of_generating_morphisms.(s) := AxB_C.(s);
    od;
    for o in SetOfObjects( A_BxC ) do
        o_string := String( UnderlyingVertex( o ) );
        o_flat := ImageElm( iso_to_flat, PathAsAlgebraElement( algebra_of_A_BxC, UnderlyingVertex(o) ) );
        o_left := ImageElm( iso_from_flat, o_flat );
        o_left_string := String(Paths(o_left)[1]);
        functor_images_of_objects.(o_string) := AxB_C.(o_left_string);
    od;

    return CapFunctor( A_BxC, functor_images_of_objects, functor_images_of_generating_morphisms );

end );

##
InstallMethod( Twist,
        "for two algebroids",
        [ IsAlgebroid, IsAlgebroid ],
        
  function( A, B )
    local A_underlying_quiver_algebra, B_underlying_quiver_algebra,
          AxB, BxA, A_objects, B_objects, A_morphisms, B_morphisms, a, b,
          record_with_images_of_objects, record_with_images_of_generating_morphisms,
          axg, axg_string, fxb, fxb_string, g, f;
    
    A_underlying_quiver_algebra := UnderlyingQuiver( A );
    B_underlying_quiver_algebra := UnderlyingQuiver( B );
    
    AxB := A * B;
    BxA := B * A;
    
    A_objects := SetOfObjects( A );
    B_objects := SetOfObjects( B );
    
    A_morphisms := SetOfGeneratingMorphisms( A );
    B_morphisms := SetOfGeneratingMorphisms( B );
    
    record_with_images_of_objects := rec( );

    for a in A_objects do
      for b in B_objects do
        record_with_images_of_objects.( String( UnderlyingVertex( ElementaryTensor( a, b, AxB ) ) ) ) := ElementaryTensor( b, a, BxA );
      od;
    od;
    
    record_with_images_of_generating_morphisms := rec( );
    
    for a in A_objects do
        for g in B_morphisms do
            axg := ElementaryTensor( a, g, AxB );
            axg_string := String( LeadingPath( Representative( UnderlyingQuiverAlgebraElement( axg ) ) ) );
            record_with_images_of_generating_morphisms.(axg_string) := ElementaryTensor( g, a, BxA );
        od;
    od;
    
    for b in B_objects do
        for f in A_morphisms do
            fxb := ElementaryTensor( f, b, AxB );
            fxb_string := String( LeadingPath( Representative( UnderlyingQuiverAlgebraElement( fxb ) ) ) );
            record_with_images_of_generating_morphisms.(fxb_string) := ElementaryTensor( b, f, BxA );
        od;
    od;

    return CapFunctor( AxB, record_with_images_of_objects, record_with_images_of_generating_morphisms );

end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for an algebroid",
        [ IsCategoryOfAlgebroidsObject ],

  function( o )
    
    ViewObj( AsCapCategory( o ) );
    Print( " as an object in the category ");
    ViewObj( CapCategory(o) );
    
end );

##
InstallMethod( Display,
        "for an algebroid",
        [ IsCategoryOfAlgebroidsObject ],

  function( o )
    
    ViewObj( AsCapCategory( o ) );
    Print( " as an object in the category ");
    ViewObj( CapCategory(o) );
    
end );

