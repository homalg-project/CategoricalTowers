#! @System LeftPresentation

LoadPackage( "M2" );

#! @Example
ZZ := HomalgRingOfIntegers( );
#! Z
M := HomalgMatrix( "[ \
2, 3, 4, \
5, 6, 7  \
]", 2, 3, ZZ );
#! <A 2 x 3 matrix over an internal ring>
M := LeftPresentation( M );
#! <A non-torsion left module presented by 2 relations for 3 generators>
Display( M );
#! [ [  2,  3,  4 ],
#!   [  5,  6,  7 ] ]
#! 
#! Cokernel of the map
#! 
#! Z^(1x2) --> Z^(1x3),
#! 
#! currently represented by the above matrix
rels := RelationsOfModule( M );
#! <A set of 2 relations for 3 generators of a homalg left module>
MatrixOfRelations( M );
#! <A non-zero 2 x 3 matrix over an internal ring>
MatrixOfRelations( rels );
#! <A non-zero 2 x 3 matrix over an internal ring>
gens := GeneratorsOfModule( M );
#! <A set of 3 generators of a homalg left module>
MatrixOfGenerators( M );
#! <An unevaluated 3 x 3 matrix over an internal ring>
MatrixOfGenerators( gens );
#! <An unevaluated 3 x 3 matrix over an internal ring>
ByASmallerPresentation( M );
#! <A rank 1 left module presented by 1 relation for 2 generators>
Display( M );
#! Z/< 3 > + Z^(1 x 1)
#! @EndExample
