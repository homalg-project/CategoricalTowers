
using HomalgProject

LoadPackage( "GroupRepresentationsForCAP" )

srepG = RepresentationCategory( SymmetricGroup( 4 ) )

G = UnderlyingGroupForRepresentationCategory( srepG )

irr = Irr( G );

one = GIrreducibleObject( irr[5] ); SetString( one, g"1" ); one

sigma = GIrreducibleObject( irr[1] ); SetString( sigma, g"sigma" ); sigma

rho = GIrreducibleObject( irr[3] ); SetString( rho, g"rho" ); rho

nu = GIrreducibleObject( irr[4] ); SetString( nu, g"nu" ); nu

chi = GIrreducibleObject( irr[2] ); SetString( chi, g"chi" ); chi

W = RepresentationCategoryObject( irr[2], srepG )

LoadPackage( "GradedCategories" )

ZsrepG = PositivelyZGradedCategory( srepG )

LoadPackage( "InternalModules" )

SWMod = CategoryOfLeftSModules( W )

SW = UnderlyingActingObject( SWMod );

χ¹ = InternalElement( SW, GIrreducibleObject( irr[2] ), 1, 1 )

ρ² = InternalElement( SW, GIrreducibleObject( irr[3] ), 2, 1 )

ν² = InternalElement( SW, GIrreducibleObject( irr[4] ), 2, 1 )

ν³ = InternalElement( SW, GIrreducibleObject( irr[4] ), 3, 1 )

χ¹ * χ¹

χ¹ * (χ¹ * χ¹)

χ¹ * (χ¹ * χ¹) == (χ¹ * χ¹) * χ¹

χ¹ * ρ²

χ¹ * ρ² == ρ² * χ¹

χ¹ * ν²

χ¹ * ν² == ν² * χ¹

χ¹ * (χ¹ * (χ¹ * χ¹))

(χ¹ * χ¹) * (χ¹ * χ¹)

((χ¹ * χ¹) * χ¹) * χ¹

(χ¹ * χ¹) * ρ²

χ¹ * (χ¹ * ρ²)

(χ¹ * χ¹) * ν²

χ¹ * ν³

χ¹ * ν³ == ν³ * χ¹

χ¹ * (χ¹ * (χ¹ * χ¹)) == ((χ¹ * χ¹) * χ¹) * χ¹


