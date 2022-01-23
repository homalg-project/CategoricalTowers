##################################################################################
# Test the correspondences between the cartesian closed structure of the category
# of the terminal category and the cocartesian coclosed structure of its opposite.
##################################################################################

gap> START_TEST("TerminalCategory.tst");

##############################################################
# (Co)Product, Exp and Coexp on objects
##############################################################

# Products and exponential objects for the terminal category

gap> T := TerminalCategoryWithMultipleObjects( );;
gap> a := ObjectConstructor( T, "a" );;
gap> b := ObjectConstructor( T, "b" );;
gap> c := ObjectConstructor( T, "c" );;
gap> d := ObjectConstructor( T, "d" );;

gap> i := InitialObject( T );;
gap> t := TerminalObject( T );;

gap> a_product_b := DirectProduct( a, b );;
gap> b_product_a := DirectProduct( b, a );;
gap> c_product_d := DirectProduct( c, d );;
gap> d_product_c := DirectProduct( d, c );;

gap> i_product_a := DirectProduct( i, a );;
gap> a_product_i := DirectProduct( a, i );;

gap> t_product_a := DirectProduct( t, a );;
gap> a_product_t := DirectProduct( a, t );;

gap> exp_ab := ExponentialOnObjects( a, b );;
gap> exp_ba := ExponentialOnObjects( b, a );;
gap> exp_cd := ExponentialOnObjects( c, d );;
gap> exp_dc := ExponentialOnObjects( d, c );;

gap> exp_ia := ExponentialOnObjects( i, a );;
gap> exp_ai := ExponentialOnObjects( a, i );;
gap> exp_ta := ExponentialOnObjects( t, a );;
gap> exp_at := ExponentialOnObjects( a, t );;

# Coproducts and coexponentials for opposite

gap> T_op := Opposite( T );;

gap> a_op := Opposite( a );;
gap> b_op := Opposite( b );;
gap> c_op := Opposite( c );;
gap> d_op := Opposite( d );;

gap> i_op := InitialObject( T_op );;
gap> t_op := TerminalObject( T_op );;

gap> a_coproduct_b_op := Coproduct( a_op, b_op );;
gap> b_coproduct_a_op := Coproduct( b_op, a_op );;
gap> c_coproduct_d_op := Coproduct( c_op, d_op );;
gap> d_coproduct_c_op := Coproduct( d_op, c_op );;

gap> i_coproduct_a_op := Coproduct( i_op, a_op );;
gap> a_coproduct_i_op := Coproduct( a_op, i_op );;

gap> t_coproduct_a_op := Coproduct( t_op, a_op );;
gap> a_coproduct_t_op := Coproduct( a_op, t_op );;

gap> coexp_ab_op := CoexponentialOnObjects( a_op, b_op );;
gap> coexp_ba_op := CoexponentialOnObjects( b_op, a_op );;
gap> coexp_cd_op := CoexponentialOnObjects( c_op, d_op );;
gap> coexp_dc_op := CoexponentialOnObjects( d_op, c_op );;

gap> coexp_ia_op := CoexponentialOnObjects( i_op, a_op );;
gap> coexp_ai_op := CoexponentialOnObjects( a_op, i_op );;
gap> coexp_ta_op := CoexponentialOnObjects( t_op, a_op );;
gap> coexp_at_op := CoexponentialOnObjects( a_op, t_op );;

# Opposite correspondence on product objects

gap> i_op = Opposite( t );
true
gap> t_op = Opposite( i );
true

gap> a_coproduct_b_op = Opposite( a_product_b );
true
gap> b_coproduct_a_op = Opposite( b_product_a );
true
gap> c_coproduct_d_op = Opposite( c_product_d );
true
gap> d_coproduct_c_op = Opposite( d_product_c );
true

gap> i_coproduct_a_op = Opposite( t_product_a );
true
gap> a_coproduct_i_op = Opposite( a_product_t );
true

gap> t_coproduct_a_op = Opposite( i_product_a );
true
gap> a_coproduct_t_op = Opposite( a_product_i );
true

gap> b_coproduct_a_op = Opposite( c_product_d );
true
gap> b_coproduct_a_op = Opposite( d_product_c );
true
gap> c_coproduct_d_op = Opposite( a_product_b );
true
gap> c_coproduct_d_op = Opposite( b_product_a );
true

# Opposite correspondence on (co)exps

gap> coexp_ab_op = Opposite( exp_ba );
true
gap> coexp_ba_op = Opposite( exp_ab );
true
gap> coexp_cd_op = Opposite( exp_dc );
true
gap> coexp_dc_op = Opposite( exp_cd );
true

gap> coexp_ia_op = Opposite( exp_at );
true
gap> coexp_ai_op = Opposite( exp_ta );
true

gap> coexp_ta_op = Opposite( exp_ai );
true
gap> coexp_at_op = Opposite( exp_ia );
true

gap> coexp_cd_op = Opposite( exp_ab );
true
gap> coexp_cd_op = Opposite( exp_ba );
true
gap> coexp_dc_op = Opposite( exp_ab );
true
gap> coexp_dc_op = Opposite( exp_ba );
true

# Opposite must be self-inverse

gap> exp_ab = Opposite( coexp_ba_op );
true
gap> exp_ba = Opposite( coexp_ab_op );
true
gap> exp_cd = Opposite( coexp_dc_op );
true
gap> exp_dc = Opposite( coexp_cd_op );
true

# Convenience methods

gap> exp_ab = Exponential( a, b );
true
gap> exp_ba = Exponential( b, a );
true
gap> exp_cd = Exponential( c, d );
true
gap> exp_dc = Exponential( d, c );
true

gap> exp_ia = Exponential( i, a );
true
gap> exp_ai = Exponential( a, i );
true
gap> exp_ta = Exponential( t, a );
true
gap> exp_at = Exponential( a, t );
true

gap> coexp_ab_op = Coexponential( a_op, b_op );
true
gap> coexp_ba_op = Coexponential( b_op, a_op );
true
gap> coexp_cd_op = Coexponential( c_op, d_op );
true
gap> coexp_dc_op = Coexponential( d_op, c_op );
true

gap> coexp_ia_op = Coexponential( i_op, a_op );
true
gap> coexp_ai_op = Coexponential( a_op, i_op );
true
gap> coexp_ta_op = Coexponential( t_op, a_op );
true
gap> coexp_at_op = Coexponential( a_op, t_op );
true

################################################################
# (Co)Product, Hom and CoHom on morphisms
################################################################

# Morphisms for the terminal category

gap> id_a := IdentityMorphism( a );;
gap> id_b := IdentityMorphism( b );;

gap> alpha := MorphismConstructor( a, "g_ab", b );;
gap> beta := MorphismConstructor( c, "g_cd", d );;
gap> gamma := MorphismConstructor( b, "g_bc", c );;

gap> alpha_gamma := PreCompose( alpha, gamma );;
gap> gamma_beta := PreCompose( gamma, beta );;
gap> alpha_gamma_beta := PreCompose( [ alpha, gamma, beta ] );;

gap> alpha_product_beta := DirectProductOnMorphisms( alpha, beta );;
gap> beta_product_alpha := DirectProductOnMorphisms( beta, alpha );;

gap> exp_alpha_id_a := ExponentialOnMorphisms( alpha, id_a );;
gap> exp_alpha_id_b := ExponentialOnMorphisms( alpha, id_b );;
gap> exp_id_a_alpha := ExponentialOnMorphisms( id_a, alpha );;
gap> exp_id_b_alpha := ExponentialOnMorphisms( id_b, alpha );;

gap> exp_alpha_beta := ExponentialOnMorphisms( alpha, beta );;
gap> exp_beta_alpha := ExponentialOnMorphisms( beta, alpha );;

# Morphisms for opposite of the terminal category

gap> id_a_op := IdentityMorphism( a_op );;
gap> id_b_op := IdentityMorphism( b_op );;

gap> alpha_op := Opposite( alpha );;
gap> beta_op := Opposite( beta );;
gap> gamma_op := Opposite( gamma );;

gap> alpha_gamma_op := PostCompose( alpha_op, gamma_op );;
gap> gamma_beta_op := PostCompose( gamma_op, beta_op );;
gap> alpha_gamma_beta_op := PostCompose( [ alpha_op, gamma_op, beta_op ] );;

gap> alpha_coproduct_beta_op := CoproductOnMorphisms( alpha_op, beta_op );;
gap> beta_coproduct_alpha_op := CoproductOnMorphisms( beta_op, alpha_op );;

gap> coexp_alpha_id_a_op := CoexponentialOnMorphisms( alpha_op, id_a_op );;
gap> coexp_alpha_id_b_op := CoexponentialOnMorphisms( alpha_op, id_b_op );;
gap> coexp_id_a_alpha_op := CoexponentialOnMorphisms( id_a_op, alpha_op );;
gap> coexp_id_b_alpha_op := CoexponentialOnMorphisms( id_b_op, alpha_op );;

gap> coexp_alpha_beta_op := CoexponentialOnMorphisms( alpha_op, beta_op );;
gap> coexp_beta_alpha_op := CoexponentialOnMorphisms( beta_op, alpha_op );;

# Check if morphisms are well-defined

gap> IsWellDefined( alpha );
true
gap> IsWellDefined( beta );
true
gap> IsWellDefined( gamma );
true

gap> IsWellDefined( alpha_op );
true
gap> IsWellDefined( beta_op );
true
gap> IsWellDefined( gamma_op );
true

# Opposite correspondence on products of morphisms

gap> alpha_coproduct_beta_op = Opposite( alpha_product_beta );
true
gap> beta_coproduct_alpha_op = Opposite( beta_product_alpha );
true

# Opposite correspondence on (co)exps

gap> coexp_alpha_beta_op = Opposite( exp_beta_alpha );
true
gap> coexp_beta_alpha_op = Opposite( exp_alpha_beta );
true

gap> coexp_alpha_beta_op = Opposite( exp_alpha_beta );
true
gap> coexp_beta_alpha_op = Opposite( exp_beta_alpha );
true

# Opposite correspondence on compositions of morphisms

gap> alpha_gamma_op = Opposite( alpha_gamma );
true
gap> gamma_beta_op = Opposite( gamma_beta );
true
gap> alpha_gamma_beta_op = Opposite( alpha_gamma_beta );
true

gap> alpha_gamma_op = Opposite( gamma_beta );
false
gap> alpha_gamma_op = Opposite( alpha_gamma_beta );
false
gap> gamma_beta_op = Opposite( alpha_gamma );
false
gap> gamma_beta_op = Opposite( alpha_gamma_beta );
false
gap> alpha_gamma_beta_op = Opposite( alpha_gamma );
false
gap> alpha_gamma_beta_op = Opposite( gamma_beta );
false

# Opposite must be self-inverse

gap> exp_alpha_beta = Opposite( coexp_beta_alpha_op );
true
gap> exp_beta_alpha = Opposite( coexp_alpha_beta_op );
true

# Convenience methods in the opposite category

gap> exp_alpha_beta = Exponential( alpha, beta );
true
gap> exp_beta_alpha = Exponential( beta, alpha );
true

gap> coexp_alpha_beta_op = Coexponential( alpha_op, beta_op );
true
gap> coexp_beta_alpha_op = Coexponential( beta_op, alpha_op );
true

gap> coexp_alpha_id_a_op = Coexponential( alpha_op, a_op );
true
gap> coexp_alpha_id_b_op = Coexponential( alpha_op, b_op );
true
gap> coexp_id_a_alpha_op = Coexponential( a_op, alpha_op );
true
gap> coexp_id_b_alpha_op = Coexponential( b_op, alpha_op );
true

######################################################
# Unitors
######################################################

# Cartesian unitors

gap> cart_left_unitor_a := CartesianLeftUnitor( a );;
gap> cart_left_unitor_b := CartesianLeftUnitor( b );;
gap> cart_left_unitor_c := CartesianLeftUnitor( c );;
gap> cart_left_unitor_d := CartesianLeftUnitor( d );;
gap> cart_left_unitor_i := CartesianLeftUnitor( i );;
gap> cart_left_unitor_t := CartesianLeftUnitor( t );;

gap> cart_left_unitor_a_op := CartesianLeftUnitor( a_op );;
gap> cart_left_unitor_b_op := CartesianLeftUnitor( b_op );;
gap> cart_left_unitor_c_op := CartesianLeftUnitor( c_op );;
gap> cart_left_unitor_d_op := CartesianLeftUnitor( d_op );;
gap> cart_left_unitor_i_op := CartesianLeftUnitor( i_op );;
gap> cart_left_unitor_t_op := CartesianLeftUnitor( t_op );;

gap> cart_right_unitor_a := CartesianRightUnitor( a );;
gap> cart_right_unitor_b := CartesianRightUnitor( b );;
gap> cart_right_unitor_c := CartesianRightUnitor( c );;
gap> cart_right_unitor_d := CartesianRightUnitor( d );;
gap> cart_right_unitor_i := CartesianRightUnitor( i );;
gap> cart_right_unitor_t := CartesianRightUnitor( t );;

gap> cart_right_unitor_a_op := CartesianRightUnitor( a_op );;
gap> cart_right_unitor_b_op := CartesianRightUnitor( b_op );;
gap> cart_right_unitor_c_op := CartesianRightUnitor( c_op );;
gap> cart_right_unitor_d_op := CartesianRightUnitor( d_op );;
gap> cart_right_unitor_i_op := CartesianRightUnitor( i_op );;
gap> cart_right_unitor_t_op := CartesianRightUnitor( t_op );;

# Cocartesian unitors

gap> cocart_left_unitor_a := CocartesianLeftUnitor( a );;
gap> cocart_left_unitor_b := CocartesianLeftUnitor( b );;
gap> cocart_left_unitor_c := CocartesianLeftUnitor( c );;
gap> cocart_left_unitor_d := CocartesianLeftUnitor( d );;
gap> cocart_left_unitor_i := CocartesianLeftUnitor( i );;
gap> cocart_left_unitor_t := CocartesianLeftUnitor( t );;

gap> cocart_left_unitor_a_op := CocartesianLeftUnitor( a_op );;
gap> cocart_left_unitor_b_op := CocartesianLeftUnitor( b_op );;
gap> cocart_left_unitor_c_op := CocartesianLeftUnitor( c_op );;
gap> cocart_left_unitor_d_op := CocartesianLeftUnitor( d_op );;
gap> cocart_left_unitor_i_op := CocartesianLeftUnitor( i_op );;
gap> cocart_left_unitor_t_op := CocartesianLeftUnitor( t_op );;

gap> cocart_right_unitor_a := CocartesianRightUnitor( a );;
gap> cocart_right_unitor_b := CocartesianRightUnitor( b );;
gap> cocart_right_unitor_c := CocartesianRightUnitor( c );;
gap> cocart_right_unitor_d := CocartesianRightUnitor( d );;
gap> cocart_right_unitor_i := CocartesianRightUnitor( i );;
gap> cocart_right_unitor_t := CocartesianRightUnitor( t );;

gap> cocart_right_unitor_a_op := CocartesianRightUnitor( a_op );;
gap> cocart_right_unitor_b_op := CocartesianRightUnitor( b_op );;
gap> cocart_right_unitor_c_op := CocartesianRightUnitor( c_op );;
gap> cocart_right_unitor_d_op := CocartesianRightUnitor( d_op );;
gap> cocart_right_unitor_i_op := CocartesianRightUnitor( i_op );;
gap> cocart_right_unitor_t_op := CocartesianRightUnitor( t_op );;

# Inverse cartesian unitors

gap> cart_left_unitor_inverse_a := CartesianLeftUnitorInverse( a );;
gap> cart_left_unitor_inverse_b := CartesianLeftUnitorInverse( b );;
gap> cart_left_unitor_inverse_c := CartesianLeftUnitorInverse( c );;
gap> cart_left_unitor_inverse_d := CartesianLeftUnitorInverse( d );;
gap> cart_left_unitor_inverse_i := CartesianLeftUnitorInverse( i );;
gap> cart_left_unitor_inverse_t := CartesianLeftUnitorInverse( t );;

gap> cart_left_unitor_inverse_a_op := CartesianLeftUnitorInverse( a_op );;
gap> cart_left_unitor_inverse_b_op := CartesianLeftUnitorInverse( b_op );;
gap> cart_left_unitor_inverse_c_op := CartesianLeftUnitorInverse( c_op );;
gap> cart_left_unitor_inverse_d_op := CartesianLeftUnitorInverse( d_op );;
gap> cart_left_unitor_inverse_i_op := CartesianLeftUnitorInverse( i_op );;
gap> cart_left_unitor_inverse_t_op := CartesianLeftUnitorInverse( t_op );;

gap> cart_right_unitor_inverse_a := CartesianRightUnitorInverse( a );;
gap> cart_right_unitor_inverse_b := CartesianRightUnitorInverse( b );;
gap> cart_right_unitor_inverse_c := CartesianRightUnitorInverse( c );;
gap> cart_right_unitor_inverse_d := CartesianRightUnitorInverse( d );;
gap> cart_right_unitor_inverse_i := CartesianRightUnitorInverse( i );;
gap> cart_right_unitor_inverse_t := CartesianRightUnitorInverse( t );;

gap> cart_right_unitor_inverse_a_op := CartesianRightUnitorInverse( a_op );;
gap> cart_right_unitor_inverse_b_op := CartesianRightUnitorInverse( b_op );;
gap> cart_right_unitor_inverse_c_op := CartesianRightUnitorInverse( c_op );;
gap> cart_right_unitor_inverse_d_op := CartesianRightUnitorInverse( d_op );;
gap> cart_right_unitor_inverse_i_op := CartesianRightUnitorInverse( i_op );;
gap> cart_right_unitor_inverse_t_op := CartesianRightUnitorInverse( t_op );;

# Inverse cocartesian unitors

gap> cocart_left_unitor_inverse_a := CocartesianLeftUnitorInverse( a );;
gap> cocart_left_unitor_inverse_b := CocartesianLeftUnitorInverse( b );;
gap> cocart_left_unitor_inverse_c := CocartesianLeftUnitorInverse( c );;
gap> cocart_left_unitor_inverse_d := CocartesianLeftUnitorInverse( d );;
gap> cocart_left_unitor_inverse_i := CocartesianLeftUnitorInverse( i );;
gap> cocart_left_unitor_inverse_t := CocartesianLeftUnitorInverse( t );;

gap> cocart_left_unitor_inverse_a_op := CocartesianLeftUnitorInverse( a_op );;
gap> cocart_left_unitor_inverse_b_op := CocartesianLeftUnitorInverse( b_op );;
gap> cocart_left_unitor_inverse_c_op := CocartesianLeftUnitorInverse( c_op );;
gap> cocart_left_unitor_inverse_d_op := CocartesianLeftUnitorInverse( d_op );;
gap> cocart_left_unitor_inverse_i_op := CocartesianLeftUnitorInverse( i_op );;
gap> cocart_left_unitor_inverse_t_op := CocartesianLeftUnitorInverse( t_op );;

gap> cocart_right_unitor_inverse_a := CocartesianRightUnitorInverse( a );;
gap> cocart_right_unitor_inverse_b := CocartesianRightUnitorInverse( b );;
gap> cocart_right_unitor_inverse_c := CocartesianRightUnitorInverse( c );;
gap> cocart_right_unitor_inverse_d := CocartesianRightUnitorInverse( d );;
gap> cocart_right_unitor_inverse_i := CocartesianRightUnitorInverse( i );;
gap> cocart_right_unitor_inverse_t := CocartesianRightUnitorInverse( t );;

gap> cocart_right_unitor_inverse_a_op := CocartesianRightUnitorInverse( a_op );;
gap> cocart_right_unitor_inverse_b_op := CocartesianRightUnitorInverse( b_op );;
gap> cocart_right_unitor_inverse_c_op := CocartesianRightUnitorInverse( c_op );;
gap> cocart_right_unitor_inverse_d_op := CocartesianRightUnitorInverse( d_op );;
gap> cocart_right_unitor_inverse_i_op := CocartesianRightUnitorInverse( i_op );;
gap> cocart_right_unitor_inverse_t_op := CocartesianRightUnitorInverse( t_op );;

# Opposite correspondence

# Left unitors

gap> cart_left_unitor_a_op = Opposite( cocart_left_unitor_inverse_a );
true
gap> cart_left_unitor_b_op = Opposite( cocart_left_unitor_inverse_b );
true
gap> cart_left_unitor_c_op = Opposite( cocart_left_unitor_inverse_c );
true
gap> cart_left_unitor_d_op = Opposite( cocart_left_unitor_inverse_d );
true
gap> cart_left_unitor_i_op = Opposite( cocart_left_unitor_inverse_t );
true
gap> cart_left_unitor_t_op = Opposite( cocart_left_unitor_inverse_i );
true

gap> cocart_left_unitor_a_op = Opposite( cart_left_unitor_inverse_a );
true
gap> cocart_left_unitor_b_op = Opposite( cart_left_unitor_inverse_b );
true
gap> cocart_left_unitor_c_op = Opposite( cart_left_unitor_inverse_c );
true
gap> cocart_left_unitor_d_op = Opposite( cart_left_unitor_inverse_d );
true
gap> cocart_left_unitor_i_op = Opposite( cart_left_unitor_inverse_t );
true
gap> cocart_left_unitor_t_op = Opposite( cart_left_unitor_inverse_i );
true

# Left unitor inverses

gap> cart_left_unitor_inverse_a_op = Opposite( cocart_left_unitor_a );
true
gap> cart_left_unitor_inverse_b_op = Opposite( cocart_left_unitor_b );
true
gap> cart_left_unitor_inverse_c_op = Opposite( cocart_left_unitor_c );
true
gap> cart_left_unitor_inverse_d_op = Opposite( cocart_left_unitor_d );
true
gap> cart_left_unitor_inverse_i_op = Opposite( cocart_left_unitor_t );
true
gap> cart_left_unitor_inverse_t_op = Opposite( cocart_left_unitor_i );
true

gap> cocart_left_unitor_inverse_a_op = Opposite( cart_left_unitor_a );
true
gap> cocart_left_unitor_inverse_b_op = Opposite( cart_left_unitor_b );
true
gap> cocart_left_unitor_inverse_c_op = Opposite( cart_left_unitor_c );
true
gap> cocart_left_unitor_inverse_d_op = Opposite( cart_left_unitor_d );
true
gap> cocart_left_unitor_inverse_i_op = Opposite( cart_left_unitor_t );
true
gap> cocart_left_unitor_inverse_t_op = Opposite( cart_left_unitor_i );
true

# Right unitors

gap> cart_right_unitor_a_op = Opposite( cocart_right_unitor_inverse_a );
true
gap> cart_right_unitor_b_op = Opposite( cocart_right_unitor_inverse_b );
true
gap> cart_right_unitor_c_op = Opposite( cocart_right_unitor_inverse_c );
true
gap> cart_right_unitor_d_op = Opposite( cocart_right_unitor_inverse_d );
true
gap> cart_right_unitor_i_op = Opposite( cocart_right_unitor_inverse_t );
true
gap> cart_right_unitor_t_op = Opposite( cocart_right_unitor_inverse_i );
true

gap> cocart_right_unitor_a_op = Opposite( cart_right_unitor_inverse_a );
true
gap> cocart_right_unitor_b_op = Opposite( cart_right_unitor_inverse_b );
true
gap> cocart_right_unitor_c_op = Opposite( cart_right_unitor_inverse_c );
true
gap> cocart_right_unitor_d_op = Opposite( cart_right_unitor_inverse_d );
true
gap> cocart_right_unitor_i_op = Opposite( cart_right_unitor_inverse_t );
true
gap> cocart_right_unitor_t_op = Opposite( cart_right_unitor_inverse_i );
true

# Right unitor inverses

gap> cart_right_unitor_inverse_a_op = Opposite( cocart_right_unitor_a );
true
gap> cart_right_unitor_inverse_b_op = Opposite( cocart_right_unitor_b );
true
gap> cart_right_unitor_inverse_c_op = Opposite( cocart_right_unitor_c );
true
gap> cart_right_unitor_inverse_d_op = Opposite( cocart_right_unitor_d );
true
gap> cart_right_unitor_inverse_i_op = Opposite( cocart_right_unitor_t );
true
gap> cart_right_unitor_inverse_t_op = Opposite( cocart_right_unitor_i );
true

gap> cocart_right_unitor_inverse_a_op = Opposite( cart_right_unitor_a );
true
gap> cocart_right_unitor_inverse_b_op = Opposite( cart_right_unitor_b );
true
gap> cocart_right_unitor_inverse_c_op = Opposite( cart_right_unitor_c );
true
gap> cocart_right_unitor_inverse_d_op = Opposite( cart_right_unitor_d );
true
gap> cocart_right_unitor_inverse_i_op = Opposite( cart_right_unitor_t );
true
gap> cocart_right_unitor_inverse_t_op = Opposite( cart_right_unitor_i );
true

# False tests

# Left unitors

gap> cart_left_unitor_b_op = Opposite( cocart_left_unitor_inverse_a );
false
gap> cart_left_unitor_b_op = Opposite( cocart_left_unitor_inverse_c );
false
gap> cart_left_unitor_b_op = Opposite( cocart_left_unitor_inverse_d );
false
gap> cart_left_unitor_b_op = Opposite( cart_left_unitor_inverse_b );
false
gap> cart_left_unitor_b_op = Opposite( cart_left_unitor_b );
false

gap> cocart_left_unitor_b_op = Opposite( cart_left_unitor_inverse_a );
false
gap> cocart_left_unitor_b_op = Opposite( cart_left_unitor_inverse_c );
false
gap> cocart_left_unitor_b_op = Opposite( cart_left_unitor_inverse_d );
false
gap> cocart_left_unitor_b_op = Opposite( cocart_left_unitor_inverse_b );
false
gap> cocart_left_unitor_b_op = Opposite( cocart_left_unitor_b );
false

# Left unitor inverses

gap> cart_left_unitor_inverse_c_op = Opposite( cocart_left_unitor_a );
false
gap> cart_left_unitor_inverse_c_op = Opposite( cocart_left_unitor_b );
false
gap> cart_left_unitor_inverse_c_op = Opposite( cocart_left_unitor_d );
false
gap> cart_left_unitor_inverse_c_op = Opposite( cart_left_unitor_d );
false
gap> cart_left_unitor_inverse_c_op = Opposite( cart_left_unitor_inverse_c );
false

gap> cocart_left_unitor_inverse_c_op = Opposite( cart_left_unitor_a );
false
gap> cocart_left_unitor_inverse_c_op = Opposite( cart_left_unitor_b );
false
gap> cocart_left_unitor_inverse_c_op = Opposite( cart_left_unitor_d );
false
gap> cocart_left_unitor_inverse_c_op = Opposite( cocart_left_unitor_c );
false
gap> cocart_left_unitor_inverse_c_op = Opposite( cocart_left_unitor_inverse_c );
false

# Right unitors

gap> cart_right_unitor_a_op = Opposite( cocart_right_unitor_inverse_b );
false
gap> cart_right_unitor_a_op = Opposite( cocart_right_unitor_inverse_c );
false
gap> cart_right_unitor_a_op = Opposite( cocart_right_unitor_inverse_d );
false
gap> cart_right_unitor_a_op = Opposite( cart_right_unitor_inverse_a );
false
gap> cart_right_unitor_a_op = Opposite( cart_right_unitor_a );
false

gap> cocart_right_unitor_a_op = Opposite( cart_right_unitor_inverse_b );
false
gap> cocart_right_unitor_a_op = Opposite( cart_right_unitor_inverse_c );
false
gap> cocart_right_unitor_a_op = Opposite( cart_right_unitor_inverse_d );
false
gap> cocart_right_unitor_a_op = Opposite( cocart_right_unitor_inverse_a );
false
gap> cocart_right_unitor_a_op = Opposite( cocart_right_unitor_a );
false

# Right unitor inverses

gap> cart_right_unitor_inverse_d_op = Opposite( cocart_right_unitor_a );
false
gap> cart_right_unitor_inverse_d_op = Opposite( cocart_right_unitor_b );
false
gap> cart_right_unitor_inverse_d_op = Opposite( cocart_right_unitor_c );
false
gap> cart_right_unitor_inverse_d_op = Opposite( cart_right_unitor_d );
false
gap> cart_right_unitor_inverse_d_op = Opposite( cart_right_unitor_inverse_d );
false

gap> cocart_right_unitor_inverse_d_op = Opposite( cart_right_unitor_a );
false
gap> cocart_right_unitor_inverse_d_op = Opposite( cart_right_unitor_b );
false
gap> cocart_right_unitor_inverse_d_op = Opposite( cart_right_unitor_c );
false
gap> cocart_right_unitor_inverse_d_op = Opposite( cocart_right_unitor_d );
false
gap> cocart_right_unitor_inverse_d_op = Opposite( cocart_right_unitor_inverse_d );
false

######################################################
# Associators
######################################################

# Cartesian associators

gap> cart_associator_left_to_right_abc := CartesianAssociatorLeftToRight( a, b, c );;
gap> cart_associator_left_to_right_bcd := CartesianAssociatorLeftToRight( b, c, d );;
gap> cart_associator_left_to_right_acd := CartesianAssociatorLeftToRight( a, c, d );;
gap> cart_associator_left_to_right_cba := CartesianAssociatorLeftToRight( c, b, a );;
gap> cart_associator_left_to_right_dcb := CartesianAssociatorLeftToRight( d, c, b );;
gap> cart_associator_left_to_right_dib := CartesianAssociatorLeftToRight( d, i, b );;
gap> cart_associator_left_to_right_dtb := CartesianAssociatorLeftToRight( d, t, b );;

gap> cart_associator_left_to_right_abc_op := CartesianAssociatorLeftToRight( a_op, b_op, c_op );;
gap> cart_associator_left_to_right_bcd_op := CartesianAssociatorLeftToRight( b_op, c_op, d_op );;
gap> cart_associator_left_to_right_acd_op := CartesianAssociatorLeftToRight( a_op, c_op, d_op );;
gap> cart_associator_left_to_right_cba_op := CartesianAssociatorLeftToRight( c_op, b_op, a_op );;
gap> cart_associator_left_to_right_dcb_op := CartesianAssociatorLeftToRight( d_op, c_op, b_op );;
gap> cart_associator_left_to_right_dib_op := CartesianAssociatorLeftToRight( d_op, i_op, b_op );;
gap> cart_associator_left_to_right_dtb_op := CartesianAssociatorLeftToRight( d_op, t_op, b_op );;

gap> cart_associator_right_to_left_abc := CartesianAssociatorRightToLeft( a, b, c );;
gap> cart_associator_right_to_left_bcd := CartesianAssociatorRightToLeft( b, c, d );;
gap> cart_associator_right_to_left_acd := CartesianAssociatorRightToLeft( a, c, d );;
gap> cart_associator_right_to_left_cba := CartesianAssociatorRightToLeft( c, b, a );;
gap> cart_associator_right_to_left_dcb := CartesianAssociatorRightToLeft( d, c, b );;
gap> cart_associator_right_to_left_dib := CartesianAssociatorRightToLeft( d, i, b );;
gap> cart_associator_right_to_left_dtb := CartesianAssociatorRightToLeft( d, t, b );;

gap> cart_associator_right_to_left_abc_op := CartesianAssociatorRightToLeft( a_op, b_op, c_op );;
gap> cart_associator_right_to_left_bcd_op := CartesianAssociatorRightToLeft( b_op, c_op, d_op );;
gap> cart_associator_right_to_left_acd_op := CartesianAssociatorRightToLeft( a_op, c_op, d_op );;
gap> cart_associator_right_to_left_cba_op := CartesianAssociatorRightToLeft( c_op, b_op, a_op );;
gap> cart_associator_right_to_left_dcb_op := CartesianAssociatorRightToLeft( d_op, c_op, b_op );;
gap> cart_associator_right_to_left_dib_op := CartesianAssociatorRightToLeft( d_op, i_op, b_op );;
gap> cart_associator_right_to_left_dtb_op := CartesianAssociatorRightToLeft( d_op, t_op, b_op );;

# Coartesian associators

gap> cocart_associator_left_to_right_abc := CocartesianAssociatorLeftToRight( a, b, c );;
gap> cocart_associator_left_to_right_bcd := CocartesianAssociatorLeftToRight( b, c, d );;
gap> cocart_associator_left_to_right_acd := CocartesianAssociatorLeftToRight( a, c, d );;
gap> cocart_associator_left_to_right_cba := CocartesianAssociatorLeftToRight( c, b, a );;
gap> cocart_associator_left_to_right_dcb := CocartesianAssociatorLeftToRight( d, c, b );;
gap> cocart_associator_left_to_right_dib := CocartesianAssociatorLeftToRight( d, i, b );;
gap> cocart_associator_left_to_right_dtb := CocartesianAssociatorLeftToRight( d, t, b );;

gap> cocart_associator_left_to_right_abc_op := CocartesianAssociatorLeftToRight( a_op, b_op, c_op );;
gap> cocart_associator_left_to_right_bcd_op := CocartesianAssociatorLeftToRight( b_op, c_op, d_op );;
gap> cocart_associator_left_to_right_acd_op := CocartesianAssociatorLeftToRight( a_op, c_op, d_op );;
gap> cocart_associator_left_to_right_cba_op := CocartesianAssociatorLeftToRight( c_op, b_op, a_op );;
gap> cocart_associator_left_to_right_dcb_op := CocartesianAssociatorLeftToRight( d_op, c_op, b_op );;
gap> cocart_associator_left_to_right_dib_op := CocartesianAssociatorLeftToRight( d_op, i_op, b_op );;
gap> cocart_associator_left_to_right_dtb_op := CocartesianAssociatorLeftToRight( d_op, t_op, b_op );;

gap> cocart_associator_right_to_left_abc := CocartesianAssociatorRightToLeft( a, b, c );;
gap> cocart_associator_right_to_left_bcd := CocartesianAssociatorRightToLeft( b, c, d );;
gap> cocart_associator_right_to_left_acd := CocartesianAssociatorRightToLeft( a, c, d );;
gap> cocart_associator_right_to_left_cba := CocartesianAssociatorRightToLeft( c, b, a );;
gap> cocart_associator_right_to_left_dcb := CocartesianAssociatorRightToLeft( d, c, b );;
gap> cocart_associator_right_to_left_dib := CocartesianAssociatorRightToLeft( d, i, b );;
gap> cocart_associator_right_to_left_dtb := CocartesianAssociatorRightToLeft( d, t, b );;

gap> cocart_associator_right_to_left_abc_op := CocartesianAssociatorRightToLeft( a_op, b_op, c_op );;
gap> cocart_associator_right_to_left_bcd_op := CocartesianAssociatorRightToLeft( b_op, c_op, d_op );;
gap> cocart_associator_right_to_left_acd_op := CocartesianAssociatorRightToLeft( a_op, c_op, d_op );;
gap> cocart_associator_right_to_left_cba_op := CocartesianAssociatorRightToLeft( c_op, b_op, a_op );;
gap> cocart_associator_right_to_left_dcb_op := CocartesianAssociatorRightToLeft( d_op, c_op, b_op );;
gap> cocart_associator_right_to_left_dib_op := CocartesianAssociatorRightToLeft( d_op, i_op, b_op );;
gap> cocart_associator_right_to_left_dtb_op := CocartesianAssociatorRightToLeft( d_op, t_op, b_op );;

# Opposite correspondence

gap> cart_associator_left_to_right_abc_op = Opposite( cocart_associator_right_to_left_abc );
true
gap> cart_associator_left_to_right_bcd_op = Opposite( cocart_associator_right_to_left_bcd );
true
gap> cart_associator_left_to_right_acd_op = Opposite( cocart_associator_right_to_left_acd );
true
gap> cart_associator_left_to_right_cba_op = Opposite( cocart_associator_right_to_left_cba );
true
gap> cart_associator_left_to_right_dcb_op = Opposite( cocart_associator_right_to_left_dcb );
true
gap> cart_associator_left_to_right_dib_op = Opposite( cocart_associator_right_to_left_dtb );
true
gap> cart_associator_left_to_right_dtb_op = Opposite( cocart_associator_right_to_left_dib );
true

gap> cocart_associator_left_to_right_abc_op = Opposite( cart_associator_right_to_left_abc );
true
gap> cocart_associator_left_to_right_bcd_op = Opposite( cart_associator_right_to_left_bcd );
true
gap> cocart_associator_left_to_right_acd_op = Opposite( cart_associator_right_to_left_acd );
true
gap> cocart_associator_left_to_right_cba_op = Opposite( cart_associator_right_to_left_cba );
true
gap> cocart_associator_left_to_right_dcb_op = Opposite( cart_associator_right_to_left_dcb );
true
gap> cocart_associator_left_to_right_dib_op = Opposite( cart_associator_right_to_left_dtb );
true
gap> cocart_associator_left_to_right_dtb_op = Opposite( cart_associator_right_to_left_dib );
true

gap> cart_associator_right_to_left_abc_op = Opposite( cocart_associator_left_to_right_abc );
true
gap> cart_associator_right_to_left_bcd_op = Opposite( cocart_associator_left_to_right_bcd );
true
gap> cart_associator_right_to_left_acd_op = Opposite( cocart_associator_left_to_right_acd );
true
gap> cart_associator_right_to_left_cba_op = Opposite( cocart_associator_left_to_right_cba );
true
gap> cart_associator_right_to_left_dcb_op = Opposite( cocart_associator_left_to_right_dcb );
true
gap> cart_associator_right_to_left_dib_op = Opposite( cocart_associator_left_to_right_dtb );
true
gap> cart_associator_right_to_left_dtb_op = Opposite( cocart_associator_left_to_right_dib );
true

gap> cocart_associator_right_to_left_abc_op = Opposite( cart_associator_left_to_right_abc );
true
gap> cocart_associator_right_to_left_bcd_op = Opposite( cart_associator_left_to_right_bcd );
true
gap> cocart_associator_right_to_left_acd_op = Opposite( cart_associator_left_to_right_acd );
true
gap> cocart_associator_right_to_left_cba_op = Opposite( cart_associator_left_to_right_cba );
true
gap> cocart_associator_right_to_left_dcb_op = Opposite( cart_associator_left_to_right_dcb );
true
gap> cart_associator_right_to_left_dib_op = Opposite( cocart_associator_left_to_right_dtb );
true
gap> cart_associator_right_to_left_dtb_op = Opposite( cocart_associator_left_to_right_dib );
true

# False Tests

gap> cart_associator_left_to_right_cba_op = Opposite( cocart_associator_right_to_left_bcd );
true
gap> cart_associator_left_to_right_cba_op = Opposite( cocart_associator_right_to_left_acd );
true
gap> cart_associator_left_to_right_cba_op = Opposite( cocart_associator_right_to_left_dcb );
true

gap> cocart_associator_left_to_right_cba_op = Opposite( cart_associator_right_to_left_bcd );
true
gap> cocart_associator_left_to_right_cba_op = Opposite( cart_associator_right_to_left_acd );
true
gap> cocart_associator_left_to_right_cba_op = Opposite( cart_associator_right_to_left_dcb );
true

gap> cart_associator_right_to_left_acd_op = Opposite( cocart_associator_left_to_right_abc );
true
gap> cart_associator_right_to_left_acd_op = Opposite( cocart_associator_left_to_right_bcd );
true
gap> cart_associator_right_to_left_acd_op = Opposite( cocart_associator_left_to_right_cba );
true

gap> cocart_associator_right_to_left_acd_op = Opposite( cart_associator_left_to_right_abc );
true
gap> cocart_associator_right_to_left_acd_op = Opposite( cart_associator_left_to_right_bcd );
true
gap> cocart_associator_right_to_left_acd_op = Opposite( cart_associator_left_to_right_cba );
true

# False tests with initial/terminal objects

gap> cart_associator_left_to_right_dib_op = Opposite( cocart_associator_right_to_left_dib );
true
gap> cart_associator_left_to_right_dib_op = Opposite( cart_associator_right_to_left_dib );
false
gap> cart_associator_left_to_right_dib_op = Opposite( cart_associator_right_to_left_dtb );
false

gap> cart_associator_left_to_right_dtb_op = Opposite( cocart_associator_right_to_left_dtb );
true
gap> cart_associator_left_to_right_dtb_op = Opposite( cart_associator_right_to_left_dtb );
false
gap> cart_associator_left_to_right_dtb_op = Opposite( cart_associator_right_to_left_dib );
false

gap> cocart_associator_left_to_right_dib_op = Opposite( cart_associator_right_to_left_dib );
true
gap> cocart_associator_left_to_right_dib_op = Opposite( cocart_associator_right_to_left_dib );
false
gap> cocart_associator_left_to_right_dib_op = Opposite( cocart_associator_right_to_left_dtb );
false

gap> cocart_associator_left_to_right_dtb_op = Opposite( cart_associator_right_to_left_dtb );
true
gap> cocart_associator_left_to_right_dtb_op = Opposite( cocart_associator_right_to_left_dtb );
false
gap> cocart_associator_left_to_right_dtb_op = Opposite( cocart_associator_right_to_left_dib );
false

gap> cart_associator_right_to_left_dib_op = Opposite( cocart_associator_left_to_right_dib );
true
gap> cart_associator_right_to_left_dib_op = Opposite( cart_associator_left_to_right_dib );
false
gap> cart_associator_right_to_left_dib_op = Opposite( cart_associator_left_to_right_dtb );
false

gap> cart_associator_right_to_left_dtb_op = Opposite( cocart_associator_left_to_right_dtb );
true
gap> cart_associator_right_to_left_dtb_op = Opposite( cart_associator_left_to_right_dtb );
false
gap> cart_associator_right_to_left_dtb_op = Opposite( cart_associator_left_to_right_dib );
false

gap> cocart_associator_right_to_left_dib_op = Opposite( cart_associator_left_to_right_dib );
true
gap> cocart_associator_right_to_left_dib_op = Opposite( cocart_associator_left_to_right_dib );
false
gap> cocart_associator_right_to_left_dib_op = Opposite( cocart_associator_left_to_right_dtb );
false

gap> cocart_associator_right_to_left_dtb_op = Opposite( cart_associator_left_to_right_dtb );
true
gap> cocart_associator_right_to_left_dtb_op = Opposite( cocart_associator_left_to_right_dtb );
false
gap> cocart_associator_right_to_left_dtb_op = Opposite( cocart_associator_left_to_right_dib );
false

######################################################
# Braiding
######################################################

gap> cartesian_braiding_a_b := CartesianBraiding( a, b );;
gap> cartesian_braiding_b_a := CartesianBraiding( b, a );;
gap> cartesian_braiding_c_d := CartesianBraiding( c, d );;
gap> cartesian_braiding_d_c := CartesianBraiding( d, c );;

gap> cartesian_braiding_i_a := CartesianBraiding( i, a );;
gap> cartesian_braiding_a_i := CartesianBraiding( a, i );;
gap> cartesian_braiding_t_a := CartesianBraiding( t, a );;
gap> cartesian_braiding_a_t := CartesianBraiding( a, t );;

# Add tests once these morphisms are available

# gap> cartesian_braiding_a_b_op := CartesianBraiding( a_op, b_op );;
# gap> cartesian_braiding_b_a_op := CartesianBraiding( b_op, a_op );;
# gap> cartesian_braiding_c_d_op := CartesianBraiding( c_op, d_op );;
# gap> cartesian_braiding_d_c_op := CartesianBraiding( d_op, c_op );;

# gap> cartesian_braiding_i_a_op := CartesianBraiding( i_op, a_op );;
# gap> cartesian_braiding_a_i_op := CartesianBraiding( a_op, i_op );;
# gap> cartesian_braiding_t_a_op := CartesianBraiding( t_op, a_op );;
# gap> cartesian_braiding_a_t_op := CartesianBraiding( a_op, t_op );;

# gap> cocartesian_braiding_a_b := CocartesianBraiding( a, b );;
# gap> cocartesian_braiding_b_a := CocartesianBraiding( b, a );;
# gap> cocartesian_braiding_c_d := CocartesianBraiding( c, d );;
# gap> cocartesian_braiding_d_c := CocartesianBraiding( d, c );;

# gap> cocartesian_braiding_i_a := CocartesianBraiding( i, a );;
# gap> cocartesian_braiding_a_i := CocartesianBraiding( a, i );;
# gap> cocartesian_braiding_t_a := CocartesianBraiding( t, a );;
# gap> cocartesian_braiding_a_t := CocartesianBraiding( a, t );;

gap> cocartesian_braiding_a_b_op := CocartesianBraiding( a_op, b_op );;
gap> cocartesian_braiding_b_a_op := CocartesianBraiding( b_op, a_op );;
gap> cocartesian_braiding_c_d_op := CocartesianBraiding( c_op, d_op );;
gap> cocartesian_braiding_d_c_op := CocartesianBraiding( d_op, c_op );;

gap> cocartesian_braiding_i_a_op := CocartesianBraiding( i_op, a_op );;
gap> cocartesian_braiding_a_i_op := CocartesianBraiding( a_op, i_op );;
gap> cocartesian_braiding_t_a_op := CocartesianBraiding( t_op, a_op );;
gap> cocartesian_braiding_a_t_op := CocartesianBraiding( a_op, t_op );;

gap> cartesian_braiding_inverse_a_b := CartesianBraidingInverse( a, b );;
gap> cartesian_braiding_inverse_b_a := CartesianBraidingInverse( b, a );;
gap> cartesian_braiding_inverse_c_d := CartesianBraidingInverse( c, d );;
gap> cartesian_braiding_inverse_d_c := CartesianBraidingInverse( d, c );;

gap> cartesian_braiding_inverse_i_a := CartesianBraidingInverse( i, a );;
gap> cartesian_braiding_inverse_a_i := CartesianBraidingInverse( a, i );;
gap> cartesian_braiding_inverse_t_a := CartesianBraidingInverse( t, a );;
gap> cartesian_braiding_inverse_a_t := CartesianBraidingInverse( a, t );;

# Add tests once these morphisms are available

# gap> cocartesian_braiding_inverse_a_b := CocartesianBraidingInverse( a, b );;
# gap> cocartesian_braiding_inverse_b_a := CocartesianBraidingInverse( b, a );;
# gap> cocartesian_braiding_inverse_c_d := CocartesianBraidingInverse( c, d );;
# gap> cocartesian_braiding_inverse_d_c := CocartesianBraidingInverse( d, c );;

# gap> cocartesian_braiding_inverse_i_a := CocartesianBraidingInverse( i, a );;
# gap> cocartesian_braiding_inverse_a_i := CocartesianBraidingInverse( a, i );;
# gap> cocartesian_braiding_inverse_t_a := CocartesianBraidingInverse( t, a );;
# gap> cocartesian_braiding_inverse_a_t := CocartesianBraidingInverse( a, t );;

# gap> cartesian_braiding_inverse_a_b_op := CartesianBraidingInverse( a_op, b_op );;
# gap> cartesian_braiding_inverse_b_a_op := CartesianBraidingInverse( b_op, a_op );;
# gap> cartesian_braiding_inverse_c_d_op := CartesianBraidingInverse( c_op, d_op );;
# gap> cartesian_braiding_inverse_d_c_op := CartesianBraidingInverse( d_op, c_op );;

# gap> cartesian_braiding_inverse_i_a_op := CartesianBraidingInverse( i_op, a_op );;
# gap> cartesian_braiding_inverse_a_i_op := CartesianBraidingInverse( a_op, i_op );;
# gap> cartesian_braiding_inverse_t_a_op := CartesianBraidingInverse( t_op, a_op );;
# gap> cartesian_braiding_inverse_a_t_op := CartesianBraidingInverse( a_op, t_op );;

gap> cocartesian_braiding_inverse_a_b_op := CocartesianBraidingInverse( a_op, b_op );;
gap> cocartesian_braiding_inverse_b_a_op := CocartesianBraidingInverse( b_op, a_op );;
gap> cocartesian_braiding_inverse_c_d_op := CocartesianBraidingInverse( c_op, d_op );;
gap> cocartesian_braiding_inverse_d_c_op := CocartesianBraidingInverse( d_op, c_op );;

gap> cocartesian_braiding_inverse_i_a_op := CocartesianBraidingInverse( i_op, a_op );;
gap> cocartesian_braiding_inverse_a_i_op := CocartesianBraidingInverse( a_op, i_op );;
gap> cocartesian_braiding_inverse_t_a_op := CocartesianBraidingInverse( t_op, a_op );;
gap> cocartesian_braiding_inverse_a_t_op := CocartesianBraidingInverse( a_op, t_op );;

# Opposite correspondence

gap> cocartesian_braiding_a_b_op = Opposite( cartesian_braiding_inverse_a_b );
true
gap> cocartesian_braiding_b_a_op = Opposite( cartesian_braiding_inverse_b_a );
true
gap> cocartesian_braiding_c_d_op = Opposite( cartesian_braiding_inverse_c_d );
true
gap> cocartesian_braiding_d_c_op = Opposite( cartesian_braiding_inverse_d_c );
true
gap> cocartesian_braiding_i_a_op = Opposite( cartesian_braiding_inverse_t_a );
true
gap> cocartesian_braiding_a_i_op = Opposite( cartesian_braiding_inverse_a_t );
true
gap> cocartesian_braiding_t_a_op = Opposite( cartesian_braiding_inverse_i_a );
true
gap> cocartesian_braiding_a_t_op = Opposite( cartesian_braiding_inverse_a_i );
true

gap> cocartesian_braiding_inverse_a_b_op = Opposite( cartesian_braiding_a_b );
true
gap> cocartesian_braiding_inverse_b_a_op = Opposite( cartesian_braiding_b_a );
true
gap> cocartesian_braiding_inverse_c_d_op = Opposite( cartesian_braiding_c_d );
true
gap> cocartesian_braiding_inverse_d_c_op = Opposite( cartesian_braiding_d_c );
true
gap> cocartesian_braiding_inverse_i_a_op = Opposite( cartesian_braiding_t_a );
true
gap> cocartesian_braiding_inverse_a_i_op = Opposite( cartesian_braiding_a_t );
true
gap> cocartesian_braiding_inverse_t_a_op = Opposite( cartesian_braiding_i_a );
true
gap> cocartesian_braiding_inverse_a_t_op = Opposite( cartesian_braiding_a_i );
true

gap> cocartesian_braiding_a_b_op = Opposite( cartesian_braiding_inverse_b_a );
true
gap> cocartesian_braiding_a_b_op = Opposite( cartesian_braiding_inverse_c_d );
true
gap> cocartesian_braiding_a_b_op = Opposite( cartesian_braiding_inverse_d_c );
true
gap> cocartesian_braiding_i_a_op = Opposite( cartesian_braiding_inverse_a_t );
true

gap> cocartesian_braiding_c_d_op = Opposite( cartesian_braiding_inverse_a_b );
true
gap> cocartesian_braiding_c_d_op = Opposite( cartesian_braiding_inverse_b_a );
true
gap> cocartesian_braiding_c_d_op = Opposite( cartesian_braiding_inverse_d_c );
true
gap> cocartesian_braiding_a_t_op = Opposite( cartesian_braiding_inverse_t_a );
true

gap> cocartesian_braiding_inverse_b_a_op = Opposite( cartesian_braiding_a_b );
true
gap> cocartesian_braiding_inverse_b_a_op = Opposite( cartesian_braiding_c_d );
true
gap> cocartesian_braiding_inverse_b_a_op = Opposite( cartesian_braiding_d_c );
true
gap> cocartesian_braiding_inverse_a_i_op = Opposite( cartesian_braiding_t_a );
true

gap> cocartesian_braiding_inverse_d_c_op = Opposite( cartesian_braiding_a_b );
true
gap> cocartesian_braiding_inverse_d_c_op = Opposite( cartesian_braiding_b_a );
true
gap> cocartesian_braiding_inverse_d_c_op = Opposite( cartesian_braiding_c_d );
true
gap> cocartesian_braiding_inverse_t_a_op = Opposite( cartesian_braiding_t_a );
true

######################################################
# Identity morphisms
######################################################

# Identities for (co)product objects

gap> id_a_product_b := IdentityMorphism( a_product_b );;
gap> id_b_product_a := IdentityMorphism( b_product_a );;
gap> id_c_product_d := IdentityMorphism( c_product_d );;
gap> id_d_product_c := IdentityMorphism( d_product_c );;

gap> id_i_product_a := IdentityMorphism( i_product_a );;
gap> id_a_product_i := IdentityMorphism( a_product_i );;
gap> id_t_product_a := IdentityMorphism( t_product_a );;
gap> id_a_product_t := IdentityMorphism( a_product_t );;

gap> id_a_coproduct_b_op := IdentityMorphism( a_coproduct_b_op );;
gap> id_b_coproduct_a_op := IdentityMorphism( b_coproduct_a_op );;
gap> id_c_coproduct_d_op := IdentityMorphism( c_coproduct_d_op );;
gap> id_d_coproduct_c_op := IdentityMorphism( d_coproduct_c_op );;

gap> id_i_coproduct_a_op := IdentityMorphism( i_coproduct_a_op );;
gap> id_a_coproduct_i_op := IdentityMorphism( a_coproduct_i_op );;
gap> id_t_coproduct_a_op := IdentityMorphism( t_coproduct_a_op );;
gap> id_a_coproduct_t_op := IdentityMorphism( a_coproduct_t_op );;

# Identities for (co)exps

gap> id_exp_ab := IdentityMorphism( exp_ab );;
gap> id_exp_ba := IdentityMorphism (exp_ba );;
gap> id_exp_cd := IdentityMorphism( exp_cd );;
gap> id_exp_dc := IdentityMorphism( exp_dc );;

gap> id_exp_ia := IdentityMorphism( exp_ia );;
gap> id_exp_ai := IdentityMorphism( exp_ai );;
gap> id_exp_ta := IdentityMorphism( exp_ta );;
gap> id_exp_at := IdentityMorphism( exp_at );;

gap> id_exp_ta := IdentityMorphism( exp_ta );;
gap> id_exp_at := IdentityMorphism( exp_at );;

gap> id_coexp_ab_op := IdentityMorphism( coexp_ab_op );;
gap> id_coexp_ba_op := IdentityMorphism( coexp_ba_op );;
gap> id_coexp_cd_op := IdentityMorphism( coexp_cd_op );;
gap> id_coexp_dc_op := IdentityMorphism( coexp_dc_op );;

gap> id_coexp_ia_op := IdentityMorphism( coexp_ia_op );;
gap> id_coexp_ai_op := IdentityMorphism( coexp_ai_op );;
gap> id_coexp_ta_op := IdentityMorphism( coexp_ta_op );;
gap> id_coexp_at_op := IdentityMorphism( coexp_at_op );;

# Opposite correspondence on identities of (co)products

gap> id_a_coproduct_b_op = Opposite( id_a_product_b );
true
gap> id_b_coproduct_a_op = Opposite( id_b_product_a );
true
gap> id_c_coproduct_d_op = Opposite( id_c_product_d );
true
gap> id_d_coproduct_c_op = Opposite( id_d_product_c );
true

gap> id_i_coproduct_a_op = Opposite( id_t_product_a );
true
gap> id_a_coproduct_i_op = Opposite( id_a_product_t );
true
gap> id_t_coproduct_a_op = Opposite( id_i_product_a );
true
gap> id_a_coproduct_t_op = Opposite( id_a_product_i );
true

gap> id_a_coproduct_b_op = Opposite( id_c_product_d );
true
gap> id_a_coproduct_b_op = Opposite( id_d_product_c );
true
gap> id_c_coproduct_d_op = Opposite( id_a_product_b );
true
gap> id_c_coproduct_d_op = Opposite( id_b_product_a );
true

# Opposite correspondence on identities of (co)exps

gap> id_coexp_ab_op = Opposite( id_exp_ba );
true
gap> id_coexp_ba_op = Opposite( id_exp_ab );
true
gap> id_coexp_cd_op = Opposite( id_exp_dc );
true
gap> id_coexp_dc_op = Opposite( id_exp_cd );
true

gap> id_coexp_ia_op = Opposite( id_exp_at );
true
gap> id_coexp_ai_op = Opposite( id_exp_ta );
true
gap> id_coexp_ta_op = Opposite( id_exp_ai );
true
gap> id_coexp_at_op = Opposite( id_exp_ia );
true

gap> id_coexp_ab_op = Opposite( id_exp_cd );
true
gap> id_coexp_ab_op = Opposite( id_exp_dc );
true
gap> id_coexp_ab_op = Opposite( id_exp_ia );
true
gap> id_coexp_ab_op = Opposite( id_exp_ta );
true

#####################################################
# Units and counits
#####################################################

# Units and counits for the terminal category

gap> cart_ev_ab := CartesianEvaluationMorphism( a, b );;
gap> cart_ev_ba := CartesianEvaluationMorphism( b, a );;
gap> cart_ev_cd := CartesianEvaluationMorphism( c, d );;
gap> cart_ev_dc := CartesianEvaluationMorphism( d, c );;

gap> cart_ev_ia := CartesianEvaluationMorphism( i, a );;
gap> cart_ev_ai := CartesianEvaluationMorphism( a, i );;
gap> cart_ev_ta := CartesianEvaluationMorphism( t, a );;
gap> cart_ev_at := CartesianEvaluationMorphism( a, t );;

gap> cart_coev_ab := CartesianCoevaluationMorphism( a, b );;
gap> cart_coev_ba := CartesianCoevaluationMorphism( b, a );;
gap> cart_coev_cd := CartesianCoevaluationMorphism( c, d );;
gap> cart_coev_dc := CartesianCoevaluationMorphism( d, c );;

gap> cart_coev_ia := CartesianCoevaluationMorphism( i, a );;
gap> cart_coev_ai := CartesianCoevaluationMorphism( a, i );;
gap> cart_coev_ta := CartesianCoevaluationMorphism( t, a );;
gap> cart_coev_at := CartesianCoevaluationMorphism( a, t );;

# Units and counits for opposite of the terminal category

gap> cocart_ev_ab_op := CocartesianEvaluationMorphism( a_op, b_op );;
gap> cocart_ev_ba_op := CocartesianEvaluationMorphism( b_op, a_op );;
gap> cocart_ev_cd_op := CocartesianEvaluationMorphism( c_op, d_op );;
gap> cocart_ev_dc_op := CocartesianEvaluationMorphism( d_op, c_op );;

gap> cocart_ev_ia_op := CocartesianEvaluationMorphism( i_op, a_op );;
gap> cocart_ev_ai_op := CocartesianEvaluationMorphism( a_op, i_op );;
gap> cocart_ev_ta_op := CocartesianEvaluationMorphism( t_op, a_op );;
gap> cocart_ev_at_op := CocartesianEvaluationMorphism( a_op, t_op );;

gap> cocart_coev_ab_op := CocartesianCoevaluationMorphism( a_op, b_op );;
gap> cocart_coev_ba_op := CocartesianCoevaluationMorphism( b_op, a_op );;
gap> cocart_coev_cd_op := CocartesianCoevaluationMorphism( c_op, d_op );;
gap> cocart_coev_dc_op := CocartesianCoevaluationMorphism( d_op, c_op );;

gap> cocart_coev_ia_op := CocartesianCoevaluationMorphism( i_op, a_op );;
gap> cocart_coev_ai_op := CocartesianCoevaluationMorphism( a_op, i_op );;
gap> cocart_coev_ta_op := CocartesianCoevaluationMorphism( t_op, a_op );;
gap> cocart_coev_at_op := CocartesianCoevaluationMorphism( a_op, t_op );;

# Opposite correspondence on units and counits

# Arguments must be reversed for evaluations
gap> cocart_ev_ab_op = Opposite( cart_ev_ba );
true
gap> cocart_ev_ba_op = Opposite( cart_ev_ab );
true
gap> cocart_ev_cd_op = Opposite( cart_ev_dc );
true
gap> cocart_ev_dc_op = Opposite( cart_ev_cd );
true

gap> cocart_ev_ia_op = Opposite( cart_ev_at );
true
gap> cocart_ev_ai_op = Opposite( cart_ev_ta );
true
gap> cocart_ev_ta_op = Opposite( cart_ev_ai );
true
gap> cocart_ev_at_op = Opposite( cart_ev_ia );
true

gap> cocart_coev_ab_op = Opposite( cart_coev_ab );
true
gap> cocart_coev_ba_op = Opposite( cart_coev_ba );
true
gap> cocart_coev_cd_op = Opposite( cart_coev_cd );
true
gap> cocart_coev_dc_op = Opposite( cart_coev_dc );
true

gap> cocart_coev_ia_op = Opposite( cart_coev_ta );
true
gap> cocart_coev_ai_op = Opposite( cart_coev_at );
true
gap> cocart_coev_ta_op = Opposite( cart_coev_ia );
true
gap> cocart_coev_at_op = Opposite( cart_coev_ai );
true

gap> cocart_ev_ba_op = Opposite( cart_ev_ba );
false
gap> cocart_ev_ba_op = Opposite( cart_ev_cd );
false
gap> cocart_ev_ba_op = Opposite( cart_ev_dc );
false

gap> cocart_coev_dc_op = Opposite( cart_coev_cd );
false
gap> cocart_coev_dc_op = Opposite( cart_coev_ab );
false
gap> cocart_coev_dc_op = Opposite( cart_coev_ba );
false

gap> cocart_ev_cd_op = Opposite( cart_ev_ab );
false
gap> cocart_ev_cd_op = Opposite( cart_ev_ba );
false
gap> cocart_ev_cd_op = Opposite( cart_ev_cd );
false

gap> cocart_coev_ab_op = Opposite( cart_coev_ba );
false
gap> cocart_coev_ab_op = Opposite( cart_coev_cd );
false
gap> cocart_coev_ab_op = Opposite( cart_coev_dc );
false

#####################################################
# Adjunction maps on identities
#####################################################

# Closed cartesian structure for the terminal category

gap> product_to_exp_adjunction_on_id_a_product_b := DirectProductToExponentialAdjunctionMap( a, b, id_a_product_b );;
gap> product_to_exp_adjunction_on_id_b_product_a := DirectProductToExponentialAdjunctionMap( b, a, id_b_product_a );;
gap> product_to_exp_adjunction_on_id_c_product_d := DirectProductToExponentialAdjunctionMap( c, d, id_c_product_d );;
gap> product_to_exp_adjunction_on_id_d_product_c := DirectProductToExponentialAdjunctionMap( d, c, id_d_product_c );;

gap> product_to_exp_adjunction_on_id_i_product_a := DirectProductToExponentialAdjunctionMap( i, a, id_i_product_a );;
gap> product_to_exp_adjunction_on_id_a_product_i := DirectProductToExponentialAdjunctionMap( a, i, id_a_product_i );;
gap> product_to_exp_adjunction_on_id_t_product_a := DirectProductToExponentialAdjunctionMap( t, a, id_t_product_a );;
gap> product_to_exp_adjunction_on_id_a_product_t := DirectProductToExponentialAdjunctionMap( a, t, id_a_product_t );;

gap> exp_to_product_adjunction_on_id_exp_ab := ExponentialToDirectProductAdjunctionMap( a, b, id_exp_ab );;
gap> exp_to_product_adjunction_on_id_exp_ba := ExponentialToDirectProductAdjunctionMap( b, a, id_exp_ba );;
gap> exp_to_product_adjunction_on_id_exp_cd := ExponentialToDirectProductAdjunctionMap( c, d, id_exp_cd );;
gap> exp_to_product_adjunction_on_id_exp_dc := ExponentialToDirectProductAdjunctionMap( d, c, id_exp_dc );;

gap> exp_to_product_adjunction_on_id_exp_ia := ExponentialToDirectProductAdjunctionMap( i, a, id_exp_ia );;
gap> exp_to_product_adjunction_on_id_exp_ai := ExponentialToDirectProductAdjunctionMap( a, i, id_exp_ai );;
gap> exp_to_product_adjunction_on_id_exp_ta := ExponentialToDirectProductAdjunctionMap( t, a, id_exp_ta );;
gap> exp_to_product_adjunction_on_id_exp_at := ExponentialToDirectProductAdjunctionMap( a, t, id_exp_at );;

# Coclosed cocartesian structure for opposite of the terminal category

gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_b_op := CoproductToCoexponentialAdjunctionMap( a_op, b_op, id_a_coproduct_b_op );;
gap> coproduct_to_coexp_adjunction_on_id_b_coproduct_a_op := CoproductToCoexponentialAdjunctionMap( b_op, a_op, id_b_coproduct_a_op );;
gap> coproduct_to_coexp_adjunction_on_id_c_coproduct_d_op := CoproductToCoexponentialAdjunctionMap( c_op, d_op, id_c_coproduct_d_op );;
gap> coproduct_to_coexp_adjunction_on_id_d_coproduct_c_op := CoproductToCoexponentialAdjunctionMap( d_op, c_op, id_d_coproduct_c_op );;

gap> coproduct_to_coexp_adjunction_on_id_i_coproduct_a_op := CoproductToCoexponentialAdjunctionMap( i_op, a_op, id_i_coproduct_a_op );;
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_i_op := CoproductToCoexponentialAdjunctionMap( a_op, i_op, id_a_coproduct_i_op );;
gap> coproduct_to_coexp_adjunction_on_id_t_coproduct_a_op := CoproductToCoexponentialAdjunctionMap( t_op, a_op, id_t_coproduct_a_op );;
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_t_op := CoproductToCoexponentialAdjunctionMap( a_op, t_op, id_a_coproduct_t_op );;

gap> coexp_to_coproduct_adjunction_on_id_coexp_ab_op := CoexponentialToCoproductAdjunctionMap( a_op, b_op, id_coexp_ab_op );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_ba_op := CoexponentialToCoproductAdjunctionMap( b_op, a_op, id_coexp_ba_op );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_cd_op := CoexponentialToCoproductAdjunctionMap( c_op, d_op, id_coexp_cd_op );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_dc_op := CoexponentialToCoproductAdjunctionMap( d_op, c_op, id_coexp_dc_op );;

gap> coexp_to_coproduct_adjunction_on_id_coexp_ia_op := CoexponentialToCoproductAdjunctionMap( i_op, a_op, id_coexp_ia_op );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_ai_op := CoexponentialToCoproductAdjunctionMap( a_op, i_op, id_coexp_ai_op );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_ta_op := CoexponentialToCoproductAdjunctionMap( t_op, a_op, id_coexp_ta_op );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_at_op := CoexponentialToCoproductAdjunctionMap( a_op, t_op, id_coexp_at_op );;

# Opposite correspondence on adjunction maps

# coclev = op( ev ), arguments must be reversed for evaluations

gap> coexp_to_coproduct_adjunction_on_id_coexp_ab_op = Opposite( exp_to_product_adjunction_on_id_exp_ba ); # a -> Coexp( a, b ) x b  ==  op( Exp( b, a ) x b -> a )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_ba_op = Opposite( exp_to_product_adjunction_on_id_exp_ab ); # b -> Coexp( b, a ) x a  ==  op( Exp( a, b ) x a -> b )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_cd_op = Opposite( exp_to_product_adjunction_on_id_exp_dc ); # c -> Coexp( c, d ) x d  ==  op( Exp( d, c ) x d -> c )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_dc_op = Opposite( exp_to_product_adjunction_on_id_exp_cd ); # d -> Coexp( d, c ) x c  ==  op( Exp( c, d ) x c -> d )
true

gap> coexp_to_coproduct_adjunction_on_id_coexp_ia_op = Opposite( exp_to_product_adjunction_on_id_exp_at ); # i -> Coexp( i, a ) x a  ==  op( Exp( a, t ) x a -> t )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_ai_op = Opposite( exp_to_product_adjunction_on_id_exp_ta ); # a -> Coexp( a, i ) x i  ==  op( Exp( t, a ) x t -> a )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_ta_op = Opposite( exp_to_product_adjunction_on_id_exp_ai ); # t -> Coexp( t, a ) x a  ==  op( Exp( a, i ) x a -> i )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_at_op = Opposite( exp_to_product_adjunction_on_id_exp_ia ); # a -> Coexp( a, t ) x t  ==  op( Exp( i, a ) x i -> a )
true

gap> cocart_ev_ab_op = Opposite( exp_to_product_adjunction_on_id_exp_ba );
true
gap> cocart_ev_ba_op = Opposite( exp_to_product_adjunction_on_id_exp_ab );
true
gap> cocart_ev_cd_op = Opposite( exp_to_product_adjunction_on_id_exp_dc );
true
gap> cocart_ev_dc_op = Opposite( exp_to_product_adjunction_on_id_exp_cd );
true

gap> cocart_ev_ia_op = Opposite( exp_to_product_adjunction_on_id_exp_at );
true
gap> cocart_ev_ai_op = Opposite( exp_to_product_adjunction_on_id_exp_ta );
true
gap> cocart_ev_ta_op = Opposite( exp_to_product_adjunction_on_id_exp_ai );
true
gap> cocart_ev_at_op = Opposite( exp_to_product_adjunction_on_id_exp_ia );
true

# coclcoev = op( coev )

gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_b_op = Opposite( product_to_exp_adjunction_on_id_a_product_b ); # Coexp( a x b, b ) -> a  ==  op( a -> Exp( b, a x b ) )
true
gap> coproduct_to_coexp_adjunction_on_id_b_coproduct_a_op = Opposite( product_to_exp_adjunction_on_id_b_product_a ); # Coexp( b x a, a ) -> b  ==  op( b -> Exp( a, b x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_c_coproduct_d_op = Opposite( product_to_exp_adjunction_on_id_c_product_d ); # Coexp( c x d, d ) -> c  ==  op( c -> Exp( d, c x d ) )
true
gap> coproduct_to_coexp_adjunction_on_id_d_coproduct_c_op = Opposite( product_to_exp_adjunction_on_id_d_product_c ); # Coexp( d x c, c ) -> d  ==  op( d -> Exp( c, d x c ) )
true

gap> coproduct_to_coexp_adjunction_on_id_i_coproduct_a_op = Opposite( product_to_exp_adjunction_on_id_t_product_a ); # Coexp( i x a, a ) -> i  ==  op( t -> Exp( a, t x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_i_op = Opposite( product_to_exp_adjunction_on_id_a_product_t ); # Coexp( a x i, i ) -> a  ==  op( a -> Exp( t, a x t ) )
true
gap> coproduct_to_coexp_adjunction_on_id_t_coproduct_a_op = Opposite( product_to_exp_adjunction_on_id_i_product_a ); # Coexp( t x a, a ) -> t  ==  op( i -> Exp( a, i x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_t_op = Opposite( product_to_exp_adjunction_on_id_a_product_i ); # Coexp( a x t, t ) -> a  ==  op( a -> Exp( i, a x i ) )
true

gap> cocart_coev_ab_op = Opposite( product_to_exp_adjunction_on_id_a_product_b );
true
gap> cocart_coev_ba_op = Opposite( product_to_exp_adjunction_on_id_b_product_a );
true
gap> cocart_coev_cd_op = Opposite( product_to_exp_adjunction_on_id_c_product_d );
true
gap> cocart_coev_dc_op = Opposite( product_to_exp_adjunction_on_id_d_product_c );
true

gap> cocart_coev_ia_op = Opposite( product_to_exp_adjunction_on_id_t_product_a );
true
gap> cocart_coev_ai_op = Opposite( product_to_exp_adjunction_on_id_a_product_t );
true
gap> cocart_coev_ta_op = Opposite( product_to_exp_adjunction_on_id_i_product_a );
true
gap> cocart_coev_at_op = Opposite( product_to_exp_adjunction_on_id_a_product_i );
true

#####################################################
# Adjunction maps on non-identities
#####################################################

# Adjunction maps on product morphisms

gap> product_to_exp_adjunction_on_alpha_product_beta := DirectProductToExponentialAdjunctionMap( a, c, alpha_product_beta );;
gap> product_to_exp_adjunction_on_beta_product_alpha := DirectProductToExponentialAdjunctionMap( c, a, beta_product_alpha );;

gap> coproduct_to_coexp_adjunction_on_alpha_coproduct_beta_op := CoproductToCoexponentialAdjunctionMap( a_op, c_op, alpha_coproduct_beta_op  );;
gap> coproduct_to_coexp_adjunction_on_beta_coproduct_alpha_op := CoproductToCoexponentialAdjunctionMap( c_op, a_op, beta_coproduct_alpha_op );;

# Adjunction maps on (co)exponential morphisms

gap> exp_to_product_adjunction_on_exp_alpha_beta := ExponentialToDirectProductAdjunctionMap( a, d, exp_alpha_beta );;
gap> exp_to_product_adjunction_on_exp_beta_alpha := ExponentialToDirectProductAdjunctionMap( c, b, exp_beta_alpha );;

gap> coexp_to_coproduct_adjunction_on_coexp_alpha_beta_op := CoexponentialToCoproductAdjunctionMap( b_op, c_op, coexp_alpha_beta_op );;
gap> coexp_to_coproduct_adjunction_on_coexp_beta_alpha_op := CoexponentialToCoproductAdjunctionMap( d_op, a_op, coexp_beta_alpha_op );;

# Opposite correspondence on adjunction maps on (co)products

##############################################
#                                            #
# alpha: a -> b                           #
# beta:  c -> d                           #
#                                            #
# alpha_product_beta: a x c -> b x d      #
# beta_product_alpha: c x a -> d x b      #
#                                            #
##############################################
#                                            #
# alpha_op: b -> a                         #
# beta_op:  d -> c                         #
#                                            #
# alpha_coproduct_beta_op : b x d -> a x c #
# beta_coproduct_alpha_op : d x b -> c x a #
#                                            #
##############################################

gap> coproduct_to_coexp_adjunction_on_alpha_coproduct_beta_op = Opposite( product_to_exp_adjunction_on_alpha_product_beta ); # Coexp( b x d, c ) -> a  ==  op( a -> Exp( c, b x d ) )
true
gap> coproduct_to_coexp_adjunction_on_beta_coproduct_alpha_op = Opposite( product_to_exp_adjunction_on_beta_product_alpha ); # Coexp( d x b, a ) -> c  ==  op( c -> Exp( a, d x b ) )
true

# Opposite correspondence on adjunction maps on (co)exps

#########################################################
#                                                       #
#   exp_alpha_beta: Exp( b, c ) -> Exp( a, d )       #
#   exp_beta_alpha: Exp( d, a ) -> Exp( c, b )       #
#                                                       #
#   exp_alpha_beta_op: Exp( a, d ) -> Exp( b, c )     #
#   exp_beta_alpha_op: Exp( c, b ) -> Exp( d, a )     #
#                                                       #
#########################################################
#                                                       #
# coexp_alpha_beta: Coexp( a, d ) -> Coexp( b, c )   #
# coexp_beta_alpha: Coexp( c, b ) -> Coexp( d, a )   #
#                                                       #
# coexp_alpha_beta_op: Coexp( b, c ) -> Coexp( a, d ) #
# coexp_beta_alpha_op: Coexp( d, a ) -> Coexp( c, b ) #
#                                                       #
#########################################################

gap> coexp_to_coproduct_adjunction_on_coexp_alpha_beta_op = Opposite( exp_to_product_adjunction_on_exp_beta_alpha ); # b -> Coexp( a, d ) x c  ==  op( Exp( d, a ) x c -> b )
true
gap> coexp_to_coproduct_adjunction_on_coexp_beta_alpha_op = Opposite( exp_to_product_adjunction_on_exp_alpha_beta ); # d -> Coexp( c, b ) x a  ==  op( Exp( b, c ) x a -> d )
true

#####################################################
# Pre and post (co)composition
#####################################################

gap> precompose_abc := CartesianPreComposeMorphism( a, b, c );;
gap> precompose_cba := CartesianPreComposeMorphism( c, b, a );;

gap> precocompose_abc_op := CocartesianPreCoComposeMorphism( a_op, b_op, c_op );;
gap> precocompose_cba_op := CocartesianPreCoComposeMorphism( c_op, b_op, a_op );;

gap> postcompose_abc := CartesianPostComposeMorphism( a, b, c );;
gap> postcompose_cba := CartesianPostComposeMorphism( c, b, a );;

gap> postcocompose_abc_op := CocartesianPostCoComposeMorphism( a_op, b_op, c_op );;
gap> postcocompose_cba_op := CocartesianPostCoComposeMorphism( c_op, b_op, a_op );;

# Opposite correspondence on compositions

gap> precocompose_abc_op = Opposite( precompose_cba );
true
gap> precocompose_cba_op = Opposite( precompose_abc );
true

gap> postcocompose_abc_op = Opposite( postcompose_cba );
true
gap> postcocompose_cba_op = Opposite( postcompose_abc );
true

#####################################################
# (Co)CartesianDuals
#####################################################

gap> a_dual := CartesianDualOnObjects( a );;
gap> b_dual := CartesianDualOnObjects( b );;

gap> a_codualop := CocartesianDualOnObjects( a_op );;
gap> b_codualop := CocartesianDualOnObjects( b_op );;

# CartesianDual on morphisms for the terminal category

gap> dual_id_a_product_b := CartesianDualOnMorphisms( id_a_product_b );;
gap> dual_id_b_product_a := CartesianDualOnMorphisms( id_b_product_a );;

gap> dual_exp_alpha_beta := CartesianDualOnMorphisms( exp_alpha_beta );;
gap> dual_exp_beta_alpha := CartesianDualOnMorphisms( exp_beta_alpha );;

gap> dual_cart_coev_ab := CartesianDualOnMorphisms( cart_coev_ab );;
gap> dual_cart_coev_ba := CartesianDualOnMorphisms( cart_coev_ba );;

# CocartesianDual on morphisms for opposite of the terminal category

gap> codual_id_a_coproduct_b_op := CocartesianDualOnMorphisms( id_a_coproduct_b_op );;
gap> codual_id_b_coproduct_a_op := CocartesianDualOnMorphisms( id_b_coproduct_a_op );;

gap> codual_coexp_alpha_beta_op := CocartesianDualOnMorphisms( coexp_alpha_beta_op );;
gap> codual_coexp_beta_alpha_op := CocartesianDualOnMorphisms( coexp_beta_alpha_op );;

gap> codual_cocart_coev_ab_op := CocartesianDualOnMorphisms( cocart_coev_ab_op );;
gap> codual_cocart_coev_ba_op := CocartesianDualOnMorphisms( cocart_coev_ba_op );;

# Opposite correspondence

gap> a_codualop = Opposite( a_dual );
true
gap> b_codualop = Opposite( b_dual );
true

gap> codual_id_a_coproduct_b_op = Opposite( dual_id_a_product_b );
true
gap> codual_id_b_coproduct_a_op = Opposite( dual_id_b_product_a );
true

gap> codual_coexp_alpha_beta_op = Opposite( dual_exp_beta_alpha );
true
gap> codual_coexp_beta_alpha_op = Opposite( dual_exp_alpha_beta );
true

gap> codual_cocart_coev_ab_op = Opposite( dual_cart_coev_ab );
true
gap> codual_cocart_coev_ba_op = Opposite( dual_cart_coev_ba );
true

#####################################################
# Evaluation for (co)dual
#####################################################

gap> cart_ev_for_dual_a := CartesianEvaluationForCartesianDual( a );;
gap> cart_ev_for_dual_b := CartesianEvaluationForCartesianDual( b );;
gap> cart_ev_for_dual_i := CartesianEvaluationForCartesianDual( i );;
gap> cart_ev_for_dual_t := CartesianEvaluationForCartesianDual( t );;

gap> cocart_ev_for_codual_a_op := CocartesianEvaluationForCocartesianDual( a_op );;
gap> cocart_ev_for_codual_b_op := CocartesianEvaluationForCocartesianDual( b_op );;
gap> cocart_ev_for_codual_i_op := CocartesianEvaluationForCocartesianDual( i_op );;
gap> cocart_ev_for_codual_t_op := CocartesianEvaluationForCocartesianDual( t_op );;

# Opposite correspondence

gap> cocart_ev_for_codual_a_op = Opposite( cart_ev_for_dual_a );
true
gap> cocart_ev_for_codual_b_op = Opposite( cart_ev_for_dual_b );
true
gap> cocart_ev_for_codual_i_op = Opposite( cart_ev_for_dual_t );
true
gap> cocart_ev_for_codual_t_op = Opposite( cart_ev_for_dual_i );
true

gap> cocart_ev_for_codual_a_op = Opposite( cart_ev_for_dual_b );
true
gap> cocart_ev_for_codual_b_op = Opposite( cart_ev_for_dual_a );
true
gap> cocart_ev_for_codual_i_op = Opposite( cart_ev_for_dual_i );
true
gap> cocart_ev_for_codual_t_op = Opposite( cart_ev_for_dual_t );
true

#####################################################
# (Co)CartesianBidual
#####################################################

gap> morphism_to_cart_bidual_c := MorphismToCartesianBidual( c );;
gap> morphism_to_cart_bidual_d := MorphismToCartesianBidual( d );;

gap> morphism_from_cocart_bidual_c_op := MorphismFromCocartesianBidual( c_op );;
gap> morphism_from_cocart_bidual_d_op := MorphismFromCocartesianBidual( d_op );;

# Opposite correspondence

gap> morphism_from_cocart_bidual_c_op = Opposite( morphism_to_cart_bidual_c );
true
gap> morphism_from_cocart_bidual_d_op = Opposite( morphism_to_cart_bidual_d );
true

gap> morphism_from_cocart_bidual_c_op = Opposite( morphism_to_cart_bidual_d );
false
gap> morphism_from_cocart_bidual_d_op = Opposite( morphism_to_cart_bidual_c );
false

#############################################################
# (Co)Product and (co)exp compatibility
#############################################################

gap> product_to_exp_compatibility_abcd := DirectProductExponentialCompatibilityMorphism( [ a, b, c, d ] );; # Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d )
gap> product_to_exp_compatibility_cadb := DirectProductExponentialCompatibilityMorphism( [ c, a, d, b ] );; # Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b )

gap> coexp_to_coproduct_compatibility_abcd_op := CoexponentialCoproductCompatibilityMorphism( [ a_op, b_op, c_op, d_op ] );; # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )
gap> coexp_to_coproduct_compatibility_bdac_op := CoexponentialCoproductCompatibilityMorphism( [ b_op, d_op, a_op, c_op ] );; # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )

# Opposite correspondence

gap> coexp_to_coproduct_compatibility_abcd_op = Opposite( product_to_exp_compatibility_cadb ); # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )  ==  op( Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b ) )
true
gap> coexp_to_coproduct_compatibility_bdac_op = Opposite( product_to_exp_compatibility_abcd ); # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )  ==  op( Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d ) )
true

gap> coexp_to_coproduct_compatibility_abcd_op = Opposite( product_to_exp_compatibility_abcd ); # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )  =/=  op( Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d ) )
true
gap> coexp_to_coproduct_compatibility_bdac_op = Opposite( product_to_exp_compatibility_cadb ); # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )  =/=  op( Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b ) )
true

#########################################################
# (Co)Cartesian compatibility
#########################################################

# (Co)CartesianDuality compatibility

gap> direct_product_cart_duality_compatibility_ab := DirectProductCartesianDualityCompatibilityMorphism( a, b );; # a^v x b^v -> (a x b)^v
gap> direct_product_cart_duality_compatibility_ba := DirectProductCartesianDualityCompatibilityMorphism( b, a );; # b^v x a^v -> (b x a)^v
gap> direct_product_cart_duality_compatibility_cd := DirectProductCartesianDualityCompatibilityMorphism( c, d );; # c^v x d^v -> (c x d)^v
gap> direct_product_cart_duality_compatibility_dc := DirectProductCartesianDualityCompatibilityMorphism( d, c );; # d^v x c^v -> (d x c)^v

gap> cocart_duality_coproduct_compatibility_ab_op := CocartesianDualityCoproductCompatibilityMorphism( a_op, b_op );; # (a x b)_v -> a_v x b_v
gap> cocart_duality_coproduct_compatibility_ba_op := CocartesianDualityCoproductCompatibilityMorphism( b_op, a_op );; # (b x a)_v -> b_v x a_v
gap> cocart_duality_coproduct_compatibility_cd_op := CocartesianDualityCoproductCompatibilityMorphism( c_op, d_op );; # (c x d)_v -> c_v x d_v
gap> cocart_duality_coproduct_compatibility_dc_op := CocartesianDualityCoproductCompatibilityMorphism( d_op, c_op );; # (d x c)_v -> d_v x c_v

# Opposite correspondence on (co)duality compatibility

gap> cocart_duality_coproduct_compatibility_ab_op = Opposite( direct_product_cart_duality_compatibility_ab );
true
gap> cocart_duality_coproduct_compatibility_ba_op = Opposite( direct_product_cart_duality_compatibility_ba );
true
gap> cocart_duality_coproduct_compatibility_cd_op = Opposite( direct_product_cart_duality_compatibility_cd );
true
gap> cocart_duality_coproduct_compatibility_dc_op = Opposite( direct_product_cart_duality_compatibility_dc );
true

gap> cocart_duality_coproduct_compatibility_ba_op = Opposite( direct_product_cart_duality_compatibility_cd );
true
gap> cocart_duality_coproduct_compatibility_ba_op = Opposite( direct_product_cart_duality_compatibility_dc );
true
gap> cocart_duality_coproduct_compatibility_dc_op = Opposite( direct_product_cart_duality_compatibility_ab );
true
gap> cocart_duality_coproduct_compatibility_dc_op = Opposite( direct_product_cart_duality_compatibility_ba );
true

#########################################################
# Morphism from direct product to exponential 
#########################################################

gap> morphism_from_direct_product_to_exp_ab := MorphismFromDirectProductToExponential( a, b );;
gap> morphism_from_direct_product_to_exp_ba := MorphismFromDirectProductToExponential( b, a );;
gap> morphism_from_direct_product_to_exp_cd := MorphismFromDirectProductToExponential( c, d );;
gap> morphism_from_direct_product_to_exp_dc := MorphismFromDirectProductToExponential( d, c );;

gap> morphism_from_coexp_to_coproduct_ab_op := MorphismFromCoexponentialToCoproduct( a_op, b_op );;
gap> morphism_from_coexp_to_coproduct_ba_op := MorphismFromCoexponentialToCoproduct( b_op, a_op );;
gap> morphism_from_coexp_to_coproduct_cd_op := MorphismFromCoexponentialToCoproduct( c_op, d_op );;
gap> morphism_from_coexp_to_coproduct_dc_op := MorphismFromCoexponentialToCoproduct( d_op, c_op );;

# Opposite correspondence

gap> morphism_from_coexp_to_coproduct_ab_op = Opposite( morphism_from_direct_product_to_exp_ba );
true
gap> morphism_from_coexp_to_coproduct_ba_op = Opposite( morphism_from_direct_product_to_exp_ab );
true
gap> morphism_from_coexp_to_coproduct_cd_op = Opposite( morphism_from_direct_product_to_exp_dc );
true
gap> morphism_from_coexp_to_coproduct_dc_op = Opposite( morphism_from_direct_product_to_exp_cd );
true

gap> morphism_from_coexp_to_coproduct_ab_op = Opposite( morphism_from_direct_product_to_exp_cd );
true
gap> morphism_from_coexp_to_coproduct_ab_op = Opposite( morphism_from_direct_product_to_exp_dc );
true

gap> morphism_from_coexp_to_coproduct_cd_op = Opposite( morphism_from_direct_product_to_exp_ab );
true
gap> morphism_from_coexp_to_coproduct_cd_op = Opposite( morphism_from_direct_product_to_exp_ba );
true

#########################################################
# Isomorphisms between dual and exp
#########################################################

gap> isomorphism_from_dual_to_exp_a := IsomorphismFromCartesianDualToExponential( a );;
gap> isomorphism_from_dual_to_exp_b := IsomorphismFromCartesianDualToExponential( b );;
gap> isomorphism_from_dual_to_exp_c := IsomorphismFromCartesianDualToExponential( c );;
gap> isomorphism_from_dual_to_exp_d := IsomorphismFromCartesianDualToExponential( d );;

gap> isomorphism_from_exp_to_dual_a := IsomorphismFromExponentialToCartesianDual( a );;
gap> isomorphism_from_exp_to_dual_b := IsomorphismFromExponentialToCartesianDual( b );;
gap> isomorphism_from_exp_to_dual_c := IsomorphismFromExponentialToCartesianDual( c );;
gap> isomorphism_from_exp_to_dual_d := IsomorphismFromExponentialToCartesianDual( d );;

gap> isomorphism_from_codual_to_coexp_a_op := IsomorphismFromCocartesianDualToCoexponential( a_op );;
gap> isomorphism_from_codual_to_coexp_b_op := IsomorphismFromCocartesianDualToCoexponential( b_op );;
gap> isomorphism_from_codual_to_coexp_c_op := IsomorphismFromCocartesianDualToCoexponential( c_op );;
gap> isomorphism_from_codual_to_coexp_d_op := IsomorphismFromCocartesianDualToCoexponential( d_op );;

gap> isomorphism_from_coexp_to_codual_a_op := IsomorphismFromCoexponentialToCocartesianDual( a_op );;
gap> isomorphism_from_coexp_to_codual_b_op := IsomorphismFromCoexponentialToCocartesianDual( b_op );;
gap> isomorphism_from_coexp_to_codual_c_op := IsomorphismFromCoexponentialToCocartesianDual( c_op );;
gap> isomorphism_from_coexp_to_codual_d_op := IsomorphismFromCoexponentialToCocartesianDual( d_op );;

# Opposite correspondence

gap> isomorphism_from_codual_to_coexp_a_op = Opposite( isomorphism_from_exp_to_dual_a );
true
gap> isomorphism_from_codual_to_coexp_b_op = Opposite( isomorphism_from_exp_to_dual_b );
true
gap> isomorphism_from_codual_to_coexp_c_op = Opposite( isomorphism_from_exp_to_dual_c );
true
gap> isomorphism_from_codual_to_coexp_d_op = Opposite( isomorphism_from_exp_to_dual_d );
true

gap> isomorphism_from_coexp_to_codual_a_op = Opposite( isomorphism_from_dual_to_exp_a );
true
gap> isomorphism_from_coexp_to_codual_b_op = Opposite( isomorphism_from_dual_to_exp_b );
true
gap> isomorphism_from_coexp_to_codual_c_op = Opposite( isomorphism_from_dual_to_exp_c );
true
gap> isomorphism_from_coexp_to_codual_d_op = Opposite( isomorphism_from_dual_to_exp_d );
true

gap> isomorphism_from_codual_to_coexp_c_op = Opposite( isomorphism_from_exp_to_dual_a );
true
gap> isomorphism_from_codual_to_coexp_c_op = Opposite( isomorphism_from_exp_to_dual_b );
true
gap> isomorphism_from_codual_to_coexp_c_op = Opposite( isomorphism_from_exp_to_dual_d );
true

gap> isomorphism_from_coexp_to_codual_d_op = Opposite( isomorphism_from_dual_to_exp_a );
true
gap> isomorphism_from_coexp_to_codual_d_op = Opposite( isomorphism_from_dual_to_exp_b );
true
gap> isomorphism_from_coexp_to_codual_d_op = Opposite( isomorphism_from_dual_to_exp_c );
true

#########################################################
# Universal property of dual
#########################################################

# Morphisms

gap> ab_to_t := UniversalMorphismIntoTerminalObject( a_product_b );;
gap> cd_to_t := UniversalMorphismIntoTerminalObject( c_product_d );;

gap> i_to_ab := UniversalMorphismFromInitialObject( a_product_b );;
gap> i_to_cd := UniversalMorphismFromInitialObject( c_product_d );;

gap> ab_to_t_op := UniversalMorphismIntoTerminalObject( a_coproduct_b_op );;
gap> cd_to_t_op := UniversalMorphismIntoTerminalObject( c_coproduct_d_op );;

gap> t_to_ab_op := UniversalMorphismFromInitialObject( a_coproduct_b_op );;
gap> t_to_cd_op := UniversalMorphismFromInitialObject( c_coproduct_d_op );;

# Universal property

gap> universal_property_of_cart_dual_ab_to_t := UniversalPropertyOfCartesianDual( a, b, ab_to_t );;
gap> universal_property_of_cart_dual_cd_to_t := UniversalPropertyOfCartesianDual( c, d, cd_to_t );;

gap> universal_property_of_cocart_dual_t_to_ab_op := UniversalPropertyOfCocartesianDual( a_op, b_op, t_to_ab_op );;
gap> universal_property_of_cocart_dual_t_to_cd_op := UniversalPropertyOfCocartesianDual( c_op, d_op, t_to_cd_op);;

# Opposite correspondence

gap> universal_property_of_cocart_dual_t_to_ab_op = Opposite( universal_property_of_cart_dual_ab_to_t );
true
gap> universal_property_of_cocart_dual_t_to_cd_op = Opposite( universal_property_of_cart_dual_cd_to_t );
true

gap> universal_property_of_cocart_dual_t_to_ab_op = Opposite( universal_property_of_cart_dual_cd_to_t );
false
gap> universal_property_of_cocart_dual_t_to_cd_op = Opposite( universal_property_of_cart_dual_ab_to_t );
false

#########################################################
# Lambdas
#########################################################

gap> cart_lambda_intro_a_to_b := CartesianLambdaIntroduction( alpha );;
gap> cart_lambda_intro_b_to_c := CartesianLambdaIntroduction( gamma );;
gap> cart_lambda_intro_c_to_d := CartesianLambdaIntroduction( beta );;

gap> cocart_lambda_intro_b_to_a_op := CocartesianLambdaIntroduction( alpha_op );;
gap> cocart_lambda_intro_c_to_b_op := CocartesianLambdaIntroduction( gamma_op );;
gap> cocart_lambda_intro_d_to_c_op := CocartesianLambdaIntroduction( beta_op );;

gap> cart_lambda_elim_t_to_exp_ab := CartesianLambdaElimination( a, b, cart_lambda_intro_a_to_b );;
gap> cart_lambda_elim_t_to_exp_bc := CartesianLambdaElimination( b, c, cart_lambda_intro_b_to_c );;
gap> cart_lambda_elim_t_to_exp_cd := CartesianLambdaElimination( c, d, cart_lambda_intro_c_to_d );;

gap> cocart_lambda_elim_coexp_ba_to_t_op := CocartesianLambdaElimination( b_op, a_op, cocart_lambda_intro_b_to_a_op );;
gap> cocart_lambda_elim_coexp_cb_to_t_op := CocartesianLambdaElimination( c_op, b_op, cocart_lambda_intro_c_to_b_op );;
gap> cocart_lambda_elim_coexp_dc_to_t_op := CocartesianLambdaElimination( d_op, c_op, cocart_lambda_intro_d_to_c_op );;

# Opposite correspondence

gap> cocart_lambda_intro_b_to_a_op = Opposite( cart_lambda_intro_a_to_b );
true
gap> cocart_lambda_intro_c_to_b_op = Opposite( cart_lambda_intro_b_to_c );
true
gap> cocart_lambda_intro_d_to_c_op = Opposite( cart_lambda_intro_c_to_d );
true

gap> cocart_lambda_elim_coexp_ba_to_t_op = Opposite( cart_lambda_elim_t_to_exp_ab );
true
gap> cocart_lambda_elim_coexp_cb_to_t_op = Opposite( cart_lambda_elim_t_to_exp_bc );
true
gap> cocart_lambda_elim_coexp_dc_to_t_op = Opposite( cart_lambda_elim_t_to_exp_cd );
true

gap> cocart_lambda_intro_d_to_c_op = Opposite( cart_lambda_intro_a_to_b );
true
gap> cocart_lambda_intro_d_to_c_op = Opposite( cart_lambda_intro_b_to_c );
true

gap> cocart_lambda_elim_coexp_dc_to_t_op = Opposite( cart_lambda_elim_t_to_exp_ab );
false
gap> cocart_lambda_elim_coexp_dc_to_t_op = Opposite( cart_lambda_elim_t_to_exp_bc );
false

#########################################################
# Isomorphisms between object and (co)exponential
#########################################################

gap> isomorphism_from_a_to_exp := IsomorphismFromObjectToExponential( a );;
gap> isomorphism_from_b_to_exp := IsomorphismFromObjectToExponential( b );;
gap> isomorphism_from_c_to_exp := IsomorphismFromObjectToExponential( c );;
gap> isomorphism_from_d_to_exp := IsomorphismFromObjectToExponential( d );;
gap> isomorphism_from_i_to_exp := IsomorphismFromObjectToExponential( i );;
gap> isomorphism_from_t_to_exp := IsomorphismFromObjectToExponential( t );;

gap> isomorphism_from_exp_to_a := IsomorphismFromExponentialToObject( a );;
gap> isomorphism_from_exp_to_b := IsomorphismFromExponentialToObject( b );;
gap> isomorphism_from_exp_to_c := IsomorphismFromExponentialToObject( c );;
gap> isomorphism_from_exp_to_d := IsomorphismFromExponentialToObject( d );;
gap> isomorphism_from_exp_to_i := IsomorphismFromExponentialToObject( i );;
gap> isomorphism_from_exp_to_t := IsomorphismFromExponentialToObject( t );;

gap> isomorphism_from_a_to_coexpop := IsomorphismFromObjectToCoexponential( a_op );;
gap> isomorphism_from_b_to_coexpop := IsomorphismFromObjectToCoexponential( b_op );;
gap> isomorphism_from_c_to_coexpop := IsomorphismFromObjectToCoexponential( c_op );;
gap> isomorphism_from_d_to_coexpop := IsomorphismFromObjectToCoexponential( d_op );;
gap> isomorphism_from_i_to_coexpop := IsomorphismFromObjectToCoexponential( i_op );;
gap> isomorphism_from_t_to_coexpop := IsomorphismFromObjectToCoexponential( t_op );;

gap> isomorphism_from_coexp_to_a_op := IsomorphismFromCoexponentialToObject( a_op );;
gap> isomorphism_from_coexp_to_b_op := IsomorphismFromCoexponentialToObject( b_op );;
gap> isomorphism_from_coexp_to_c_op := IsomorphismFromCoexponentialToObject( c_op ) ;;
gap> isomorphism_from_coexp_to_d_op := IsomorphismFromCoexponentialToObject( d_op );;
gap> isomorphism_from_coexp_to_i_op := IsomorphismFromCoexponentialToObject( i_op );;
gap> isomorphism_from_coexp_to_t_op := IsomorphismFromCoexponentialToObject( t_op );;

# Opposite correspondence

gap> isomorphism_from_a_to_coexpop = Opposite( isomorphism_from_exp_to_a );
true
gap> isomorphism_from_b_to_coexpop = Opposite( isomorphism_from_exp_to_b );
true
gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_c );
true
gap> isomorphism_from_d_to_coexpop = Opposite( isomorphism_from_exp_to_d );
true
gap> isomorphism_from_i_to_coexpop = Opposite( isomorphism_from_exp_to_t );
true
gap> isomorphism_from_t_to_coexpop = Opposite( isomorphism_from_exp_to_i );
true

gap> isomorphism_from_coexp_to_a_op = Opposite( isomorphism_from_a_to_exp );
true
gap> isomorphism_from_coexp_to_b_op = Opposite( isomorphism_from_b_to_exp );
true
gap> isomorphism_from_coexp_to_c_op = Opposite( isomorphism_from_c_to_exp );
true
gap> isomorphism_from_coexp_to_d_op = Opposite( isomorphism_from_d_to_exp );
true
gap> isomorphism_from_coexp_to_i_op = Opposite( isomorphism_from_t_to_exp );
true
gap> isomorphism_from_coexp_to_t_op = Opposite( isomorphism_from_i_to_exp );
true

gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_a );
false
gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_b );
false
gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_d );
false
gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_i );
false

gap> isomorphism_from_coexp_to_d_op = Opposite( isomorphism_from_a_to_exp );
false
gap> isomorphism_from_coexp_to_d_op = Opposite( isomorphism_from_b_to_exp );
false
gap> isomorphism_from_coexp_to_d_op = Opposite( isomorphism_from_c_to_exp );
false
gap> isomorphism_from_coexp_to_d_op = Opposite( isomorphism_from_t_to_exp );
false

gap> STOP_TEST("TerminalCategory.tst", 1);
