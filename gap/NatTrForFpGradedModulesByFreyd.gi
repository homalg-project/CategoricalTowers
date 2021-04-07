# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Implementations
#

#################################
##
## Identity to StandardGradedModule
##
#################################

BindGlobal( "INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_STANDARD_GRADED_MODULE_METHOD",
            
  function( natural_transformation_from_identity_to_standard_module_method, presentations, standard_module, nr_generators  )
    
    InstallMethod( natural_transformation_from_identity_to_standard_module_method,
                   [ IsHomalgGradedRing ],
                   
      function( ring )
        local standard_module_functor, category, natural_transformation;
        
        category := presentations( ring );
        
        standard_module_functor := standard_module( ring );
        
        natural_transformation := NaturalTransformation( Concatenation( "Natural isomorphism from Id to ", Name( standard_module_functor ) ),
                                                         IdentityMorphism( AsCatObject( category ) ), standard_module_functor );
        
        AddNaturalTransformationFunction( natural_transformation,
                                          
          function( id_object, object, standard_object )
            local matrix, natiso;
            
            matrix := HomalgIdentityMatrix( nr_generators( UnderlyingMatrix( id_object ) ), ring );
            
            natiso := GradedPresentationMorphismByFreyd( id_object, matrix, standard_object );
            
            Assert( 4, IsIsomorphism( natiso ) );
            SetIsIsomorphism( natiso, true );
            
            return natiso;
            
        end );
        
        SetIsIsomorphism( natural_transformation, true );
        
        return natural_transformation;
        
    end );
    
end );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_STANDARD_GRADED_MODULE_METHOD( NaturalIsomorphismFromIdentityToStandardGradedModuleLeft,
                                                                        FpGradedLeftModules,
                                                                        FunctorStandardGradedModuleLeft,
                                                                        NrColumns );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_STANDARD_GRADED_MODULE_METHOD( NaturalIsomorphismFromIdentityToStandardGradedModuleRight,
                                                                        FpGradedRightModules,
                                                                        FunctorStandardGradedModuleRight,
                                                                        NrRows );

BindGlobal( "INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_GET_RID_OF_HOMOGENEOUS_GENERATORS_METHOD",
            
  function( natural_transformation_from_identity_to_get_rid_of_zero_generators_method, presentations, get_rid_of_zero_generators, triple_getter  )
    
    InstallMethod( natural_transformation_from_identity_to_get_rid_of_zero_generators_method,
                   [ IsHomalgGradedRing ],
                   
      function( ring )
        local get_rid_of_zero_generators_functor, category, natural_transformation;
        
        category := presentations( ring );
        
        get_rid_of_zero_generators_functor := get_rid_of_zero_generators( ring );
        
        natural_transformation := NaturalTransformation( Concatenation( "Natural isomorphism from Id to ", Name( get_rid_of_zero_generators_functor ) ),
                                                         IdentityMorphism( AsCatObject( category ) ), get_rid_of_zero_generators_functor );
        
        AddNaturalTransformationFunction( natural_transformation,
                                          
          function( id_object, object, smaller_object )
            local ZG, natiso;
            
            ZG := triple_getter( UnderlyingMatrix( object ) );
            
            natiso := GradedPresentationMorphismByFreyd( id_object, ZG[2], smaller_object );
            
            Assert( 4, IsIsomorphism( natiso ) );
            SetIsIsomorphism( natiso, true );
            
            return natiso;
            
        end );
        
        SetIsIsomorphism( natural_transformation, true );
        
        return natural_transformation;
        
    end );
    
end );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_GET_RID_OF_HOMOGENEOUS_GENERATORS_METHOD( NaturalIsomorphismFromIdentityToGetRidOfZeroHomogeneousGeneratorsLeft,
                                                                        FpGradedLeftModules,
                                                                        FunctorGetRidOfZeroHomogeneousGeneratorsLeft,
                                                                        NonZeroGeneratorsTransformationTripleLeft );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_GET_RID_OF_HOMOGENEOUS_GENERATORS_METHOD( NaturalIsomorphismFromIdentityToGetRidOfZeroHomogeneousGeneratorsRight,
                                                                        FpGradedRightModules,
                                                                        FunctorGetRidOfZeroHomogeneousGeneratorsRight,
                                                                        NonZeroGeneratorsTransformationTripleRight );

BindGlobal( "INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_LESS_HOMOGENEOUS_GENERATORS_METHOD",
            
  function( natural_transformation_from_identity_to_less_generators_method, presentations, less_generators, triple_getter  )
    
    InstallMethod( natural_transformation_from_identity_to_less_generators_method,
                   [ IsHomalgGradedRing ],
                   
      function( ring )
        local less_generators_functor, category, natural_transformation;
        
        category := presentations( ring );
        
        less_generators_functor := less_generators( ring );
        
        natural_transformation := NaturalTransformation( Concatenation( "Natural isomorphism from Id to ", Name( less_generators_functor ) ),
                                                         IdentityMorphism( AsCatObject( category ) ), less_generators_functor );
        
        AddNaturalTransformationFunction( natural_transformation,
                                          
          function( id_object, object, smaller_object )
            local LG, natiso;
            
            LG := triple_getter( UnderlyingMatrix( object ) );
            
            natiso := GradedPresentationMorphismByFreyd( id_object, LG[2], smaller_object );
            
            Assert( 4, IsIsomorphism( natiso ) );
            SetIsIsomorphism( natiso, true );
            
            return natiso;
            
        end );
        
        SetIsIsomorphism( natural_transformation, true );
        
        return natural_transformation;
        
    end );
    
end );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_LESS_HOMOGENEOUS_GENERATORS_METHOD( NaturalIsomorphismFromIdentityToLessHomogeneousGeneratorsLeft,
                                                                        FpGradedLeftModules,
                                                                        FunctorLessHomogeneousGeneratorsLeft,
                                                                        LessGeneratorsTransformationTripleLeft );

INSTALL_NATURAL_TRANSFORMATION_FROM_IDENTITY_TO_LESS_HOMOGENEOUS_GENERATORS_METHOD( NaturalIsomorphismFromIdentityToLessHomogeneousGeneratorsRight,
                                                                        FpGradedRightModules,
                                                                        FunctorLessHomogeneousGeneratorsRight,
                                                                        LessGeneratorsTransformationTripleRight );

########################################################
##
## Identity to double dual left Hom_R( _ , R ) functor
##
########################################################

##
InstallMethod( NaturalTransformationFromIdentityToDoubleDualLeft, 
                [ IsHomalgGradedRing ], 
   function( ring )
   local category, double_dual_functor, natural_transformation;
   
   category := FpGradedLeftModules( ring );
   
   double_dual_functor := FunctorDoubleDualLeft( ring );
   
   natural_transformation := NaturalTransformation( Concatenation( "Natural transformation from Id to ", Name( double_dual_functor ) ),
                                                         IdentityFunctor( category ), double_dual_functor );
                                                         
   AddNaturalTransformationFunction( natural_transformation, 
   
      function( id_object, object, double_dual_object )
        local A, representing_morphism, cokernel_projection_in_obj, double_dual_of_cokernel_projection, nat_mor; 
        
        A := UnderlyingMatrix( object );
        
        representing_morphism := GradedPresentationMorphismByFreyd( FreeLeftPresentation( NrRows( A ), ring ), A, FreeLeftPresentation( NrColumns( A ), ring ) );
        
        cokernel_projection_in_obj := CokernelProjection( representing_morphism );
        
        double_dual_of_cokernel_projection := ApplyFunctor( double_dual_functor, cokernel_projection_in_obj );
        
        nat_mor := CokernelColift(  representing_morphism, double_dual_of_cokernel_projection );
            
        return nat_mor;
        
      end );

   return natural_transformation;
end );

##
InstallMethod( NaturalTransformationFromIdentityToDoubleDualRight, 
                [ IsHomalgGradedRing ], 
   function( ring )
   local category, double_dual_functor, natural_transformation;
   
   category := FpGradedRightModules( ring );
   
   double_dual_functor := FunctorDoubleDualRight( ring );
   
   natural_transformation := NaturalTransformation( Concatenation( "Natural transformation from Id to ", Name( double_dual_functor ) ),
                                                         IdentityFunctor( category ), double_dual_functor );
                                                         
   AddNaturalTransformationFunction( natural_transformation, 
   
      function( id_object, object, double_dual_object )
        local A, representing_morphism, cokernel_projection_in_obj, double_dual_of_cokernel_projection, nat_mor; 
        
        A := UnderlyingMatrix( object );
        
        representing_morphism := GradedPresentationMorphismByFreyd( FreeRightPresentation( NrColumns( A ), ring ), A, FreeRightPresentation( NrRows( A ), ring ) );
        
        cokernel_projection_in_obj := CokernelProjection( representing_morphism );
        
        double_dual_of_cokernel_projection := ApplyFunctor( double_dual_functor, cokernel_projection_in_obj );
        
        nat_mor := CokernelColift(  representing_morphism, double_dual_of_cokernel_projection );
            
        return nat_mor;
        
      end );

   return natural_transformation;
end );
