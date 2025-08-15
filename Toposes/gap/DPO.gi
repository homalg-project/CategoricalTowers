# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
InstallMethod( DPO,
        [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( m, l, r )
    local C, y, n, H, dpo;
    
    C := CapCategory( m );
    
    y := PushoutComplement( C, l, m );
    
    n := LiftAlongMonomorphism( C, y, PreCompose( C, l, m ) );
    
    H := Pushout( C, [ n, r ] );
    
    dpo := NTuple( 4,
                   InjectionOfCofactorOfPushoutWithGivenPushout( [ n, r ], 1, H ),
                   InjectionOfCofactorOfPushoutWithGivenPushout( [ n, r ], 2, H ),
                   y,
                   n );
    
    IsMonomorphism( dpo[1] );
    IsMonomorphism( dpo[2] );
    IsMonomorphism( y );
    IsMonomorphism( n );
    
    return dpo;
    
end );
