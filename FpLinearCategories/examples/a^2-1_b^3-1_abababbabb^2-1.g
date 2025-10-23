LoadPackage( "FpLinearCategories" );

k := HomalgFieldOfRationals();
q := FinQuiver( "q(o)[a:o->o,b:o->o]" );

P := PathCategory( q );
kP := LinearClosure( k, P );

rels_P := [ [ P.a^2, P.id_o ], [ P.b^3, P.id_o ], [ P.abababbabb^2, P.id_o ] ];
rels_kP := [ kP.a^2 - kP.id_o, kP.b^3 - kP.id_o, kP.abababbabb^2 - kP.id_o ];

G_P := CallFuncListWithTime( ReducedGroebnerBasis, [ P, rels_P ] );;
# 44.691128 Secs.
G_kP := CallFuncListWithTime( ReducedGroebnerBasis, [ kP, rels_kP ] );;
# 87.49282700000001 Secs.
