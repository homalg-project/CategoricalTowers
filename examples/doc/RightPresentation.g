#! @Chunk RightPresentation

LoadPackage( "M2" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
M := HomalgMatrix( "[ \
2, 3, 4, \
5, 6, 7  \
]", 2, 3, ZZ );
#! <A 2 x 3 matrix over an internal ring>
M := RightPresentation( M );
#! <A right module on 2 generators satisfying 3 relations>
Display( M );
#! [ [  2,  3,  4 ],
#!   [  5,  6,  7 ] ]
#! 
#! Cokernel of the map
#! 
#! Z^(3x1) --> Z^(2x1),
#! 
#! currently represented by the above matrix
rels := RelationsOfModule( M );
#! <A set of 3 relations for 2 generators of a homalg right module>
MatrixOfRelations( M );
#! <A non-zero 2 x 3 matrix over an internal ring>
MatrixOfRelations( rels );
#! <A non-zero 2 x 3 matrix over an internal ring>
gens := GeneratorsOfModule( M );
#! <A set of 2 generators of a homalg right module>
MatrixOfGenerators( M );
#! <An unevaluated 2 x 2 matrix over an internal ring>
MatrixOfGenerators( gens );
#! <An unevaluated 2 x 2 matrix over an internal ring>
ByASmallerPresentation( M );
#! <A non-zero cyclic torsion right module on a cyclic generator
#!  satisfying 1 relation>
Display( M );
#! Z/< 3 >
#! @EndExample
