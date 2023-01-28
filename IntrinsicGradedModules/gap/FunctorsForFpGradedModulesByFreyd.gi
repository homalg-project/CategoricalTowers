# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Implementations
#

#######################################
##
## FunctorStandardGradedModule
##
#######################################

BindGlobal( "INSTALL_FUNCTOR_GRADED_STANDARD_MODULE_METHODS",
            
  function( functor_standard_module, presentations, basis_of_module, decide_zero, as_presentation )
    
    InstallMethod( functor_standard_module,
                   [ IsHomalgGradedRing ],
                   
      function( ring )
        local category, functor;
        
        category := presentations( ring );
        
        functor := CapFunctor( Concatenation( "Standard module for ", Name( category ) ), category, category );
        
        AddObjectFunction( functor,
                           
          function( object )
            local matrix;
            
            matrix := basis_of_module( UnderlyingMatrix( object ) );
            
            return as_presentation( matrix, DegreeList( Range( RelationMorphism( object ) ) ), HomalgRing( matrix ) );
            
        end );
        
        AddMorphismFunction( functor,
                             
          function( new_source, morphism, new_range )
            local matrix;
            
            matrix := UnderlyingMatrix( morphism );
            
            matrix := decide_zero( matrix, UnderlyingMatrix( new_range ) );
            
            return GradedPresentationMorphismByFreyd( new_source, matrix, new_range );
            
        end );
        
        return functor;
        
    end );
    
end );

BindGlobal( "INSTALL_FUNCTOR_GRADED_STANDARD_MODULE",
            
  function( )
    
    INSTALL_FUNCTOR_GRADED_STANDARD_MODULE_METHODS(
            FunctorStandardGradedModuleLeft,
            FpGradedLeftModules,
            BasisOfRowModule,
            DecideZeroRows,
            FpGradedLeftModuleByFreyd );
    
    INSTALL_FUNCTOR_GRADED_STANDARD_MODULE_METHODS(
            FunctorStandardGradedModuleRight,
            FpGradedRightModules,
            BasisOfColumnModule,
            DecideZeroColumns,
            FpGradedRightModuleByFreyd );
    
end );

INSTALL_FUNCTOR_GRADED_STANDARD_MODULE( );

#######################################
##
## FunctorGetRidOfZeroHomogeneousGenerators
##
#######################################

BindGlobal( "INSTALL_FUNCTOR_GET_RID_OF_ZERO_HOMOGENEOUS_GENERATORS_METHODS",
            
  function( functor_get_rid_of_zero_generators, presentations, get_rid_of_zero_generators_transformation_triple, as_presentation, parity )
    
    InstallMethod( functor_get_rid_of_zero_generators,
                   [ IsHomalgGradedRing ],
                   
      function( ring )
        local category, functor;
        
        category := presentations( ring );
        
        functor := CapFunctor( Concatenation( "Get rid of zero generators for ", Name( category ) ), category, category );
        
        AddObjectFunction( functor,
                           
          function( object )
            local matrix, triple, degrees;
            
            matrix := UnderlyingMatrix( object );
            
            triple := get_rid_of_zero_generators_transformation_triple( matrix );

            degrees := DegreesOfGenerators( object );

            degrees := degrees{NonZeroRows( triple[2] )};
            
            return as_presentation( triple[1], degrees, HomalgRing( triple[1] ) );
            
        end );
        
        if parity = "left" then
            
            AddMorphismFunction( functor,
                    
              function( new_source, morphism, new_range )
                local source_transformation_triple, range_transformation_triple, new_morphism_matrix;
                
                source_transformation_triple := get_rid_of_zero_generators_transformation_triple( UnderlyingMatrix( Source( morphism ) ) );
                
                range_transformation_triple := get_rid_of_zero_generators_transformation_triple( UnderlyingMatrix( Range( morphism ) ) );
                
                new_morphism_matrix := UnderlyingMatrix( morphism );
                
                new_morphism_matrix := source_transformation_triple[ 3 ] * new_morphism_matrix * range_transformation_triple[ 2 ];
                
                return GradedPresentationMorphismByFreyd( new_source, new_morphism_matrix, new_range );
                
            end );
            
        else
              
            AddMorphismFunction( functor,
                    
              function( new_source, morphism, new_range )
                local source_transformation_triple, range_transformation_triple, new_morphism_matrix;
                
                source_transformation_triple := get_rid_of_zero_generators_transformation_triple( UnderlyingMatrix( Source( morphism ) ) );
                
                range_transformation_triple := get_rid_of_zero_generators_transformation_triple( UnderlyingMatrix( Range( morphism ) ) );
                
                new_morphism_matrix := UnderlyingMatrix( morphism );
                
                new_morphism_matrix := range_transformation_triple[ 2 ] * new_morphism_matrix * source_transformation_triple[ 3 ];
                
                return GradedPresentationMorphismByFreyd( new_source, new_morphism_matrix, new_range );
                
            end );
            
        fi;
        
        return functor;
        
    end );
    
end );

BindGlobal( "INSTALL_FUNCTOR_GET_RID_OF_ZERO_HOMOGENEOUS_GENERATORS",
            
  function( )
    
    INSTALL_FUNCTOR_GET_RID_OF_ZERO_HOMOGENEOUS_GENERATORS_METHODS(
            FunctorGetRidOfZeroHomogeneousGeneratorsLeft,
            FpGradedLeftModules,
            NonZeroGeneratorsTransformationTripleLeft,
            FpGradedLeftModuleByFreyd,
            "left" );
    
    INSTALL_FUNCTOR_GET_RID_OF_ZERO_HOMOGENEOUS_GENERATORS_METHODS(
            FunctorGetRidOfZeroHomogeneousGeneratorsRight,
            FpGradedRightModules,
            NonZeroGeneratorsTransformationTripleRight,
            FpGradedRightModuleByFreyd,
            "right" );
    
end );

INSTALL_FUNCTOR_GET_RID_OF_ZERO_HOMOGENEOUS_GENERATORS( );

#######################################
##
## FunctorLessHomogeneousGenerators
##
#######################################

##
InstallMethod( FunctorLessHomogeneousGeneratorsLeft,
               [ IsHomalgGradedRing ],
               
  function( ring )
    local category, functor;
    
    category := FpGradedLeftModules( ring );
    
    functor := CapFunctor( Concatenation( "Less generators for ", Name( category ) ), category, category );
    
    AddObjectFunction( functor,
                       
      function( object )
        local triple, new_object, degrees;
        
        triple := LessGeneratorsTransformationTripleLeft( UnderlyingMatrix( object ) );
        
        new_object := triple[1];
        
        degrees := DegreeList( Range( DeduceSomeMapFromMatrixAndSourceForGradedRows( triple[2], Range( RelationMorphism( object ) ) ) ) );
        
        return FpGradedLeftModuleByFreyd( new_object, degrees, HomalgRing( new_object ) );
        
    end );
    
    AddMorphismFunction( functor,
                         
      function( new_source, morphism, new_range )
        local source_transformation_triple, range_transformation_triple, new_morphism_matrix;
        
        source_transformation_triple := LessGeneratorsTransformationTripleLeft( UnderlyingMatrix( Source( morphism ) ) );
        
        range_transformation_triple := LessGeneratorsTransformationTripleLeft( UnderlyingMatrix( Range( morphism ) ) );
        
        new_morphism_matrix := UnderlyingMatrix( morphism );
        
        new_morphism_matrix := source_transformation_triple[ 3 ] * new_morphism_matrix * range_transformation_triple[ 2 ];
        
        return GradedPresentationMorphismByFreyd( new_source, new_morphism_matrix, new_range );
        
    end );
    
    return functor;
    
end );

##
InstallMethod( FunctorLessHomogeneousGeneratorsRight,
               [ IsHomalgGradedRing ],
               
  function( ring )
    local category, functor;
    
    category := FpGradedRightModules( ring );
    
    functor := CapFunctor( Concatenation( "Less generators for ", Name( category ) ), category, category );
    
    AddObjectFunction( functor,
                       
      function( object )
        local triple, new_object, degrees;
        
        triple := LessGeneratorsTransformationTripleRight( UnderlyingMatrix( object ) );
        
        new_object := triple[1];
        
        degrees := DegreeList( Range( DeduceSomeMapFromMatrixAndSourceForGradedCols( triple[2], Range( RelationMorphism( object ) ) ) ) );
        
        return FpGradedRightModuleByFreyd( new_object, degrees, HomalgRing( new_object ) );
        
    end );
    
    AddMorphismFunction( functor,
                         
      function( new_source, morphism, new_range )
        local source_transformation_triple, range_transformation_triple, new_morphism_matrix;
        
        source_transformation_triple := LessGeneratorsTransformationTripleRight( UnderlyingMatrix( Source( morphism ) ) );
        
        range_transformation_triple := LessGeneratorsTransformationTripleRight( UnderlyingMatrix( Range( morphism ) ) );
        
        new_morphism_matrix := UnderlyingMatrix( morphism );
        
        new_morphism_matrix := range_transformation_triple[ 2 ] * new_morphism_matrix * source_transformation_triple[ 3 ];
        
        return GradedPresentationMorphismByFreyd( new_source, new_morphism_matrix, new_range );
        
    end );
    
    return functor;
    
end );

##
InstallMethod( FunctorDualLeft,
                [ IsHomalgGradedRing ], 
   function( ring )
     local category, functor;
     
     category := FpGradedLeftModules( ring );
     
     functor := CapFunctor( Concatenation( "GradedHom( , R ) functor for ", Name( category ) ), Opposite( category ), category );
     
     AddObjectFunction( functor, 
     
           function( obj )
           local object, mat, N, M, mor; 
           
           object := Opposite( obj );
           
           mat := UnderlyingMatrix( object );
           
           N := FreeLeftPresentation( NrColumns( mat ), ring );
           
           M := FreeLeftPresentation( NrRows( mat ), ring );
           
           mor := GradedPresentationMorphismByFreyd( N, Involution( mat ), M );
           
           return KernelObject( mor );
           
           end );
           
    AddMorphismFunction( functor, 
    
           function( new_source, morphism_, new_range )
           local morphism, matrix_of_morphism, mor1, mor2, mor, mor3, matrix_of_the_source, matrix_of_the_range;
           
           morphism := Opposite( morphism_ );
           
           matrix_of_morphism := UnderlyingMatrix( morphism );
           
           
           mor2 := GradedPresentationMorphismByFreyd( FreeLeftPresentation( NrColumns( matrix_of_morphism ), ring )
                                         , Involution( matrix_of_morphism ), FreeLeftPresentation( NrRows( matrix_of_morphism ), ring ) );
           
           matrix_of_the_range := UnderlyingMatrix( Range( morphism ) );
           
           mor1 := KernelEmbedding( GradedPresentationMorphismByFreyd( FreeLeftPresentation( NrColumns( matrix_of_the_range ), ring )
                                         , Involution( matrix_of_the_range ), FreeLeftPresentation( NrRows( matrix_of_the_range ), ring ) ) );
           
           mor := PreCompose( mor1, mor2 );
           
           matrix_of_the_source := UnderlyingMatrix( Source( morphism ) );
           
           mor3 := GradedPresentationMorphismByFreyd( FreeLeftPresentation( NrColumns( matrix_of_the_source ), ring )
                                         , Involution( matrix_of_the_source ), FreeLeftPresentation( NrRows( matrix_of_the_source ), ring ) );
            
           return KernelLift( mor3, mor );
           
           end );
           
   return functor;
   
end );

##
InstallMethod( FunctorDualRight,
                [ IsHomalgGradedRing ], 
   function( ring )
     local category, functor;
     
     category := FpGradedRightModules( ring );
     
     functor := CapFunctor( Concatenation( "GradedHom( , R ) functor for ", Name( category ) ), Opposite( category ), category );
     
     AddObjectFunction( functor, 
     
           function( obj )
           local object, mat, N, M, mor; 
           
           object := Opposite( obj );
           
           mat := UnderlyingMatrix( object );
           
           N := FreeRightPresentation( NrColumns( mat ), ring );
           
           M := FreeRightPresentation( NrRows( mat ), ring );
           
           mor := GradedPresentationMorphismByFreyd( M, Involution( mat ), N );
           
           return KernelObject( mor );
           
           end );
           
    AddMorphismFunction( functor, 
    
           function( new_source, morphism_, new_range )
           local morphism, matrix_of_morphism, mor1, mor2, mor, mor3, matrix_of_the_source, matrix_of_the_range;
           
           morphism := Opposite( morphism_ );
           
           matrix_of_morphism := UnderlyingMatrix( morphism );
           
           mor2 := GradedPresentationMorphismByFreyd( FreeRightPresentation( NrRows( matrix_of_morphism ), ring )
                                         , Involution( matrix_of_morphism ), FreeRightPresentation( NrColumns( matrix_of_morphism ), ring ) );
           
           matrix_of_the_range := UnderlyingMatrix( Range( morphism ) );
           
           mor1 := KernelEmbedding( GradedPresentationMorphismByFreyd( FreeRightPresentation( NrRows( matrix_of_the_range ), ring )
                                         , Involution( matrix_of_the_range ), FreeRightPresentation( NrColumns( matrix_of_the_range ), ring ) ) );
           
           mor := PreCompose( mor1, mor2 );
           
           matrix_of_the_source := UnderlyingMatrix( Source( morphism ) );
           
           mor3 := GradedPresentationMorphismByFreyd( FreeRightPresentation( NrRows( matrix_of_the_source ), ring )
                                         , Involution( matrix_of_the_source ), FreeRightPresentation( NrColumns( matrix_of_the_source ), ring ) );
            
           return KernelLift( mor3, mor );
           
           end );
           
   return functor;
   
end );

##
InstallMethod( FunctorDoubleDualLeft,
                [ IsHomalgGradedRing ], 
   function( ring )
     local category, functor, dual_functor;
     
     category := FpGradedLeftModules( ring );
     
     functor := CapFunctor( Concatenation( " GradedHom( GradedHom( , R ), R ) functor for ", Name( category ) ), category, category );
     
     dual_functor := FunctorDualLeft( ring );
    
     AddObjectFunction( functor, 
     
           function( object )
           
             return ApplyFunctor( dual_functor, Opposite( ApplyFunctor( dual_functor, Opposite( object ) ) ) );
             
           end );
           
    AddMorphismFunction( functor, 
    
           function( new_source, morphism, new_range )
           
             return ApplyFunctor( dual_functor, Opposite( ApplyFunctor( dual_functor, Opposite( morphism ) ) ) );
           
           end );
           
   return functor;
   
end );

##
InstallMethod( FunctorDoubleDualRight,
                [ IsHomalgGradedRing ], 
   function( ring )
     local category, functor, dual_functor;
     
     category := FpGradedRightModules( ring );
     
     functor := CapFunctor( Concatenation( " GradedHom( GradedHom( , R ), R ) functor for ", Name( category ) ), category, category );
     
     dual_functor := FunctorDualRight( ring );
    
     AddObjectFunction( functor, 
     
           function( object )
           
             return ApplyFunctor( dual_functor, Opposite( ApplyFunctor( dual_functor, Opposite( object ) ) ) );
             
           end );
           
    AddMorphismFunction( functor, 
    
           function( new_source, morphism, new_range )
           
             return ApplyFunctor( dual_functor, Opposite( ApplyFunctor( dual_functor, Opposite( morphism ) ) ) );
           
           end );
           
   return functor;
   
end );
