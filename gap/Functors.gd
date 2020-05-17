

####################################
#
#! @Chapter Categories of functors
#! @Section Attributes
#
####################################

#! @Description
#! The input is a Hom-category <A>H</A><C>:=Hom(B,C)</C> where <C>B</C> is an algebroid defined by some quiver algebra <C>A</C> and 
#! <C>C</C> is a matrix category over some homalg field <C>K</C>.
#! The output is the isomorphism from <A>H</A> into <C>CategoryOfQuiverRepresentations(A)</C>.
#! @Arguments H
#! @Returns a &CAP; functor
DeclareAttribute( "IsomorphismOntoCategoryOfQuiverRepresentations", IsCapHomCategory );


#! @Description
#! The input is a Hom-category <A>H</A><C>:=Hom(B,C)</C> where <C>B</C> is an algebroid defined by some quiver algebra <C>A</C> and 
#! <C>C</C> is a matrix category over some homalg field <C>K</C>.
#! The output is the isomorphism from  <C>CategoryOfQuiverRepresentations(A)</C> into <A>H</A>.
#! @Arguments H
#! @Returns a &CAP; functor
DeclareAttribute( "IsomorphismFromCategoryOfQuiverRepresentations", IsCapHomCategory );

#! @Description
#!  The input is an algebroid <A>B</A> defined by some quiver <C>K</C>-algebra <C>A</C>. The output is the Yondea embedding functor from
#!  <A>B</A> into the functors category <C>Hom</C>( <C>AlgebroidOverOppositeAlgebra</C>(<A>B</A>),<C>C</C>), where
#!  <C>C</C> is a matrix category over <C>K</C>.
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbedding", IsAlgebroid );
