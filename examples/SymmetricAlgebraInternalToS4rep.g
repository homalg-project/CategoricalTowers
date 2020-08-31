#! @Chunk SymmetricAlgebraInternalToS4rep

LoadPackage( "InternalModules" )

#! @Example
srepG := RepresentationCategory( SymmetricGroup( 4 ) );
#! The representation category of SymmetricGroup( [ 1 .. 4 ] )
G := UnderlyingGroupForRepresentationCategory( srepG );
#! Sym( [ 1 .. 4 ] )
irr := Irr( G );;
one := RepresentationCategoryObject( irr[5], srepG, "𝟙" );
#! 1*(x_𝟙)
sigma := RepresentationCategoryObject( irr[1], srepG, "σ" );
#! 1*(x_σ)
rho := RepresentationCategoryObject( irr[3], srepG, "ρ" );
#! 1*(x_ρ)
nu := RepresentationCategoryObject( irr[4], srepG, "ν" );
#! 1*(x_ν)
chi := RepresentationCategoryObject( irr[2], srepG, "χ" );
#! 1*(x_χ)
TensorProduct( rho, sigma, rho );
#! 1*(x_σ) + 1*(x_ρ) + 1*(x_𝟙)
TensorProduct( rho, rho );
#! 1*(x_σ) + 1*(x_ρ) + 1*(x_𝟙)
Display( AssociatorRightToLeft( rho, sigma, rho ) );
#! Component: (x_σ)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
Display( Braiding( rho, rho ) );
#! Component: (x_σ)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
W := chi;
#! 1*(x_χ)
LoadPackage( "GradedCategories" );
#! true
ZsrepG := PositivelyZGradedCategory( srepG );
#! The positively graded category of The representation category of
#! SymmetricGroup( [ 1 .. 4 ] )
LoadPackage( "InternalModules" );
#! true
SWMod := CategoryOfLeftSModules( W );
#! Abelian category of left modules over the internal symmetric algebra of 1*(x_χ)
#! with undecidable (mathematical) equality of morphisms
#! and uncomputable lifts and colifts
SW := UnderlyingActingObject( SWMod );
#! <An object in The positively graded category of The representation category
#!  of SymmetricGroup( [ 1 .. 4 ] )>
SW[0];
#! 1*(x_𝟙)
SW[1];
#! 1*(x_χ)
SW[2];
#! 1*(x_ρ) + 1*(x_ν) + 1*(x_𝟙)
SW[3];
#! 1*(x_σ) + 2*(x_χ) + 1*(x_ν)
SW[4];
#! 1*(x_χ) + 2*(x_ρ) + 2*(x_ν) + 2*(x_𝟙)
chi1 := InternalElement( SW, chi, 1, 1 );
#! degree: 1
#! 
#! Component: (x_χ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
rho2 := InternalElement( SW, rho, 2, 1 );
#! degree: 2
#! 
#! Component: (x_ρ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
nu2 := InternalElement( SW, nu, 2, 1 );
#! degree: 2
#! 
#! Component: (x_ν)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
nu3 := InternalElement( SW, nu, 3, 1 );
#! degree: 3
#! 
#! Component: (x_ν)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
chi1 * chi1;
#! degree: 2
#! 
#! Component: (x_ρ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
chi1 * (chi1 * chi1);
#! degree: 3
#! 
#! Component: (x_σ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_χ)
#! 
#! 5,3
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! 3
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
chi1 * (chi1 * chi1) = (chi1 * chi1) * chi1;
#! true
chi1 * rho2;
#! degree: 3
#! 
#! Component: (x_χ)
#! 
#! 0,2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
chi1 * rho2 = rho2 * chi1;
#! true
chi1 * nu2;
#! degree: 3
#! 
#! Component: (x_σ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_χ)
#! 
#! 8,0
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! 2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
chi1 * nu2 = nu2 * chi1;
#! true
chi1 * (chi1 * (chi1 * chi1));
#! degree: 4
#! 
#! Component: (x_χ)
#! 
#! -2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 3,-31
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! 5,6
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! 5,3
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
(chi1 * chi1) * (chi1 * chi1);
#! degree: 4
#! 
#! Component: (x_χ)
#! 
#! 8
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 9/4,43/4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! -16,-6
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! -7,9/8
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
((chi1 * chi1) * chi1) * chi1;
#! degree: 4
#! 
#! Component: (x_χ)
#! 
#! 26
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 3,-31
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! 5,6
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! 5,3
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
(chi1 * chi1) * rho2;
#! degree: 4
#! 
#! Component: (x_χ)
#! 
#! 4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 5/4,-9/4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! -4,-4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! 0,1/8
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
chi1 * (chi1 * rho2);
#! degree: 4
#! 
#! Component: (x_χ)
#! 
#! -2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 2,-12
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! -1,-1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! 0,2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
(chi1 * chi1) * nu2;
#! degree: 4
#! 
#! Component: (x_χ)
#! 
#! 4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 0,16
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! -8,-1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_𝟙)
#! 
#! -4,0
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
chi1 * nu3;
#! degree: 4
#! 
#! Component: (x_χ)
#! 
#! 4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ρ)
#! 
#! 0,-12
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (x_ν)
#! 
#! 1,1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! 
chi1 * nu3 = nu3 * chi1;
#! true
chi1 * (chi1 * (chi1 * chi1)) <> ((chi1 * chi1) * chi1) * chi1;
#! true
#! @EndExample
