#! @BeginChunk SubobjectClassifier

LoadPackage( "FunctorCategories" );

#! The subobject classifier of the <C>FunctorCategory</C>$(C^\mathrm{op}, H)$,
#! where $H$:=<C>RangeCategoryOfHomomorphismStructure</C>($C$) is the
#! functor of sieves, mapping each object $c \in C^\mathrm{op}$ to the
#! set of subobjects of the representable functor $\mathrm{Hom}_C(-,c)$.

#! @Example
q := RightQuiver( "q(1)[a:1->1]" );
#! q(1)[a:1->1]
Fq := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )
M0 := Fq / [ [ Fq.a^3, Fq.1 ] ];
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a = 1 ]
PShM0 := PreSheaves( M0 );
#! FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = 1 ], SkeletalFinSets )
Omega0 := SubobjectClassifier( PShM0 );
#! <An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = 1 ], SkeletalFinSets )>
Display( Omega0 );
#! Image of <(1)>:
#! 2
#! 
#! Image of (1)-[(a)]->(1):
#! [ 2, [ 0, 1 ], 2 ]
#! 
#! An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = 1 ], SkeletalFinSets )
#! given by the above data
e := Exponential( Omega0, Omega0 );
#! <An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = 1 ], SkeletalFinSets )>
Display( e );
#! Image of <(1)>:
#! 4
#! 
#! Image of (1)-[(a)]->(1):
#! [ 4, [ 0, 1, 2, 3 ], 4 ]
#! 
#! An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = 1 ], SkeletalFinSets )
#! given by the above data
ev0 := CartesianEvaluationMorphism( Omega0, Omega0 );
#! <A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = 1 ], SkeletalFinSets )>
Display( ev0 );
#! Image of <(1)>:
#! [ 8, [ 0, 0, 0, 1, 1, 0, 1, 1 ], 2 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = 1 ], SkeletalFinSets )
#! given by the above data
M1 := Fq / [ [ Fq.a^3, Fq.a ] ];
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a = a ]
PShM1 := PreSheaves( M1 );
#! FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a ], SkeletalFinSets )
Omega1 := SubobjectClassifier( PShM1 );
#! <An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = a ], SkeletalFinSets )>
Display( Omega1 );
#! Image of <(1)>:
#! 3
#! 
#! Image of (1)-[(a)]->(1):
#! [ 3, [ 0, 2, 2 ], 3 ]
#! 
#! An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a ], SkeletalFinSets )
#! given by the above data
M2 := Fq / [ [ Fq.a^3, Fq.a^2 ] ];
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a = a*a ]
PShM2 := PreSheaves( M2 );
#! FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
Omega2 := SubobjectClassifier( PShM2 );
#! <An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = a*a ], SkeletalFinSets )>
Display( Omega2 );
#! Image of <(1)>:
#! 4
#! 
#! Image of (1)-[(a)]->(1):
#! [ 4, [ 0, 2, 3, 3 ], 4 ]
#! 
#! An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
true2 := TruthMorphismOfTrue( PShM2 );
#! <A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = a*a ], SkeletalFinSets )>
Display( true2 );
#! Image of <(1)>:
#! [ 1, [ 3 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
false2 := TruthMorphismOfFalse( PShM2 );
#! <A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = a*a ], SkeletalFinSets )>
Display( false2 );
#! Image of <(1)>:
#! [ 1, [ 0 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
iota := AsMorphismInFunctorCategory( EmbeddingOfSieveFunctor( M2 ) );
#! <A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = a*a ], SkeletalFinSets )>
Display( iota );
#! Image of <(1)>:
#! [ 4, [ 0, 1, 3, 7 ], 8 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
Range( iota );
#! <An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#!  / [ a*a*a = a*a ], SkeletalFinSets )>
Display( Range( iota ) );
#! Image of <(1)>:
#! 8
#! 
#! Image of (1)-[(a)]->(1):
#! [ 8, [ 0, 3, 4, 7, 0, 3, 4, 7 ], 8 ]
#! 
#! An object in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
t2 := SubobjectOfClassifyingMorphism( true2 );
#! <A monomorphism in FunctorCategory( FreeCategory(
#!  RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a*a ], SkeletalFinSets )>
Display( t2 );
#! Image of <(1)>:
#! [ 1, [ 0 ], 1 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
f2 := SubobjectOfClassifyingMorphism( false2 );
#! <A monomorphism in FunctorCategory( FreeCategory(
#!  RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a*a ], SkeletalFinSets )>
Display( f2 );
#! Image of <(1)>:
#! [ 0, [  ], 1 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
H := HomStructure( Omega2, Omega2 );
#! <An object in SkeletalFinSets>
Display( H );
#! 8
T2 := DistinguishedObjectOfHomomorphismStructure( PShM2 );
#! <An object in SkeletalFinSets>
L := List( H, i ->
       InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
               Omega2, Omega2, MapOfFinSets( T2, [ i ], H ) ) );;
Length( L );
#! 8
Perform( L, Display );
#! Image of <(1)>:
#! [ 4, [ 0, 0, 0, 0 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
#! Image of <(1)>:
#! [ 4, [ 0, 1, 2, 3 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
#! Image of <(1)>:
#! [ 4, [ 0, 2, 3, 3 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
#! Image of <(1)>:
#! [ 4, [ 0, 3, 3, 3 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
#! Image of <(1)>:
#! [ 4, [ 3, 0, 0, 0 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
#! Image of <(1)>:
#! [ 4, [ 3, 1, 2, 3 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
#! Image of <(1)>:
#! [ 4, [ 3, 2, 3, 3 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
#! Image of <(1)>:
#! [ 4, [ 3, 3, 3, 3 ], 4 ]
#! 
#! A morphism in FunctorCategory( FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) )
#! / [ a*a*a = a*a ], SkeletalFinSets )
#! given by the above data
#! @EndExample
#! @EndChunk
