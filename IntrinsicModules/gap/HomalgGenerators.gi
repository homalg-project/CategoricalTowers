# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for properties:
#
####################################

##
InstallOtherMethod( IsZero,
        "for a set of generators of homalg/CAP modules",
        [ IsHomalgGenerators and IsLazyGeneralizedEmbeddingInAmbientObject ],
        
  function( gens )
    
    return IsZero( UnderlyingCell( gens ) );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( UpdateHomalgGenerators,
        "for an object and a set of generators of homalg/CAP modules",
        [ IsObject,
          IsHomalgGenerators and IsLazyGeneralizedEmbeddingInAmbientObject ],
        
  function( o, gens )
    
    if HasProcedureToReadjustGenerators( o ) then
        SetProcedureToReadjustGenerators( gens, ProcedureToReadjustGenerators( o ) );
    fi;
    
    if HasProcedureToNormalizeGenerators( o ) then
        SetProcedureToNormalizeGenerators( gens, ProcedureToNormalizeGenerators( o ) );
    fi;
    
end );

##
InstallMethod( HasNrGenerators,
        "for a set of generators of homalg/CAP modules",
        [ IsHomalgGenerators and IsLazyGeneralizedEmbeddingInAmbientObject ],

  function( gens )
    
    return HasNrGenerators( UnderlyingCell( gens ) );
    
end );

##
InstallMethod( NrGenerators,
        "for a set of generators of homalg/CAP modules",
        [ IsHomalgGenerators and IsLazyGeneralizedEmbeddingInAmbientObject ],

  function( gens )
    
    return NrGenerators( UnderlyingCell( gens ) );
    
end );

##
InstallMethod( MatrixOfGenerators,
        "for a set of generators of a homalg/CAP module",
        [ IsHomalgGenerators and IsLazyGeneralizedEmbeddingInAmbientObject ],
        
  function( gens )
    
    return UnderlyingMatrix( EmbeddingInAmbientObject( gens ) );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( HomalgGeneratorsForModule,
        "for a lazy evaluated generalized embedding in ambient object and a left homalg/CAP module",
        [ IsLazyGeneralizedEmbeddingInAmbientObject,
          IsHomalgModule and IsHomalgLeftObjectOrMorphismOfLeftObjects ],
        
  function( gens, M )
    
    SetFilterObj( gens,
            IsHomalgGeneratorsOfLeftModule and
            IsGeneratorsOfFinitelyGeneratedModuleRep );
    
    UpdateHomalgGenerators( M, gens );
    
    return gens;
    
end );

##
InstallMethod( HomalgGeneratorsForModule,
        "for a lazy evaluated generalized embedding in ambient object and a right homalg/CAP module",
        [ IsLazyGeneralizedEmbeddingInAmbientObject,
          IsHomalgModule and IsHomalgRightObjectOrMorphismOfRightObjects ],
        
  function( gens, M )
    
    SetFilterObj( gens,
            IsHomalgGeneratorsOfRightModule and
            IsGeneratorsOfFinitelyGeneratedModuleRep );
    
    UpdateHomalgGenerators( M, gens );
    
    return gens;
    
end );
