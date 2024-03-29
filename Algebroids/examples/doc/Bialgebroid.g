#! @BeginChunk Bialgebroid

LoadPackage( "Algebroids" );

#! Create a right quiver $q$ with two vertices $u$ and $v$ and two edges $a$ and $b$.

#! @Example
q := RightQuiver( "q(u,v)[a:u->v,b:v->u]" );
#! q(u,v)[a:u->v,b:v->u]
#! @EndExample

#! Create the path algebra $\mathbb{Q}q$ of $q$ over $\mathbb{Q}$.

#! @Example
q := RightQuiver( "q(u,v)[a:u->v,b:v->u]" );
#! q(u,v)[a:u->v,b:v->u]
Q := HomalgFieldOfRationals( );
#! Q
Qq := PathAlgebra( Q, q );
#! Q * q
#! @EndExample

#! Form a quotient of $\mathbb{Q}q$ by the relations $ab - u$ and $ba - v$.

#! @Example
B := Algebroid( Qq, [ Qq.a * Qq.b - Qq.u, Qq.b * Qq.a - Qq.v ] );
#! Algebroid( Q, FreeCategory( RightQuiver( "q(u,v)[a:u->v,b:v->u]" ) ) )
#! / relations
RelationsOfAlgebroid( B );
#! [ (u)-[1*(a*b) - 1*(u)]->(u), (v)-[1*(b*a) - 1*(v)]->(v) ]
#! @EndExample

#! @Example
IsCommutative(B);
#! false
#! @EndExample

#! Next we want to define a counit and a comultiplication on $B$ to make it a bialgebroid.
#! The following record will be used to define the counit of $B$.

#! @Example
counit := rec( a := 1, b := 1 );
#! rec( a := 1, b := 1 )
#! @EndExample

#! We compute the tensor product $B \otimes_\mathbb{Q} B$.

#! @Example
B2 := B^2;
#! Algebroid( Q, FreeCategory( RightQuiver( "qxq(uu,uv,vu,vv)[\
#! ua:uu->uv,ub:uv->uu,va:vu->vv,vb:vv->vu,\
#! au:uu->vu,av:uv->vv,bu:vu->uu,bv:vv->uv]" ) ) ) / relations
#! @EndExample

#! The following record will be used to define the comultiplication $B \to B \otimes_{\mathbb{Q}} B$.

#! @Example
comult:= rec( a := PreCompose(B2.au, B2.va), b:= PreCompose(B2.bv, B2.ub) );
#! rec( a := (uu)-[{ 1*(ua*av) }]->(vv), b := (vv)-[{ 1*(vb*bu) }]->(uu) )
#! @EndExample

#! We use the records counit and comult to equip $B$ with the induced morphisms $B \to \mathbb{Q}$ and $B \to B \otimes_{\mathbb{Q}} B$.

#! @Example
AddBialgebroidStructure( B, counit, comult );
#! Bialgebroid( Q, FreeCategory( RightQuiver( "q(u,v)[a:u->v,b:v->u]" ) ) )
#! / relations
#! @EndExample

#! We extract comultiplication and counit from $B$. They are now functors.

#! @Example
counit := Counit( B );
#! Functor from Bialgebroid( Q, FreeCategory(
#! RightQuiver( "q(u,v)[a:u->v,b:v->u]" ) ) ) / relations
#! ->
#! Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )
comult := Comultiplication( B );
#! Functor from Bialgebroid( Q, FreeCategory(
#! RightQuiver( "q(u,v)[a:u->v,b:v->u]" ) ) ) / relations
#! ->
#! Algebroid( Q, FreeCategory(
#! RightQuiver( "qxq(uu,uv,vu,vv)[ua:uu->uv,ub:uv->uu,va:vu->vv,vb:vv->vu,\
#! au:uu->vu,av:uv->vv,bu:vu->uu,bv:vv->uv]" ) ) ) / relations
#! @EndExample

#! Apply comultiplication and counit.

#! @Example
ApplyFunctor( counit, B.u );
#! <(1)>
ApplyFunctor( counit, B.v );
#! <(1)>
ApplyFunctor( counit, IdentityMorphism( B.u ) );
#! (1)-[1*(1)]->(1)
ApplyFunctor( counit, IdentityMorphism( B.v ) );
#! (1)-[1*(1)]->(1)
ApplyFunctor( counit, B.a );
#! (1)-[1*(1)]->(1)
ApplyFunctor( counit, B.b );
#! (1)-[1*(1)]->(1)
ApplyFunctor( comult, B.u );
#! <(uu)>
ApplyFunctor( comult, B.v );
#! <(vv)>
ApplyFunctor( comult, IdentityMorphism( B.u ) );
#! (uu)-[{ 1*(uu) }]->(uu)
ApplyFunctor( comult, IdentityMorphism( B.v ) );
#! (vv)-[{ 1*(vv) }]->(vv)
ApplyFunctor( comult, B.a );
#! (uu)-[{ 1*(ua*av) }]->(vv)
ApplyFunctor( comult, B.b );
#! (vv)-[{ 1*(vb*bu) }]->(uu)

IsCoassociative(B);
#! true

IsCocommutative(B);
#! true

#! @EndExample
#! @EndChunk
