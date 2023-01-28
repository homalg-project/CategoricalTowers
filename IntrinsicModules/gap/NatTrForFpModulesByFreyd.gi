# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

#################################
##
## Identity to StandardPresentationOfModule
##
#################################

BindGlobal( "INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_STANDARD_FP_MODULE_METHOD",
            
  function( natural_transformation_from_identity_to_standard_module_method, presentations, standard_module, nr_generators  )
    
    InstallMethod( natural_transformation_from_identity_to_standard_module_method,
                   [ IsCapCategory and IsAdditiveCategory ],
                   
      function( additive_category )
        local standard_module_functor, category, natural_transformation;
        
        category := presentations( additive_category );
        
        standard_module_functor := standard_module( additive_category );
        
        natural_transformation := NaturalTransformation( Concatenation( "Natural isomorphism from Id to ", Name( standard_module_functor ) ),
                                                         IdentityMorphism( AsCatObject( category ) ), standard_module_functor );
        
        AddNaturalTransformationFunction( natural_transformation,
          function( id_object, object, standard_object )
            local matrix, natiso;
            
            matrix := UnderlyingMatrix( id_object );
            
            matrix := HomalgIdentityMatrix( nr_generators( matrix ), HomalgRing( matrix ) );
            
            natiso := FpModuleMorphism( id_object, matrix, standard_object );
            
            Assert( 4, IsIsomorphism( natiso ) );
            SetIsIsomorphism( natiso, true );
            
            return natiso;
            
        end );
        
        SetIsIsomorphism( natural_transformation, true );
        
        return natural_transformation;
        
    end );
    
end );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_STANDARD_FP_MODULE_METHOD(
        NaturalIsomorphismFromIdentityToStandardPresentationOfFpLeftModule,
        FreydCategory,
        FunctorStandardPresentationOfFpLeftModule,
        NrColumns );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_STANDARD_FP_MODULE_METHOD(
        NaturalIsomorphismFromIdentityToStandardPresentationOfFpRightModule,
        FreydCategory,
        FunctorStandardPresentationOfFpRightModule,
        NrRows );

BindGlobal( "INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_GET_RID_OF_GENERATORS_OF_FP_MODULE_METHOD",
            
  function( natural_transformation_from_identity_to_get_rid_of_zero_generators_method, presentations, get_rid_of_zero_generators, triple_getter  )
    
    InstallMethod( natural_transformation_from_identity_to_get_rid_of_zero_generators_method,
                   [ IsCapCategory and IsAdditiveCategory ],
                   
      function( additive_category )
        local get_rid_of_zero_generators_functor, category, natural_transformation;
        
        category := presentations( additive_category );
        
        get_rid_of_zero_generators_functor := get_rid_of_zero_generators( additive_category );
        
        natural_transformation := NaturalTransformation( Concatenation( "Natural isomorphism from Id to ", Name( get_rid_of_zero_generators_functor ) ),
                                                         IdentityMorphism( AsCatObject( category ) ), get_rid_of_zero_generators_functor );
        
        AddNaturalTransformationFunction( natural_transformation,
          function( id_object, object, smaller_object )
            local ZG, natiso;
            
            ZG := triple_getter( UnderlyingMatrix( object ) );
            
            natiso := FpModuleMorphism( id_object, ZG[2], smaller_object );
            
            Assert( 4, IsIsomorphism( natiso ) );
            SetIsIsomorphism( natiso, true );
            
            return natiso;
            
        end );
        
        SetIsIsomorphism( natural_transformation, true );
        
        return natural_transformation;
        
    end );
    
end );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_GET_RID_OF_GENERATORS_OF_FP_MODULE_METHOD(
        NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsOfFpLeftModule,
        FreydCategory,
        FunctorGetRidOfZeroGeneratorsOfFpLeftModule,
        NonZeroGeneratorsTransformationTripleLeft );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_GET_RID_OF_GENERATORS_OF_FP_MODULE_METHOD(
        NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsOfFpRightModule,
        FreydCategory,
        FunctorGetRidOfZeroGeneratorsOfFpRightModule,
        NonZeroGeneratorsTransformationTripleRight );

BindGlobal( "INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_LESS_GENERATORS_OF_FP_MODULE_METHOD",
            
  function( natural_transformation_from_identity_to_less_generators_method, presentations, less_generators, triple_getter  )
    
    InstallMethod( natural_transformation_from_identity_to_less_generators_method,
                   [ IsCapCategory and IsAdditiveCategory ],
                   
      function( additive_category )
        local less_generators_functor, category, natural_transformation;
        
        category := presentations( additive_category );
        
        less_generators_functor := less_generators( additive_category );
        
        natural_transformation := NaturalTransformation( Concatenation( "Natural isomorphism from Id to ", Name( less_generators_functor ) ),
                                                         IdentityMorphism( AsCatObject( category ) ), less_generators_functor );
        
        AddNaturalTransformationFunction( natural_transformation,
          function( id_object, object, smaller_object )
            local LG, natiso;
            
            LG := triple_getter( UnderlyingMatrix( object ) );
            
            natiso := FpModuleMorphism( id_object, LG[2], smaller_object );
            
            Assert( 4, IsIsomorphism( natiso ) );
            SetIsIsomorphism( natiso, true );
            
            return natiso;
            
        end );
        
        SetIsIsomorphism( natural_transformation, true );
        
        return natural_transformation;
        
    end );
    
end );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_LESS_GENERATORS_OF_FP_MODULE_METHOD(
        NaturalIsomorphismFromIdentityToLessGeneratorsOfFpLeftModule,
        FreydCategory,
        FunctorLessGeneratorsOfLeftFpModule,
        LessGeneratorsTransformationTripleLeft );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_LESS_GENERATORS_OF_FP_MODULE_METHOD(
        NaturalIsomorphismFromIdentityToLessGeneratorsOfFpRightModule,
        FreydCategory,
        FunctorLessGeneratorsOfRightFpModule,
        LessGeneratorsTransformationTripleRight );
