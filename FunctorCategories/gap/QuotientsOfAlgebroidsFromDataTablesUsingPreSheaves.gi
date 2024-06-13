# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

#
#  Interpret an algebroid from data tables A as an object in PreSheaves(A^op ⊗ A, k-rows).
#
#  For two morphims: g: X --> Y in A^op   &  f: U --> V in A
#
#  we send the following diagram in A^op ⊗ A
#                     _
#          _          X⊗f         _
#          X⊗U  --------------→  X⊗V
#      _    |                      |  _
#      g⊗U  |                      |  g⊗V
#           |         _            |
#          _⋎         Y⊗f         _⋎
#          Y⊗U  --------------→  Y⊗V
#
#  to the diagram in k-rows:
#
#                     hom(f,X)
#         hom(U,X)  ≺----------  hom(V,X)
#           ⋏                      ⋏
#           |                      |
# hom(U,g)  |                      |  hom(V,g)
#           |         hom(f,Y)     |
#         hom(U,Y)  ≺----------  hom(V,Y)
#
##
InstallMethod( AlgebroidAsObjectInPreSheavesCategory,
          [ IsAlgebroidFromDataTables ],
          
  function ( A )
    local q, nr_objs, nr_gmors, images_of_objs, images_of_gmorphisms, PSh;
    
    q := UnderlyingQuiver( A );
    
    nr_objs := NumberOfObjects( q );
    nr_gmors := NumberOfMorphisms( q );
    
    images_of_objs :=
      _ConcatenationLazyHLists_( LazyHList( [ 1 .. nr_objs ],
          l -> LazyHList( [ 1 .. nr_objs ],
            r -> HomomorphismStructureOnObjects( A, SetOfObjects( A )[r], SetOfObjects( A )[l] ) ) ) );
    
    images_of_gmorphisms :=
                _ConcatenationLazyHLists_(
                     [ _ConcatenationLazyHLists_( LazyHList( [ 1 .. nr_objs ], l -> LazyHList( [ 1 .. nr_gmors ],
                        r -> HomomorphismStructureOnMorphisms( A, SetOfGeneratingMorphisms( A )[r], IdentityMorphism( SetOfObjects( A )[l] ) ) ) ) ),
                       _ConcatenationLazyHLists_( LazyHList( [ 1 .. nr_gmors ], l -> LazyHList( [ 1 .. nr_objs ],
                        r -> HomomorphismStructureOnMorphisms( A, IdentityMorphism( SetOfObjects( A )[r] ), SetOfGeneratingMorphisms( A )[l] ) ) ) ) ] );
    
    PSh := PreSheaves( TensorProductOfAlgebroids( OppositeAlgebroid( A ), A ) );
    
    return ObjectConstructor( PSh, Pair( images_of_objs, images_of_gmorphisms ) );
    
end );

##
InstallMethod( AssociatedMorphismIntoAlgebroidAsObjectInPreSheavesCategory,
          [ IsMorphismInAlgebroidFromDataTables ],
          
  function ( m )
    local A, A_op, T;
    
    A := CapCategory( m );
    A_op := OppositeAlgebroid( A );
    T := TensorProductOfAlgebroids( A_op, A );
    
    return MorphismFromRepresentableByYonedaLemma(
                PreSheaves( T ),
                ElementaryTensor( SetOfObjects( A_op )[ObjectIndex( Target( m ) )], Source( m ), T ),
                InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( A, m ),
                AlgebroidAsObjectInPreSheavesCategory( A ) );
    
end );
