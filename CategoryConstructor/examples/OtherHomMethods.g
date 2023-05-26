#! @Chunk OtherHomMethods


#! @Example
LoadPackage( "CategoryConstructor" );
#! true
LoadPackage( "FreydCategoriesForCAP" );
#! true
QQ := HomalgFieldOfRationals();
#! Q
QQ_rows := CategoryOfRows( QQ );
#! Rows( Q )
t := TensorUnit( QQ_rows );
#! <A row module over Q of rank 1>
id_t := IdentityMorphism( t );
#! <An identity morphism in Rows( Q )>
1*(11)*7 + 2*(12)*8 + 3*(13)*9;
#! 620
4*(11)*3 + 5*(12)*4 + 6*(13)*1;
#! 450
alpha_s :=  [ [ 1 , 2 , 3  ], [ 4 , 5 , 6  ] ] * id_t;;
beta_s := [ [ 7 , 8 , 9  ], [ 3 , 4 , 1  ] ] * id_t;;
gamma_s := [ 620 , 450  ] * id_t;;
MereExistenceOfSolutionOfLinearSystemInAbCategory
                                  ( QQ_rows, alpha_s, beta_s, gamma_s );
#! true
MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory
                                  ( QQ_rows, alpha_s, beta_s, gamma_s );
#! false
x := SolveLinearSystemInAbCategory( QQ_rows, alpha_s, beta_s, gamma_s );;
1*x[1]*7 + 2*x[2]*8 + 3*x[3]*9 = gamma_s[1];
#! true
4*x[1]*3 + 5*x[2]*4 + 6*x[3]*1 = gamma_s[2];
#! true
MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory
                                  ( QQ_rows, alpha_s, beta_s );
#! false
basis := BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory
                                  ( QQ_rows, alpha_s, beta_s );;
Length( basis );
#! 1
Display( basis[1][1] );
#! Source:
#! A row module over Q of rank 1
#!
#! Matrix:
#! [ [  111/13 ] ]
#!
#! Range:
#! A row module over Q of rank 1
#!
#! A morphism in Rows( Q )
Display( basis[1][2] );
#! Source:
#! A row module over Q of rank 1
#!
#! Matrix:
#! [ [  -141/26 ] ]
#!
#! Range:
#! A row module over Q of rank 1
#!
#! A morphism in Rows( Q )
Display( basis[1][3] );
#! Source:
#! A row module over Q of rank 1
#!
#! Matrix:
#! [ [  1 ] ]
#!
#! Range:
#! A row module over Q of rank 1
#!
#! A morphism in Rows( Q )
2*(11)*5 + 3*(12)*7 + 9*(13)*2;
#! 596
Add( alpha_s,  [ 2 , 3 , 9  ] * id_t );
Add( beta_s, [ 5 , 7 , 2  ] * id_t );
Add( gamma_s, 596 * id_t );
MereExistenceOfSolutionOfLinearSystemInAbCategory
                                  ( QQ_rows, alpha_s, beta_s, gamma_s );
#! true
MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory
                                  ( QQ_rows, alpha_s, beta_s, gamma_s );
#! true
x := SolveLinearSystemInAbCategory( QQ_rows, alpha_s, beta_s, gamma_s );;
1*x[1]*7 + 2*x[2]*8 + 3*x[3]*9 = gamma_s[1];
#! true
4*x[1]*3 + 5*x[2]*4 + 6*x[3]*1 = gamma_s[2];
#! true
2*x[1]*5 + 3*x[2]*7 + 9*x[3]*2 = gamma_s[3];
#! true
MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory
                                  ( QQ_rows, alpha_s, beta_s );
#! true
basis := BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory
                                  ( QQ_rows, alpha_s, beta_s );
#! [ ]
#! @EndExample
