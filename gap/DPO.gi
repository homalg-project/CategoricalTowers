# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
InstallMethod( DPO,
        [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( m, l, r )
    local n, H, DPO;
    
    n := PushoutComplement( l, m )[1];
    
    H := Pushout( [ n, r ] );
    
    DPO := [ InjectionOfCofactorOfPushoutWithGivenPushout( [ n, r ], 1, H ),
             InjectionOfCofactorOfPushoutWithGivenPushout( [ n, r ], 2, H ) ];

    IsMonomorphism( DPO[1] );
    IsMonomorphism( DPO[2] );
    
    return DPO;
    
end );
