# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

##
InstallMethod( CallFuncList,
        [ IsCapFunctor, IsList ],
        
  { F, a } -> ApplyFunctor( F, a[ 1 ] ) );

##
InstallMethod( CallFuncList,
        [ IsCapNaturalTransformation, IsList ],
        
  { nat, a } -> ApplyNaturalTransformation( nat, a[ 1 ] ) );

##
InstallOtherMethod( Subobject,
        "for a morphism in a category",
        [ IsCapCategoryMorphism ],
        
  function( mor )
    
    if not CanCompute( CapCategory( mor ), "ImageEmbedding" ) then
        TryNextMethod( );
    fi;
    
    return ImageEmbedding( mor );
    
end );

##
InstallOtherMethod( Subobject,
        "for a morphism in a category",
        [ IsCapCategoryMorphism and IsMonomorphism ],
        
  IdFunc );

##
InstallMethodForCompilerForCAP( CovariantHomFunctorData,
        [ IsCapCategory, IsCapCategoryObject ],
        
  function ( C, o )
    local id_o, on_objs, on_mors;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( C, CapCategory( o ) ) );
    
    id_o := IdentityMorphism( C, o );
    
    on_objs := obj -> HomomorphismStructureOnObjects( C, o, obj );
    on_mors := { source, mor, range } -> HomomorphismStructureOnMorphismsWithGivenObjects( C, source, id_o, mor, range );
    
    return Pair( on_objs, on_mors );
    
end );

##
InstallMethod( CovariantHomFunctor,
        [ IsCapCategoryObject ],
        
  function ( o )
    local C, data, Hom;
    
    C := CapCategory( o );
    
    data := CovariantHomFunctorData( C, o );
    
    Hom := CapFunctor( "A covariant Hom functor", C, RangeCategoryOfHomomorphismStructure( C ) );
    
    AddObjectFunction( Hom, data[1] );
    
    AddMorphismFunction( Hom, data[2] );
    
    return Hom;
    
end );

##
InstallMethodForCompilerForCAP( GlobalSectionFunctorData,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( C )
    
    return CovariantHomFunctorData( C, TerminalObject( C ) );
    
end );

##
InstallMethod( GlobalSectionFunctor,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( C )
    local data, Hom1;
    
    data := GlobalSectionFunctorData( C );
    
    Hom1 := CapFunctor( "Global section functor", C, RangeCategoryOfHomomorphismStructure( C ) );
    
    AddObjectFunction( Hom1, data[1] );
    
    AddMorphismFunction( Hom1, data[2] );
    
    return Hom1;
    
end );

##
InstallGlobalFunction( RELATIVE_WEAK_BI_FIBER_PRODUCT_PREFUNCTION,
  function( cat, morphism_1, morphism_2, morphism_3, arg... )
    local current_value;
    
    current_value := IsEqualForObjects( Range( morphism_1 ), Range( morphism_2 ) );
    
    if current_value = fail then
        return [ false, "cannot decide whether morphism_1 and morphism_2 have equal ranges" ];
    elif current_value = false then
        return [ false, "morphism_1 and morphism_2 must have equal ranges" ];
    fi;
    
    current_value := IsEqualForObjects( Range( morphism_3 ), Source( morphism_1 ) );
    
    if current_value = fail then
        return [ false, "cannot decide whether the range of morphism_3 and the source of morphism_1 are equal" ];
    elif current_value = false then
        return [ false, "the range of morphism_3 and the source of morphism_1 must be equal" ];
    fi;
    
    return [ true ];
    
  end
);

##
InstallGlobalFunction( UNIVERSAL_MORPHISM_INTO_BIASED_RELATIVE_WEAK_FIBER_PRODUCT_PREFUNCTION,
  function( cat, morphism_1, morphism_2, morphism_3, test_morphism, arg... )
    local current_value;
    
    current_value := IsEqualForObjects( Range( morphism_1 ), Range( morphism_2 ) );
    
    if current_value = fail then
        return [ false, "cannot decide whether morphism_1 and morphism_2 have equal ranges" ];
    elif current_value = false then
        return [ false, "morphism_1 and morphism_2 must have equal ranges" ];
    fi;
    
    current_value := IsEqualForObjects( Range( morphism_3 ), Source( morphism_1 ) );
    
    if current_value = fail then
        return [ false, "cannot decide whether the range of morphism_3 and the source of morphism_1 are equal" ];
    elif current_value = false then
        return [ false, "the range of morphism_3 and the source of morphism_1 must be equal" ];
    fi;
    
    current_value := IsEqualForObjects( Source( morphism_1 ), Range( test_morphism ) );
    
    if current_value = fail then
        return [ false, "cannot decide whether the range of the test morphism is equal to the source of the first morphism " ];
    elif current_value = false then
        return [ false, "the range of the test morphism must equal the source of the first morphism" ];
    fi;
    
    return [ true ];
    
  end
);

####################################
#
# methods for operations:
#
####################################


##
InstallOtherMethod( \*,
        "for two CAP morphism",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism ],

  function( mor1, mor2 )
    
    return PreCompose( mor1, mor2 );
    
end );

##
InstallOtherMethod( OneMutable,
        "for a CAP morphism",
        [ IsCapCategoryMorphism ],
        
  function( mor )
    
    if not IsEndomorphism( mor ) then
        return fail;
    fi;
    
    return IdentityMorphism( Source( mor ) );
    
end );

##
InstallOtherMethod( POW,
        "for a CAP morphism and an integer",
        [ IsCapCategoryMorphism, IsInt ],

  function( mor, power )
    
    if power = 0 then
        return OneMutable( mor );
    fi;
    
    if power < 0 then
        mor := Inverse( mor );
        if mor = fail then
            return mor;
        fi;
        power := -power;
    fi;
    
    if power > 1 then
        if not IsEndomorphism( mor ) then
            return fail;
        fi;
    fi;
    
    return Product( ListWithIdenticalEntries( power, mor ) );
    
end );

##
InstallMethod( BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory,
        "for two lists",
        [ IsList, IsList ],
               
  function( left_coeffs, right_coeffs )
    
    return BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory( CapCategory( right_coeffs[1, 1] ), left_coeffs, right_coeffs );
    
end );

##
InstallMethod( BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory,
        "for four lists",
        [ IsList, IsList, IsList, IsList ],
        
  function( alpha, beta, gamma, delta )
    
    return BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory(
                    CapCategory( delta[1, 1] ), alpha, beta, gamma, delta
                  );
    
end );

##
InstallMethod( BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory,
        "for two lists",
        [ IsList, IsList ],

  function( alpha, delta )
    local cat, beta, gamma, i;
    
    cat := CapCategory( alpha[1][1] );
    
    if not CanCompute( cat, "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory" ) then
        Error( "the operation <BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory> must be computable in the category named \n:", Name( cat ) );
    fi;
    
    beta := List( [ 1 .. Length( alpha ) ],
                i ->  List( [ 1 .. Length( delta[i] ) ],
                      function ( j )
                        local alpha_ij, delta_ij;

                        alpha_ij := alpha[i][j];
                        delta_ij := delta[i][j];

                        if IsEndomorphism( cat, delta_ij ) and not IsEqualToZeroMorphism( cat, alpha_ij ) then
                            return IdentityMorphism( cat, Source( delta_ij ) );
                        else
                            return ZeroMorphism( cat, Source( delta_ij ), Range( delta_ij ) );
                        fi;

                      end ) );
    
    gamma := List( [ 1 .. Length( alpha ) ],
                i ->  List( [ 1 .. Length( alpha[i] ) ],
                      function ( j )
                        local alpha_ij, delta_ij;

                        alpha_ij := alpha[i][j];
                        delta_ij := delta[i][j];

                        if IsEndomorphism( cat, alpha_ij ) and not IsEqualToZeroMorphism( cat, delta_ij ) then
                            return IdentityMorphism( cat, Source( alpha_ij ) );
                        else
                            return ZeroMorphism( cat, Source( alpha_ij ), Range( alpha_ij ) );
                        fi;

                      end ) );
    
    return BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory( cat, alpha, beta, gamma, delta );
    
end );

##
InstallMethod( MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory,
        "for two lists",
        [ IsList, IsList ],
        
  function( left_coeffs, right_coeffs )
    
    return MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory( CapCategory( right_coeffs[1,1] ), left_coeffs, right_coeffs );
    
end );

##
CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD(
        rec(
            LimitPair :=
            [ [ "DirectProduct", 2 ],
              [ "ProjectionInFactorOfDirectProductWithGivenDirectProduct", 2 ], ## called in List
              [ "UniversalMorphismIntoDirectProductWithGivenDirectProduct", 2 ],
              [ "PreCompose", 2 ] ] ## called in List
            )
);

##
InstallMethodForCompilerForCAP( LimitPair,
        "for a catgory and two lists",
        [ IsCapCategory, IsList, IsList ],
        
  function( cat, objects, decorated_morphisms )
    local source, projections, diagram, tau, range, mor1, compositions, mor2;
    
    source := DirectProduct( cat, objects );
    
    projections := List( [ 0 .. Length( objects ) - 1 ],
                         i -> ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat, objects, 1 + i, source ) );
    
    diagram := List( decorated_morphisms, m -> objects[1 + m[3]] );
    
    tau := List( decorated_morphisms, m -> projections[1 + m[3]] );
    
    range := DirectProduct( cat, diagram );
    
    mor1 := UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                    diagram, source, tau, range );
    
    compositions := List( decorated_morphisms,
                          m -> PreCompose( cat,
                                  projections[1 + m[1]],
                                  m[2] ) );
    
    mor2 := UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                    diagram, source, compositions, range );
    
    return Pair( source, [ mor1, mor2 ] );
    
end );

##
InstallOtherMethod( LimitPair,
        "for a list",
        [ IsList ],
        
  function( pair )
    
    return LimitPair( CapCategory( pair[1][1] ), pair[1], pair[2] );
    
end );

##
InstallMethodForCompilerForCAP( ColimitPair,
        "for a catgory and two lists",
        [ IsCapCategory, IsList, IsList ],
        
  function( cat, objects, decorated_morphisms )
    local range, injections, diagram, tau, source, mor1, compositions, mor2;
    
    range := Coproduct( cat, objects );
    
    injections := List( [ 0 .. Length( objects ) - 1 ],
                         i -> InjectionOfCofactorOfCoproductWithGivenCoproduct( cat, objects, 1 + i, range ) );
    
    diagram := List( decorated_morphisms, m -> objects[1 + m[1]] );
    
    tau := List( decorated_morphisms, m -> injections[1 + m[1]] );
    
    source := Coproduct( cat, diagram );
    
    mor1 := UniversalMorphismFromCoproductWithGivenCoproduct( cat,
                    diagram, range, tau, source );
    
    compositions := List( decorated_morphisms,
                          m -> PreCompose( cat,
                                  m[2],
                                  injections[1 + m[3]] ) );
    
    mor2 := UniversalMorphismFromCoproductWithGivenCoproduct( cat,
                    diagram, range, compositions, source );
    
    return Pair( range, [ mor1, mor2 ] );
    
end );

##
InstallOtherMethod( ColimitPair,
        "for a list",
        [ IsList ],
        
  function( pair )
    
    return ColimitPair( CapCategory( pair[1][1] ), pair[1], pair[2] );
    
end );

##
InstallOtherMethod( Limit,
        "for a catgory and a list",
        [ IsCapCategory, IsList ],
        
  function( C, pair )
    
    return Limit( C, pair[1], pair[2] );
    
end );

##
InstallOtherMethod( Limit,
        "for a list",
        [ IsList ],
        
  function( pair )
    
    return Limit( CapCategory( pair[1][1] ), pair );
    
end );

##
InstallOtherMethod( Colimit,
        "for a catgory and a list",
        [ IsCapCategory, IsList ],
        
  function( C, pair )
    
    return Colimit( C, pair[1], pair[2] );
    
end );

##
InstallOtherMethod( Colimit,
        "for a list",
        [ IsList ],
        
  function( pair )
    
    return Colimit( CapCategory( pair[1][1] ), pair );
    
end );

##
InstallMethodForCompilerForCAP( PreComposeFunctorsByData,
        [ IsCapCategory, IsList, IsList ],
        
  function( C, pre_functor_data, post_functor_data )
    local A, B, composed_functor_on_objects, composed_functor_on_morphisms;
    
    A := pre_functor_data[1];
    B := pre_functor_data[3];
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( B, post_functor_data[1] ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( C, post_functor_data[3] ) );
    
    composed_functor_on_objects :=
      function( objA )
        
        return post_functor_data[2][1]( pre_functor_data[2][1]( objA ) );
        
    end;
    
    composed_functor_on_morphisms :=
      function( sourceC, morA, rangeC )
        local sourceB, rangeB;
        
        sourceB := pre_functor_data[2][1]( Source( morA ) );
        rangeB := pre_functor_data[2][1]( Range( morA ) );
        
        return post_functor_data[2][2](
                       sourceC,
                       pre_functor_data[2][2](
                               sourceB,
                               morA,
                               rangeB ),
                       rangeC );
        
    end;
    
    return
      Triple( A,
              Pair( composed_functor_on_objects, composed_functor_on_morphisms ),
              C );
    
end );

##
InstallMethodForCompilerForCAP( PreComposeWithWrappingFunctorData,
        [ IsWrapperCapCategory, IsList ],
        
  function( C, functor_data )
    local A, B, wrapping_functor_on_objects, wrapping_functor_on_morphisms, wrapping_functor_data;
    
    A := functor_data[1];
    B := functor_data[3];
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( B, ModelingCategory( C ) ) );
    
    wrapping_functor_on_objects := objB -> AsObjectInWrapperCategory( C, objB );
    
    wrapping_functor_on_morphisms := { sourceC, morB, rangeB } -> AsMorphismInWrapperCategory( C, sourceC, morB, rangeB );
    
    wrapping_functor_data :=
      Triple( B,
              Pair( wrapping_functor_on_objects, wrapping_functor_on_morphisms ),
              C );
    
    return
      PreComposeFunctorsByData( C,
              functor_data,
              wrapping_functor_data );
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToWrapperCategoryData,
        "for a two categories and a pair of functions",
        [ IsWrapperCapCategory, IsList, IsCapCategory ],
        
  function( W, pair_of_funcs, range_category )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    extended_functor_on_objects :=
      function( objW )
        
        return functor_on_objects( ObjectDatum( W, objW ) );
        
    end;
    
    extended_functor_on_morphisms :=
      function( source, morW, range )
        
        return functor_on_morphisms(
                       source,
                       MorphismDatum( W, morW ),
                       range );
        
    end;
    
    return Triple( W,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   range_category );
    
end );

##
InstallOtherMethod( ListPrimitivelyInstalledOperationsOfCategoryWhereMorphismOperationsAreReplacedWithCorrespondingObjectAndWithGivenOperations,
        "for two lists",
        [ IsList, IsList ],
        
  function( list_of_primitively_installed_operations, list_of_installed_operations )
    local list_of_replaced_primitively_installed_operations, name, info, with_given_object_name;
    
    list_of_replaced_primitively_installed_operations := [ ];
    
    for name in list_of_primitively_installed_operations do
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if IsList( info.with_given_without_given_name_pair ) and name = info.with_given_without_given_name_pair[1] and
           IsBound( CAP_INTERNAL_METHOD_NAME_RECORD.(info.with_given_without_given_name_pair[2]).with_given_object_name ) then
            
            ## do not install this operation for morphisms but its
            ## with-given-object counterpart and the object
            
            with_given_object_name := CAP_INTERNAL_METHOD_NAME_RECORD.(info.with_given_without_given_name_pair[2]).with_given_object_name;
            
            if with_given_object_name in list_of_installed_operations then
                Add( list_of_replaced_primitively_installed_operations, with_given_object_name );
            else
                Error( "unable to find \"", with_given_object_name, "\" in `list_of_installed_operations`\n" );
            fi;
            
            if info.with_given_without_given_name_pair[2] in list_of_installed_operations then
                Add( list_of_replaced_primitively_installed_operations, info.with_given_without_given_name_pair[2] );
            else
                Error( "unable to find \"", info.with_given_without_given_name_pair[2], "\" in `list_of_installed_operations`\n" );
            fi;
        else
            Add( list_of_replaced_primitively_installed_operations, name );
        fi;
    od;
    
    return SortedList( list_of_replaced_primitively_installed_operations );
    
end );

##
InstallMethod( ListPrimitivelyInstalledOperationsOfCategoryWhereMorphismOperationsAreReplacedWithCorrespondingObjectAndWithGivenOperations,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    
    if not IsFinalized( C ) then
        Error( "the input category `C` is not finalized\n" );
    fi;
    
    return ListPrimitivelyInstalledOperationsOfCategoryWhereMorphismOperationsAreReplacedWithCorrespondingObjectAndWithGivenOperations(
                   ListPrimitivelyInstalledOperationsOfCategory( C ),
                   ListInstalledOperationsOfCategory( C ) );
    
end );
