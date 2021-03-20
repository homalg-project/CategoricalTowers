# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

#######################################
##
## FunctorStandardPresentationOfModule
##
#######################################

BindGlobal( "INSTALL_FUNCTOR_STANDARD_FP_MODULE_METHODS",
            
  function( functor_standard_module, presentations, basis_of_module, decide_zero, as_presentation )
    
    InstallMethod( functor_standard_module,
                   [ IsCapCategory and IsAdditiveCategory ],
                   
      function( additive_category )
        local category, functor;
        
        category := presentations( additive_category );
        
        functor := CapFunctor( Concatenation( "Standard module for ", Name( category ) ), category, category );
        
        AddObjectFunction( functor,
          function( object )
            local matrix;
            
            matrix := basis_of_module( UnderlyingMatrix( object ) );
            
            return as_presentation( matrix );
            
        end );
        
        AddMorphismFunction( functor,
          function( new_source, morphism, new_range )
            local matrix;
            
            matrix := UnderlyingMatrix( morphism );
            
            matrix := decide_zero( matrix, UnderlyingMatrix( new_range ) );
            
            return FpModuleMorphism( new_source, matrix, new_range );
            
        end );
        
        return functor;
        
    end );
    
end );

BindGlobal( "INSTALL_FUNCTOR_STANDARD_FP_MODULE",
            
  function( )
    
    INSTALL_FUNCTOR_STANDARD_FP_MODULE_METHODS(
            FunctorStandardPresentationOfFpLeftModule,
            FreydCategory,
            BasisOfRowModule,
            DecideZeroRows,
            FpLeftModuleByFreyd );
    
    INSTALL_FUNCTOR_STANDARD_FP_MODULE_METHODS(
            FunctorStandardPresentationOfFpRightModule,
            FreydCategory,
            BasisOfColumnModule,
            DecideZeroColumns,
            FpRightModuleByFreyd );
    
end );

INSTALL_FUNCTOR_STANDARD_FP_MODULE( );

#######################################
##
## FunctorGetRidOfZeroGenerators
##
#######################################

BindGlobal( "INSTALL_FUNCTOR_GET_RID_OF_ZERO_GENERATORS_OF_FP_MODULE_METHODS",
            
  function( functor_get_rid_of_zero_generators, presentations, get_rid_of_zero_generators_transformation_triple, as_presentation, parity )
    
    InstallMethod( functor_get_rid_of_zero_generators,
                   [ IsCapCategory and IsAdditiveCategory ],
                   
      function( additive_category )
        local category, functor;
        
        category := presentations( additive_category );
        
        functor := CapFunctor( Concatenation( "Get rid of zero generators for ", Name( category ) ), category, category );
        
        AddObjectFunction( functor,
          function( object )
            local matrix, triple;
            
            matrix := UnderlyingMatrix( object );
            
            triple := get_rid_of_zero_generators_transformation_triple( matrix );

            return as_presentation( triple[1] );
            
        end );
        
        if parity = "left" then
            
            AddMorphismFunction( functor,
              function( new_source, morphism, new_range )
                local source_transformation_triple, range_transformation_triple, new_morphism_matrix;
                
                source_transformation_triple := get_rid_of_zero_generators_transformation_triple( UnderlyingMatrix( Source( morphism ) ) );
                
                range_transformation_triple := get_rid_of_zero_generators_transformation_triple( UnderlyingMatrix( Range( morphism ) ) );
                
                new_morphism_matrix := UnderlyingMatrix( morphism );
                
                new_morphism_matrix := source_transformation_triple[ 3 ] * new_morphism_matrix * range_transformation_triple[ 2 ];
                
                return FpModuleMorphism( new_source, new_morphism_matrix, new_range );
                
            end );
            
        else
              
            AddMorphismFunction( functor,
              function( new_source, morphism, new_range )
                local source_transformation_triple, range_transformation_triple, new_morphism_matrix;
                
                source_transformation_triple := get_rid_of_zero_generators_transformation_triple( UnderlyingMatrix( Source( morphism ) ) );
                
                range_transformation_triple := get_rid_of_zero_generators_transformation_triple( UnderlyingMatrix( Range( morphism ) ) );
                
                new_morphism_matrix := UnderlyingMatrix( morphism );
                
                new_morphism_matrix := range_transformation_triple[ 2 ] * new_morphism_matrix * source_transformation_triple[ 3 ];
                
                return FpModuleMorphism( new_source, new_morphism_matrix, new_range );
                
            end );
            
        fi;
        
        return functor;
        
    end );
    
end );

BindGlobal( "INSTALL_FUNCTOR_GET_RID_OF_ZERO_GENERATORS_OF_FP_MODULE",
            
  function( )
    
    INSTALL_FUNCTOR_GET_RID_OF_ZERO_GENERATORS_OF_FP_MODULE_METHODS(
            FunctorGetRidOfZeroGeneratorsOfFpLeftModule,
            FreydCategory,
            NonZeroGeneratorsTransformationTripleLeft,
            FpLeftModuleByFreyd,
            "left" );
    
    INSTALL_FUNCTOR_GET_RID_OF_ZERO_GENERATORS_OF_FP_MODULE_METHODS(
            FunctorGetRidOfZeroGeneratorsOfFpRightModule,
            FreydCategory,
            NonZeroGeneratorsTransformationTripleRight,
            FpRightModuleByFreyd,
            "right" );
    
end );

INSTALL_FUNCTOR_GET_RID_OF_ZERO_GENERATORS_OF_FP_MODULE( );

#######################################
##
## FunctorLessGenerators
##
#######################################

##
InstallMethod( FunctorLessGeneratorsOfLeftFpModule,
               [ IsCapCategory and IsAdditiveCategory ],
               
  function( additive_category )
    local category, functor;
    
    category := FreydCategory( additive_category );
    
    functor := CapFunctor( Concatenation( "Less generators for ", Name( category ) ), category, category );
    
    AddObjectFunction( functor,
      function( object )
        local triple, new_object;
        
        triple := LessGeneratorsTransformationTripleLeft( UnderlyingMatrix( object ) );
        
        new_object := triple[1];
        
        return FpLeftModuleByFreyd( new_object );
        
    end );
    
    AddMorphismFunction( functor,
      function( new_source, morphism, new_range )
        local source_transformation_triple, range_transformation_triple, new_morphism_matrix;
        
        source_transformation_triple := LessGeneratorsTransformationTripleLeft( UnderlyingMatrix( Source( morphism ) ) );
        
        range_transformation_triple := LessGeneratorsTransformationTripleLeft( UnderlyingMatrix( Range( morphism ) ) );
        
        new_morphism_matrix := UnderlyingMatrix( morphism );
        
        new_morphism_matrix := source_transformation_triple[ 3 ] * new_morphism_matrix * range_transformation_triple[ 2 ];
        
        return FpModuleMorphism( new_source, new_morphism_matrix, new_range );
        
    end );
    
    return functor;
    
end );

##
InstallMethod( FunctorLessGeneratorsOfRightFpModule,
               [ IsCapCategory and IsAdditiveCategory ],
               
  function( additive_category )
    local category, functor;
    
    category := FreydCategory( additive_category );
    
    functor := CapFunctor( Concatenation( "Less generators for ", Name( category ) ), category, category );
    
    AddObjectFunction( functor,
      function( object )
        local triple, new_object;
        
        triple := LessGeneratorsTransformationTripleRight( UnderlyingMatrix( object ) );
        
        new_object := triple[1];
        
        return FpRightModuleByFreyd( new_object );
        
    end );
    
    AddMorphismFunction( functor,
      function( new_source, morphism, new_range )
        local source_transformation_triple, range_transformation_triple, new_morphism_matrix;
        
        source_transformation_triple := LessGeneratorsTransformationTripleRight( UnderlyingMatrix( Source( morphism ) ) );
        
        range_transformation_triple := LessGeneratorsTransformationTripleRight( UnderlyingMatrix( Range( morphism ) ) );
        
        new_morphism_matrix := UnderlyingMatrix( morphism );
        
        new_morphism_matrix := range_transformation_triple[ 2 ] * new_morphism_matrix * source_transformation_triple[ 3 ];
        
        return FpModuleMorphism( new_source, new_morphism_matrix, new_range );
        
    end );
    
    return functor;
    
end );
