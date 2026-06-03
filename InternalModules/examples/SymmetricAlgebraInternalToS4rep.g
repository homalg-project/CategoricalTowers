#! @Chunk SymmetricAlgebraInternalToS4rep

#! @Example
LoadPackage( "InternalModules" : OnlyNeeded );
#! true
srepG := RepresentationCategory( SymmetricGroup( 4 ) );
#! The representation category of SymmetricGroup( [ 1 .. 4 ] )
Display( srepG );
#! A CAP category with name The representation category
#! of SymmetricGroup( [ 1 .. 4 ] ):
#! 
#! 44 primitive operations were used to derive 387 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsLinearCategoryOverCommutativeRing
#! * IsAbelianCategory
#! * IsRigidSymmetricClosedMonoidalCategory
#! * IsAdditiveMonoidalCategory
#! and furthermore mathematically
#! * IsSkeletalCategory
G := UnderlyingGroupForRepresentationCategory( srepG );
#! Sym( [ 1 .. 4 ] )
irr := Irr( G );;
one := RepresentationCategoryObject( irr[5], srepG, "𝟙" );
#! 1*(𝟙)
sigma := RepresentationCategoryObject( irr[1], srepG, "σ" );
#! 1*(σ)
rho := RepresentationCategoryObject( irr[3], srepG, "ρ" );
#! 1*(ρ)
nu := RepresentationCategoryObject( irr[4], srepG, "ν" );
#! 1*(ν)
chi := RepresentationCategoryObject( irr[2], srepG, "χ" );
#! 1*(χ)
TensorProduct( rho, sigma, rho );
#! 1*(σ) + 1*(ρ) + 1*(𝟙)
TensorProduct( rho, rho );
#! 1*(σ) + 1*(ρ) + 1*(𝟙)
Display( AssociatorRightToLeft( rho, sigma, rho ) );
#! Component: (σ)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
Display( Braiding( rho, rho ) );
#! Component: (σ)
#! 
#! -1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
W := chi;
#! 1*(χ)
LoadPackage( "GradedCategories" );
#! true
ZsrepG := PositivelyZGradedClosureCategory( srepG );
#! PositivelyZGradedClosureCategory( The representation category of
#! SymmetricGroup( [ 1 .. 4 ] ) )
LoadPackage( "InternalModules" );
#! true
SWMod := CategoryOfLeftSModules( W );
#! Abelian category of left modules over the internal symmetric algebra of 1*(χ)
#! with undecidable (mathematical) equality of morphisms
#! and uncomputable lifts and colifts
SW := UnderlyingActingObject( SWMod );
#! <An object in PositivelyZGradedClosureCategory( The representation category of
#! SymmetricGroup( [ 1 .. 4 ] ) )>
SW[0];
#! 1*(𝟙)
SW[1];
#! 1*(χ)
SW[2];
#! 1*(ρ) + 1*(ν) + 1*(𝟙)
SW[3];
#! 1*(σ) + 2*(χ) + 1*(ν)
SW[4];
#! 1*(χ) + 2*(ρ) + 2*(ν) + 2*(𝟙)
chi1 := InternalElement( SW, chi, 1, 1 );
#! degree: 1
#! 
#! Component: (χ)
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
#! Component: (ρ)
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
#! Component: (ν)
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
#! Component: (ν)
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
#! Component: (ρ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
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
#! Component: (σ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (χ)
#! 
#! 5,3
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
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
#! Component: (χ)
#! 
#! 0,2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
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
#! Component: (σ)
#! 
#! 1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (χ)
#! 
#! 8,0
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
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
#! Component: (χ)
#! 
#! -2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 3,-31
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
#! 
#! 5,6
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
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
#! Component: (χ)
#! 
#! 8
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 9/4,43/4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
#! 
#! -16,-6
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
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
#! Component: (χ)
#! 
#! 26
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 3,-31
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
#! 
#! 5,6
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
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
#! Component: (χ)
#! 
#! 4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 5/4,-9/4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
#! 
#! -4,-4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
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
#! Component: (χ)
#! 
#! -2
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 2,-12
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
#! 
#! -1,-1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
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
#! Component: (χ)
#! 
#! 4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 0,16
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
#! 
#! -8,-1
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (𝟙)
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
#! Component: (χ)
#! 
#! 4
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ρ)
#! 
#! 0,-12
#! 
#! A morphism in Category of matrices over Q
#! 
#! ------------------------
#! Component: (ν)
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
