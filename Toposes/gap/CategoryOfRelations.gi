# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

## A morphism in the category of relations is given by a span:
##
##   R
##  / \
## v   v
## S   T

##
InstallOtherMethodForCompilerForCAP( PseudoInverse,
        "for a category of relations and a morphism in the category of relations",
        [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
        
  function( Rel, relation )
    local span;
    
    ## Pair( R, Pair( R → S, R → T ) );
    span := MorphismDatum( Rel, relation );
    
    ## switch the source leg and the range leg of the span
    return MorphismConstructor( Rel,
                   Range( relation ),
                   Pair( span[1],
                         Pair( span[2][2], span[2][1] ) ),
                   Source( relation ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( PseudoInverseOfHonestMorphism,
        "for a category of relations and a morphism in the underlying category",
        [ IsCategoryOfRelations, IsCapCategoryMorphism ],
        
  function( Rel, morphism )
    
    return PseudoInverse( Rel, AsMorphismInCategoryOfRelations( Rel, morphism ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( EmbeddingOfRelationInDirectProduct,
        "for a category of relations and a morphism in the category of relations",
        [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
        
  function( Rel, relation )
    local C, span;
    
    C := UnderlyingCategory( Rel );
    
    span := MorphismDatum( Rel, relation ); ## Pair( I, Pair( I → S, I → T ) )
    
    return ImageEmbedding( C, ## the mono R ↪ S × T of the epi-mono factorization of I → S × T
                   UniversalMorphismIntoDirectProduct( C, ## I → S × T
                           [ Range( span[2][1] ), Range( span[2][2] ) ],
                           span[1],
                           [ span[2][1], span[2][2] ] ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( SourceProjection,
        "for a category of relations and a morphism in the category of relations",
        [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
        
  function( Rel, relation )
    local C, emb, ST;
    
    C := UnderlyingCategory( Rel );
    
    emb := EmbeddingOfRelationInDirectProduct( Rel, relation ); ## R ↪ S × T
    
    ## [ S, T ]
    ST := [ ObjectDatum( Rel, Source( relation ) ), ObjectDatum( Rel, Range( relation ) ) ];
    
    ## R ↪ S × T → S
    return PreCompose( C, emb, ProjectionInFactorOfDirectProduct( C, ST, 1 ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( RangeProjection,
        "for a category of relations and a morphism in the category of relations",
        [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
        
  function( Rel, relation )
    local C, emb, ST;
    
    C := UnderlyingCategory( Rel );
    
    emb := EmbeddingOfRelationInDirectProduct( Rel, relation ); ## R ↪ S × T
    
    ## [ S, T ]
    ST := [ ObjectDatum( Rel, Source( relation ) ), ObjectDatum( Rel, Range( relation ) ) ];
    
    ## R ↪ S × T → T
    return PreCompose( C, emb, ProjectionInFactorOfDirectProduct( C, ST, 2 ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( StandardizedSpan,
        "for a category of relations and a morphism in the category of relations",
        [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
        
  function( Rel, relation )
    
    return Pair( Source( EmbeddingOfRelationInDirectProduct( Rel, relation ) ),
                 Pair( SourceProjection( Rel, relation ),
                       RangeProjection( Rel, relation ) ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( MorphismByStandardizedSpan,
        "for a category of relations and a morphism in the category of relations",
        [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
        
  function( Rel, relation )
    
    return MorphismConstructor( Rel,
                   Source( relation ),
                   StandardizedSpan( Rel, relation ),
                   Range( relation ) );
    
end );

## a morphism in RelC comes from a morphism A -f-> B in C if the span defining the morhism
## is congruent in the sense of IsCongruentForMorphisms below to the span [ 1_A, f ],
## this is equivalent to saying that the domain of the morphism
## (=source leg of the standardized span) is an isomorphism in C
##
InstallOtherMethodForCompilerForCAP( IsHonest,
        "for a category of relations and a morphism in the category of relations",
        [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],
        
  function( Rel, relation )
    
    return IsIsomorphism( UnderlyingCategory( Rel ), SourceProjection( Rel, relation ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( HonestRepresentative,
        "for a category of relations and a morphism in the category of relations",
        [ IsCategoryOfRelations, IsMorphismInCategoryOfRelations ],

  function( Rel, relation )
    local C;
    
    C := UnderlyingCategory( Rel );
    
    return PreCompose( C, InverseForMorphisms( C, SourceProjection( Rel, relation ) ), RangeProjection( Rel, relation ) );
    
end );

##
InstallMethod( CategoryOfRelations,
        "for a CAP category which is cartesian",
        [ IsCapCategory and IsCartesianCategory ],
        
  function( C )
    local Rel;
    
    ##
    Rel := CreateCapCategory( Concatenation( "CategoryOfRelations( ", Name( C ), " )" ), IsCategoryOfRelations, IsObjectInCategoryOfRelations, IsMorphismInCategoryOfRelations, IsCapCategoryTwoCell );
    
    ## In order to have composition in Rel we need C to have fiber products
    ## In order to replace the span with a single morphism in C we need C to have products
    ## In order to replace this single morphism in C by a monomorphism in C we need C to have images
    
    ##
    SetUnderlyingCategory( Rel, C );
    
    ##
    Rel!.category_as_first_argument := true;
    
    ##
    Rel!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingCategory",
             ],
           );
    
    ## "the objects of Rel are the objects of C"
    ## here: object is an object in C
    AddObjectConstructor( Rel,
      function( Rel, object )
        
        return CreateCapCategoryObjectWithAttributes( Rel,
                       UnderlyingCell, object );
        
    end );
    
    ##
    AddObjectDatum( Rel,
      function( Rel, object )
        
        return UnderlyingCell( object );
        
    end );
    
    ## "a morphism in Rel is a span in C"
    ## here span is a Pair( I, Pair( I → ObjectDatum( S ), I → ObjectDatum( T ) ) ) in C
    AddMorphismConstructor( Rel,
      function( Rel, S, span, T )
        
        return CreateCapCategoryMorphismWithAttributes( Rel,
                       S,
                       T,
                       UnderlyingSpan, span );
        
    end );
    
    ##
    AddMorphismDatum( Rel,
      function( Rel, relation )
        
        return UnderlyingSpan( relation );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( Rel,
      function( Rel, object )
        local C;
        
        C := UnderlyingCategory( Rel );
        
        if not IsIdenticalObj( CapCategory( ObjectDatum( Rel, object ) ), C ) then
            ## the underlying object does not belong to the underlying category
            return false;
        elif not IsWellDefinedForObjects( C, ObjectDatum( Rel, object ) ) then
            ## the underlying object well-defined as an object in the underlying category
            return false;
        fi;
        
        return true;
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( Rel,
      function( Rel, relation )
        local C, span;
        
        C := UnderlyingCategory( Rel );
        
        span := MorphismDatum( Rel, relation );
        
        if not ForAll( span, m -> IsIdenticalObj( CapCategory( m ), UnderlyingCategory( Rel ) ) ) then
            ## at least one of two defining morphisms do not belong to the underlying category
            return false;
        elif not IsWellDefinedForObjects( C, span[1] ) then
            return false;
        elif not ( IsWellDefinedForMorphisms( C, span[2][1] ) and IsWellDefinedForMorphisms( C, span[2][2] ) ) then
            ## at least one of the two defining morphisms is not well-defined as a morphism in the underlying category
            return false;
        fi;
        
        return true;
        
    end );
    
    ##
    AddIsEqualForObjects( Rel,
      function( Rel, object1, object2 )
        
        return IsEqualForObjects( UnderlyingCategory( Rel ), ObjectDatum( Rel, object1 ), ObjectDatum( Rel, object2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( Rel,
      function( Rel, relation1, relation2 )
        local C, span1, span2;
        
        C := UnderlyingCategory( Rel );
        
        span1 := MorphismDatum( Rel, relation1 );
        span2 := MorphismDatum( Rel, relation2 );
        
        return IsEqualForObjects( C, span1[1], span2[1] ) and
               IsEqualForMorphisms( C, span1[2][1], span2[2][1] ) and
               IsEqualForMorphisms( C, span1[2][2], span2[2][2] );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( Rel,
      function( Rel, relation1, relation2 )
        local emb1, emb2;
        
        ## the embeddings in the underlying category of the direct product
        ## of the underlying objects of the common source and common target
        emb1 := EmbeddingOfRelationInDirectProduct( Rel, relation1 );
        emb2 := EmbeddingOfRelationInDirectProduct( Rel, relation2 );
        
        ## do the embeddings emb1 and emb2 define the same subobject of the direct product
        return IsEqualAsSubobjects( UnderlyingCategory( Rel ), emb1, emb2 );
        
    end );
    
    if CanCompute( C, "FiberProduct" ) and
       CanCompute( C, "ProjectionInFactorOfFiberProductWithGivenFiberProduct" ) then
        
        ## Composition here means taking the pullback of the adjacent legs of the spans
        ##
        ##      K
        ##     / \
        ##    v   v
        ##    I   J
        ##   / \ / \
        ##  v   v   v
        ## S    U   T
        ##
        AddPreCompose( Rel,
          function( Rel, pre_relation, post_relation )
            local C, diagram, K;
            
            C := UnderlyingCategory( Rel );
            
            diagram := [ MorphismDatum( Rel, pre_relation )[2][2], MorphismDatum( Rel, post_relation )[2][1] ];
            
            K := FiberProduct( C, diagram );
            
            return MorphismConstructor( Rel,
                           Source( pre_relation ),
                           Pair( K,
                                 Pair( PreCompose( C,
                                         ProjectionInFactorOfFiberProductWithGivenFiberProduct( C, diagram, 1, K ),
                                         MorphismDatum( Rel, pre_relation )[2][1] ),
                                       PreCompose( C,
                                         ProjectionInFactorOfFiberProductWithGivenFiberProduct( C, diagram, 2, K ),
                                         MorphismDatum( Rel, post_relation )[2][2] ) ) ),
                           Range( post_relation ) );
            
        end );
        
    fi;
    
    ##    A
    ##   / \
    ##  v   v
    ##  A   A
    ##
    AddIdentityMorphism( Rel,
      function( Rel, object )
        local A, id;
        
        A := ObjectDatum( Rel, object );
        
        id := IdentityMorphism( UnderlyingCategory( Rel ), A );
        
        return MorphismConstructor( Rel,
                       object,
                       Pair( A,
                             Pair( id, id ) ),
                       object );
        
    end );
    
    if CanCompute( C, "SubobjectClassifier" ) and
       CanCompute( C, "HomomorphismStructureOnObjects" ) and
       CanCompute( C, "DirectProduct" ) and
       HasRangeCategoryOfHomomorphismStructure( C ) then
       ##IsCategoryOfFinSets( RangeCategoryOfHomomorphismStructure( C ) ) then
        
        SetRangeCategoryOfHomomorphismStructure( Rel, RangeCategoryOfHomomorphismStructure( C ) );
        
        ##
        AddHomomorphismStructureOnObjects( Rel,
          function( Rel, object1, object2 )
            local C;
            
            C := UnderlyingCategory( Rel );
            
            return HomomorphismStructureOnObjects( C,
                           DirectProduct( C, ObjectDatum( Rel, object1 ), ObjectDatum( Rel, object2 ) ),
                           SubobjectClassifier( C ) );
            
        end );
        
    fi;
    
    Finalize( Rel );
    
    return Rel;
    
end );

##
InstallOtherMethod( \/,
        "for an object in the underlying category and a category of relations",
        [ IsCapCategoryObject, IsCategoryOfRelations ],
        
  function( M, Rel )
    
    Assert( 0, IsIdenticalObj( CapCategory( M ), UnderlyingCategory( Rel ) ) );
    
    return ObjectConstructor( Rel, M );
    
end );

##
InstallOtherMethodForCompilerForCAP( AsMorphismInCategoryOfRelations,
        "for a category of relations and a morphism in the underlying category",
        [ IsCategoryOfRelations, IsCapCategoryMorphism ],
        
  function( Rel, morphism )
    local C, S, T, rel;
    
    C := UnderlyingCategory( Rel );
    
    S := Source( morphism );
    
    T := Range( morphism );
    
    rel := MorphismConstructor( Rel,
                   ObjectConstructor( Rel, S ),
                   Pair( S,
                         Pair( IdentityMorphism( C, S ), morphism ) ),
                   ObjectConstructor( Rel, T ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsHonest( rel, true );
    
    return rel;
    
end );

##
InstallOtherMethodForCompilerForCAP( UnitObjectInCategoryOfRelations,
        "for a category of relations",
        [ IsCategoryOfRelations ],
        
  function( Rel )
    
    return ObjectConstructor( Rel, TerminalObject( UnderlyingCategory( Rel ) ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( MaximalRelationIntoTerminalObject,
        "for a category of relations and for an object in the underlying category",
        [ IsCategoryOfRelations, IsObjectInCategoryOfRelations ],
        
  function( Rel, object )
    local C, datum;
    
    C := UnderlyingCategory( Rel );
    
    datum := ObjectDatum( Rel, object );
    
    return MorphismConstructor( Rel,
                   object,
                   Pair( datum,
                         Pair( IdentityMorphism( C, datum ),
                               UniversalMorphismIntoTerminalObject( C, datum ) ) ),
                   UnitObjectInCategoryOfRelations( Rel ) );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
        [ IsObjectInCategoryOfRelations ],
        
  function( a )
    
    Print( "An object in the category of relations given by: " );
    
    ViewObj( ObjectDatum( a ) );
    
end );

##
InstallMethod( Display,
        [ IsObjectInCategoryOfRelations ],
        
  function( a )
    
    Display( ObjectDatum( a ) );
    
    Display( "\nAn object in the category of relations given by the above data" );
    
end );
