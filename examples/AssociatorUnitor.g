LoadPackage( "CatReps" );
c3c3 := ConcreteCategoryForCAP( [ [2,3,1], [4,5,6], [,,,5,6,4] ] );
qc3c3 := RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" );
HOMALG_MATRICES.PreferDenseMatrices := true;
GF3 := HomalgRingOfIntegers( 3 );
GF3q := PathAlgebra( GF3, qc3c3 );
rel := [GF3q.a^3-GF3q.1, GF3q.c^3-GF3q.2, GF3q.a*GF3q.b-GF3q.b*GF3q.c];;
kq := Algebroid( GF3q, rel );
kq2 := kq^2;
counit := rec( a := 1, b := 1, c := 1 );
comult := rec( a := PreCompose( kq2.ax1, kq2.1xa ),
               b := PreCompose( kq2.1xb, kq2.bx2 ),
               c := PreCompose( kq2.cx2, kq2.2xc ) );
AddBialgebroidStructure( kq, counit, comult );
counit := Counit( kq );
comult := Comultiplication( kq );
kmat := MatrixCategory( GF3 );
CatReps := Hom( kq, kmat );
zero := ZeroObject( CatReps );
unit := TensorUnit( CatReps );
V1 := VectorSpaceObject( 5, GF3 );
V2 := VectorSpaceObject( 4, GF3 );
d := One(GF3) * [[1,1,0,0,0],[0,1,1,0,0],[0,0,1,0,0],[0,0,0,1,1],[0,0,0,0,1]];;
d := HomalgMatrix( d, 5, 5, GF3 );;
d := VectorSpaceMorphism( V1, d, V1 );;
e := One(GF3) * [[0,1,0,0],[0,0,1,0],[0,0,0,0],[0,1,0,1],[0,0,1,0]];;
e := HomalgMatrix( e, 5, 4, GF3 );;
e := VectorSpaceMorphism( V1, e, V2 );;
f := One(GF3) * [[1,1,0,0],[0,1,1,0],[0,0,1,0],[0,0,0,1]];;
f := HomalgMatrix( f, 4, 4, GF3 );;
f := VectorSpaceMorphism( V2, f, V2 );;
nine := AsObjectInHomCategory( kq, [ V1, V2 ], [ d, e, f ] );;
fortyone := TensorProductOnObjects( nine, nine );;
etas := WeakDirectSumDecomposition( fortyone );;
eta := etas[9];;
six := Source( eta );;
thirtyfive := CokernelObject( eta );
#! <(1)->22, (2)->13; (a)->22x22, (b)->22x13, (c)->13x13>

#! Now we check the associator if the pentagonal diagram commutes:

A := six;;
B := nine;;
C := thirtyfive;;
D := fortyone;
#! <(1)->25, (2)->16; (a)->25x25, (b)->25x16, (c)->16x16>
ApB := TensorProductOnObjects( A, B );;
BpC := TensorProductOnObjects( B, C );;
CpD := TensorProductOnObjects( C, D );
#! <(1)->550, (2)->208; (a)->550x550, (b)->550x208, (c)->208x208>
sBCD := TensorProductOnObjects( B, CpD );;
rBCD := TensorProductOnObjects( BpC, D );;
AssociatorRightToLeftWithGivenTensorProducts( sBCD, B, C, D, rBCD );
#! <(1)->2750x2750, (2)->832x832>
TensorProductOnMorphisms(
        IdentityMorphism( A ),
        AssociatorRightToLeftWithGivenTensorProducts( sBCD, B, C, D, rBCD ) );
#! <(1)->8250x8250, (2)->2496x2496>
sABpCD := TensorProductOnObjects( A, TensorProductOnObjects( BpC, D ) );;
rABpCD := TensorProductOnObjects( TensorProductOnObjects( A, BpC ), D );;
AssociatorRightToLeftWithGivenTensorProducts( sABpCD, A, BpC, D, rABpCD );
#! <(1)->8250x8250, (2)->2496x2496>
sABC := TensorProductOnObjects( A, BpC );;
rABC := TensorProductOnObjects( ApB, C );;
AssociatorRightToLeftWithGivenTensorProducts( sABC, A, B, C, rABC );;
TensorProductOnMorphisms( AssociatorRightToLeftWithGivenTensorProducts(
sABC, A, B, C, rABC ), IdentityMorphism( D ) );
#! <(1)->8250x8250, (2)->2496x2496>
lhs := PreCompose( [
               TensorProductOnMorphisms(
                       IdentityMorphism( A ),
                       AssociatorRightToLeftWithGivenTensorProducts( sBCD, B, C, D, rBCD ) ),
               AssociatorRightToLeftWithGivenTensorProducts( sABpCD, A, BpC, D, rABpCD ),
               TensorProductOnMorphisms(
                       AssociatorRightToLeftWithGivenTensorProducts( sABC, A, B, C, rABC ),
                       IdentityMorphism( D ) )
               ] );
#! <(1)->8250x8250, (2)->2496x2496>
sABCpD := TensorProductOnObjects( A, TensorProductOnObjects( B, CpD ) );;
rABCpD := TensorProductOnObjects( ApB, CpD );;
AssociatorRightToLeftWithGivenTensorProducts( sABCpD, A, B, CpD, rABCpD );;
sApBCD := TensorProductOnObjects( ApB, CpD );;
rApBCD := TensorProductOnObjects( TensorProductOnObjects( ApB, C ), D );;
AssociatorRightToLeftWithGivenTensorProducts( sApBCD, ApB, C, D, rApBCD );
#! <(1)->8250x8250, (2)->2496x2496>
rhs := PreCompose(
               AssociatorRightToLeftWithGivenTensorProducts( sApBCD, ApB, C, D, rApBCD ),
               AssociatorRightToLeftWithGivenTensorProducts( sApBCD, ApB, C, D, rApBCD )
               );
#! <(1)->8250x8250, (2)->2496x2496>
IsEqualForMorphisms( lhs, rhs );
#! true

#! Now we check the left unitor and right unitor if the triangle diagram commutes:

sAUC := TensorProductOnObjects( A, TensorProductOnObjects( unit, C ) );
#! <(1)->66, (2)->39; (a)->66x66, (b)->66x39, (c)->39x39>
rAUC := TensorProductOnObjects( TensorProductOnObjects( A, unit), C );
#! <(1)->66, (2)->39; (a)->66x66, (b)->66x39, (c)->39x39>
IsEqualForMorphisms(
PreCompose(
        AssociatorRightToLeftWithGivenTensorProducts( sAUC, A,unit,C, rAUC ),
        TensorProductOnMorphisms(
                RightUnitor( A ),
                IdentityMorphism( C )
        )
),
TensorProductOnMorphisms(
        IdentityMorphism( A ),
        LeftUnitor( C )
        )
);
#! true
IsEqualForMorphisms(
        TensorProductOnMorphisms(
                IdentityMorphism( A ),
                LeftUnitor( C )
                ),
        IdentityMorphism( sAUC )
);
#! true
