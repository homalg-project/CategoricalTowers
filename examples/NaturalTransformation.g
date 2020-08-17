Read("CategoryOfRepresentations.g");

e11 := 1;; e12 := 1;; e13 := 0;; e42 := 1;; e43 := 1;;

eMat := [
[e11, e12, e13],
[0, e11, e12],
[0, 0, e11],
[0, e42, e43],
[0, 0, e42]
];
#! [ [ 1, 1, 0 ], [ 0, 1, 1 ], [ 0, 0, 1 ], [ 0, 1, 1 ], [ 0, 0, 1 ] ]

f11 := 1;; f12 := 0;; f13 := 1;; f33 := 0;; f43 := 1;;
fMat := [
[f11, f12, f13],
[0, f11, f13],
[0, 0, f33],
[0, 0, f43]
];
#! [ [ 1, 0, 1 ], [ 0, 1, 1 ], [ 0, 0, 0 ], [ 0, 0, 1 ] ]

e12 := 1;; e13 := 0;; e42 := 1;; e43 := 1;;
f12 := 0;; f13 := -e12;; f43 := e12-e42;;

eMat := [
[0, e12, e13],
[0, 0, e12],
[0, 0, 0],
[0, e42, e43],
[0, 0, e42]
];

fMat := [
[0, f12, -e12],
[0, 0, -e12],
[0, 0, 0],
[0, 0, e12-e42]
];

eta := [
VectorSpaceMorphism(
nine(kq.1), HomalgMatrix(eMat, GF3), six(kq.1) ),
VectorSpaceMorphism(
nine(kq.2), HomalgMatrix(fMat, GF3), six(kq.2) ) ];
ninetosix := AsMorphismInHomCategory( nine, eta, six );

IsObject( nine );
#! true
IsMorphism( ninetosix );
# Error