# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

####################################
#
# global variables:
#
####################################

##
InstallGlobalFunction( SimplicialCategoryTruncatedInDegree,
  function( n )
    local F, Delta;
    
    if n = 0 then
        
        F := PathCategory( FinQuiver( "Delta(C0)[]" ) );
        Delta := F;
        
    elif n = 1 then
        
        F := PathCategory( FinQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) );
        Delta := F /
                 [ [ PreCompose( F.s, F.id ), IdentityMorphism( F.C0 ) ],
                   [ PreCompose( F.t, F.id ), IdentityMorphism( F.C0 ) ] ];
        
    elif n = 2 then
        
        F := PathCategory( FinQuiver( "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,is:C2->C1,it:C2->C1,ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) );
        Delta := F /
                 [ [ PreCompose( F.s, F.id ), IdentityMorphism( F.C0 ) ],
                   [ PreCompose( F.t, F.id ), IdentityMorphism( F.C0 ) ],
                   [ PreCompose( F.ps, F.is ), IdentityMorphism( F.C1 ) ],
                   [ PreCompose( F.pt, F.it ), IdentityMorphism( F.C1 ) ],
                   [ PreCompose( F.is, F.id ), PreCompose( F.it, F.id ) ], ## s(1_M) = M = t(1_M)
                   [ PreCompose( F.pt, F.is ), PreCompose( F.id, F.t ) ],
                   [ PreCompose( F.ps, F.it ), PreCompose( F.id, F.s ) ],
                   [ PreCompose( F.s, F.pt ), PreCompose( F.t, F.ps ) ],
                   [ PreCompose( F.s, F.mu ), PreCompose( F.s, F.ps ) ],
                   [ PreCompose( F.t, F.mu ), PreCompose( F.t, F.pt ) ],
                   [ PreCompose( F.mu, F.is ), IdentityMorphism( F.C1 ) ],
                   [ PreCompose( F.mu, F.it ), IdentityMorphism( F.C1 ) ] ];
        
    else
        
        Error( "the case n > 2 is not implemented yet\n" );
        
    fi;
    
    return Delta;
    
end );

##
BindGlobal( "SimplicialCategoryTruncatedInDegree2",
        SimplicialCategoryTruncatedInDegree( 2 ) );
