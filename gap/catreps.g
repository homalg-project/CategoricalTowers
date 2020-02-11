#***************************************************************************
#       Copyright (C) 2008 Peter Webb
#       Copyright (C) 2011 Peter Webb, Fan Zhang
#
#  Distributed under the terms of the GNU General Public License (GPL)
#                  http://www.gnu.org/licenses/
#
#  The overall structure of the catreps package was designed and most if it
#  written by Peter Webb <webb@math.umn.edu>, who is also the maintainer. 
#  Contributions were made by Dan Christensen,
#  Fan Zhang and Moriah Elkin.
#***************************************************************************




##############################################################################
##
## SupportOfMorphism(m) returns the list of positions at which the 
## list m is defined.
##
##############################################################################
SupportOfMorphism:=function(m)
    local s, i;
    s:=[];
    for i in [1..Length(m)] do
        if IsBound(m[i]) then Add(s,i);
        fi;
    od;
    return(s);
end;

##############################################################################
##
## IdMorphism(l) returns the identity morphism on the set l.
## A morphism is stored as a list of the images of its values on a set
## of numbers, which form its domain of definition, and are taken to be
## an object in a concrete category. At elements of other objects the
## morphism will be undefined.
##
##############################################################################
IdMorphism:=function(l)
    local m, i;
    m:=[];
    for i in l do
        m[i]:=i;
    od;
    return(m);
end;

##############################################################################
##
## Composition(f,g) returns the composition of the functions f and g, expressed
## as lists of their values.
##
##############################################################################
Composition:=function(f,g)
    local i, h;
    h:=[];
    for i in [1..Length(f)] do
        if IsBound(f[i]) then
            if IsBound(g[f[i]]) then
                h[i]:=g[f[i]];
            else return(false);
            fi;
        fi;
    od;
    return(h);
end;

##############################################################################
##
## IsComposable(f,g) returns true if the functions f and g, expressed
## as lists of their values, can be composed and false otherwise.
##
##############################################################################
IsComposable:=function(f,g)
    local i;
    for i in [1..Length(f)] do
        if IsBound(f[i]) then
            if not IsBound(g[f[i]]) then return(false);
            fi;
        fi;
    od;
    return(true);
end;

##############################################################################
##
## Objects(cat) returns the objects of the concrete category cat, as a list
## of sets. At the moment it will not work unless for every object there
## is at least one generator morphism whose support is that object.
##
##############################################################################
Objects:=function(cat)
    local m;
    if IsBound(cat.objects) then return(cat.objects);
    fi;
    cat.objects:=[];
    for m in cat.generators do
        Add(cat.objects,SupportOfMorphism(m));
    od;
    cat.objects:=SSortedList(cat.objects);
    return(cat.objects);
end;

##############################################################################
##
## Origin(cat,m) returns the position in cat.objects of the domain of the
## morphism m.
##
##############################################################################
Origin:=function(cat,m)
    local k, x;
    k:=PositionBound(m);
    for x in [1..Length(cat.objects)] do
         if k in cat.objects[x] then
              return(x);
         fi;
    od;
end;

##############################################################################
##
## Terminus(cat,m) returns the position in cat.objects of the domain of the
## morphism m.
##
##############################################################################
Terminus:=function(cat,m)
    local k, x;
    k:=m[PositionBound(m)];
    for x in [1..Length(cat.objects)] do
         if k in cat.objects[x] then
              return(x);
         fi;
    od;
end;



Domains:=function(C)
Objects(C);
C.domain:=List(C.generators,x->Origin(C,x));
C.codomain:=List(C.generators,x->Terminus(C,x));
end;

##############################################################################

ConcreteCategoryOps:=rec();

##############################################################################
##
## ConcreteCategory(list of functions, (list of sets))
## There are optionally one or two arguments. The first is a list of generating
## functions of the category, the second is a list of the objects of the category.
## The function starts a record for a concrete category.
## If there is only one argument, the objects are taken to be the domains of the
## generator morphisms, so for every object there should be
## at least one generator morphism whose support is that object.
## It could be the identity morphisms, but doesn't have to be.
##
## Written by Peter Webb 2008, Moriah Elkin 2018.
##
##############################################################################

ConcreteCategory:=function(arg)
    local output, domains, codomains, x, m, cod, dom, included, obj, nums;
    output:=rec(generators:=arg[1], operations:=ConcreteCategoryOps);
    if Length(arg)=2 then
        #Checks if object sets overlap or entries repeated (catches ([1,2],[2,3,4]) or ([1,2,2]))
        nums:=[];
        for x in arg[2] do
            for m in x do
                if not (m in nums) then
                    Add(nums,m);
                else
                    Error("One or more entries is duplicated within one or more objects.");
                fi;
            od;
        od;

        #Computes domains/codomains of morphisms
        domains:=[];
        for m in arg[1] do
            Add(domains,SupportOfMorphism(m));
        od;
        domains:=SSortedList(domains);
        codomains:=[];
        for x in domains do
            for m in output.generators do
                if SupportOfMorphism(m)=x then
                    Add(codomains, List(x,a->m[a]));
                fi;
            od;
        od;
        codomains:=SSortedList(codomains);
        
        #Ensures domains/codomains of morphisms in provided objects list
        for dom in domains do
            included:=false;
            for obj in arg[2] do
                if IsSubset(obj,dom) then
                    included:=true;
                    break;
                fi;
            od;
            if included=false then
                Error("One or more morphisms have domains not included in objects list.");
            fi;
        od;
        for cod in codomains do
            included:=false;
            for obj in arg[2] do
                if IsSubset(obj,cod) then
                    included:=true;
                    break;
                fi;
            od;
            if included=false then
                Error("One or more morphisms have codomains not included in objects list.");
            fi;
        od;

        output.objects:=SSortedList(arg[2]);
    
    elif Length(arg)=1 then
        Objects(output);
    fi;

    Domains(output);
    return(output);
end;

##############################################################################
##
## EmptyMat(r,s) returns an r x s matrix in which each entry is [].
##
##############################################################################
EmptyMat:=function(r,s)
    local mat, i, j;
    mat:=[];
    for i in [1..r] do
    mat[i]:=[];
        for j in [1..s] do
            mat[i][j]:=[];
        od;
    od;
    return(mat);
end;

##############################################################################
##
## Morphisms(cat) returns an l x l matrix, where l is the number of objects
## in the category cat, and where the i,j entry is a list of the
## morphisms from object i to
## object j.
##
##############################################################################
Morphisms:=function(cat)
    local n, genmat, g, mormat, oldlength, newlength, i, j, k, h, templist;
    if IsBound(cat.morphisms) then return(cat.morphisms);
    fi;
    if not IsBound(cat.objects) then Objects(cat);
    fi;
    n:=Length(cat.objects);
    genmat:=EmptyMat(n,n);
    mormat:=EmptyMat(n,n);
    for g in cat.generators do
        Add(genmat[Origin(cat,g)][Terminus(cat,g)],g);
    od;
    for i in [1..n] do
        Add(mormat[i][i],IdMorphism(cat.objects[i]));
    od;
    oldlength:=0;
    newlength:=Sum(List(mormat,x->Sum(List(x,Length))));
    while oldlength < newlength do
        oldlength:=newlength;
        for i in [1..n] do
            for j in [1..n] do
                templist:=[];
                for k in [1..n] do
                    for g in genmat[k][j] do
                        for h in mormat[i][k] do
                            Add(templist, Composition(h,g));
                        od;
                    od;
                 od;
                 Append(mormat[i][j],templist);
                 mormat[i][j]:=SSortedList(mormat[i][j]);
            od;
        od;
        newlength:=Sum(List(mormat,x->Sum(List(x,Length))));
    od;
    cat.morphisms:=mormat;
    return(mormat);
end;



##############################################################################
##
## SafeBaseMat(M) returns a list a basis vectors for the space spanned
## by the rows of M.  If M is an empty list, so M has no rows, or if
## the elements of M are empty lists, so M has no columns, then the
## empty list is returned.  
##
##############################################################################

SafeBaseMat:=function(M)
    if IsEmpty(M) or IsEmpty(M[1]) then
        return [];
    else
        return BaseMat(M);
    fi;
end;


##############################################################################
##
## SafeIdentityMat(n, F) returns an nxn identity matrix over the field F.
## When n = 0, returns an empty list.
##
##############################################################################

SafeIdentityMat:=function(n, F)
    if n=0 then
        return [];
    else
        return IdentityMat(n, F);
    fi;
end;

##############################################################################
##
## SafeNullspaceMat(mat, F) returns a basis for the nullspace of mat, defined 
## over F. This works also when the domain or codomain are the zero vector space.
##
##############################################################################

SafeNullspaceMat:=function(mat, F)
    if mat=[] then return([]);
    fi;
    if mat[1]=[] then return(IdentityMat(Length(mat),F));
    fi;
    return(NullspaceMat(mat));
end;

##############################################################################
##
## CatRep(category, matrices, field)
## This function creates a representation of a category where the generators 
## are represented by the matrices in the list.
##
##############################################################################

CatRep:=function(C,L,F)
    local dimvec, i;
    dimvec:=List(Objects(C),x->0);
    for i in [1..Length(C.generators)] do
        if IsBound(L[i]) then
            dimvec[C.domain[i]]:=Length(L[i]);
        fi;
    od;
    return rec(
     category:=C,
     genimages:=L,
     field:=F,
     dimension:=dimvec,
     );
end; 


##############################################################################
##
## YonedaRep(category, object number, field)
## This returns the representation of the category on the subspace of the
## category algebra spanned by the morphisms whose domain is the specified
## object. The representation is projective, by Yoneda's lemma.
##
##############################################################################

YonedaRep:=function(cat,object,F)
    local genmatrices, mor, dimvec, i, j, k, f, matrix;
    genmatrices:=[];
    mor:=Morphisms(cat);
    dimvec:=List(mor[object],Length);
    for i in [1..Length(cat.generators)] do
        if dimvec[cat.domain[i]]>0 then
            matrix:=List([1..dimvec[cat.domain[i]]],x->List([1..dimvec[cat.codomain[i]]],y->Zero(F)));
            for j in [1..Length(mor[object][cat.domain[i]])] do
                f:=Composition(mor[object][cat.domain[i]][j],cat.generators[i]);
                k:=Position(mor[object][cat.codomain[i]],f);
                matrix[j][k]:=One(F);
            od;
            genmatrices[i]:=matrix;
        else genmatrices[i]:=[];
        fi;
    od;
    return rec(
     category:=cat,
     genimages:=genmatrices,
     field:=F,
     dimension:=dimvec,
     );
end; 

##############################################################################
##
## YonedaDualRep(category, object number, field)
## This returns the representation of the category on the dual of the subspace of the
## category algebra spanned by the morphisms whose codomain is the specified
## object. The representation is injective, because its dual is projective, by Yoneda's lemma.
##
##############################################################################

YonedaDualRep:=function(cat,object,F)
    local genmatrices, mor, dimvec, i, j, k, f, matrix;
    genmatrices:=[];
    mor:=Morphisms(cat);
    dimvec:=List(mor, x->Length(x[object]));
    for i in [1..Length(cat.generators)] do
        if dimvec[cat.domain[i]]>0 then
            matrix:=List([1..dimvec[cat.domain[i]]],x->List([1..dimvec[cat.codomain[i]]],y->Zero(F)));
            for j in [1..dimvec[cat.codomain[i]]] do
                f:=Composition(cat.generators[i],mor[cat.codomain[i]][object][j]);
                k:=Position(mor[cat.domain[i]][object],f);
                matrix[k][j]:=One(F);
            od;
            genmatrices[i]:=matrix;
        else genmatrices[i]:=[];
        fi;
    od;
    return rec(
     category:=cat,
     genimages:=genmatrices,
     field:=F,
     dimension:=dimvec,
     );
end;

#############################################################################
##
## ZeroRep(cat,field) returns the zero representation of the category.
##
#############################################################################

ZeroRep:=function(cat,F)
    local dimvec;
    dimvec:=List(Objects(cat),x->0);
    return rec(
     category:=cat,
     genimages:=List(cat.generators,x->[]),
     field:=F,
     dimension:=dimvec,
     );
end;

#############################################################################
##
## ConstantRep(cat,field) returns the constant (or trivial) representation of the category.
##
#############################################################################

ConstantRep:=function(cat,F)
    local dimvec;
    dimvec:=List(Objects(cat),x->1);
    return rec(
     category:=cat,
     genimages:=List(cat.generators,x->[[One(F)]]),
     field:=F,
     dimension:=dimvec,
     );
end; 


##############################################################################
##
## TensorProductMatrix(mat,mat) . . . Tensor product of two matrices
##
## The GAP command KroneckerProduct seems inexplicably slow and in tests on
## two 60 x 60 matrices takes about twice as long as the following code.
##
##############################################################################

TensorProductMatrix:=function(A,B)
    local u, v, matrix;
    matrix:=[];
    for u in A do
        for v in B do
            Add(matrix,Flat(List(u,x->x*v)));
        od;
    od;
    return(matrix);
end;

##############################################################################
##
## TensorProductRep(rep,rep) . . . Kronecker product of two representations
##
##############################################################################

TensorProductRep:=function(g,h)
    local mgens, i;
    mgens:=[];
    for i in [1..Length(g.genimages)] do
    if IsBound(g.genimages[i]) and IsBound(h.genimages[i]) then
    mgens[i]:=TensorProductMatrix(g.genimages[i],h.genimages[i]);
    fi;
    od;
    return CatRep(g.category,mgens, g.field);
end;

##############################################################################
##
## ExtractHom(vec, dimension vector 1, dimension vector 2)
## takes a vector and returns it repackaged as a list of dimvec1[i] by dimvec2[i] matrices.
##
##############################################################################


ExtractHom:=function(vec,dimvec1,dimvec2)
    local n, hom, l, i, j, mat;
    n:=0;
    hom:=[];
    for l in [1..Length(dimvec1)] do
        mat:=[];
        for i in [1..dimvec1[l]] do
            mat[i]:=[];
            for j in [1..dimvec2[l]] do
                n:=n+1;
                mat[i][j]:=vec[n];
            od;
        od;
        Add(hom,mat);
    od;
    return(hom);
end;

##############################################################################
##
## HomBasis(M, N) returns a basis for the space of 
## kC-module homomorphisms M -> N. Each element of the output list is a
## list of matrices, which the ith matrix is a map M[i] -> N[i].
##
## The algorithm used finds homomorphisms X so that Xg-gX=0 for all category generators
## g. The code is an elaboration by Peter Webb (October 2008) of code written 
## for group representations
## by Dan Christensen in August 2007.
##
##############################################################################

HomBasis:=function(M,N)
    local dimM, dimN, dM, dN, dMN, dimsumM, dimsumN, dimsumMN, r, s, i, j, k, l, v, f, domain, codomain;
#    dimM := M.dimension;
#    dimN := N.dimension;
dimsumM:=[];
dimsumM[1]:=0;
dimsumN:=[];
dimsumN[1]:=0;
dimsumMN:=[];
dimsumMN[1]:=0;
domain:=M.category.domain;
codomain:=M.category.codomain;
    r := Length(M.genimages);
    dM:=0;
    dN:=0;
    dMN:=0;
    for i in [1..Length(M.dimension)] do
    dM:=dM+M.dimension[i];
    dN:=dN+N.dimension[i];
    dMN:=dMN+M.dimension[i]*N.dimension[i];
    Add(dimsumM,dM);
    Add(dimsumN,dN);
    Add(dimsumMN,dMN);
    od;
    dimM:=dimsumM[Length(M.dimension)+1];
    dimN:=dimsumN[Length(M.dimension)+1];
    v:=NullMat(dimsumMN[Length(M.dimension)+1], dimM*dimN*r, M.field);
    for l in [1..r] do
        for s in [1..N.dimension[codomain[l]]] do
            for j in [1..N.dimension[domain[l]]] do
                for i in [1..M.dimension[domain[l]]] do
                    v[dimsumMN[domain[l]]+(i-1)*N.dimension[domain[l]]+j]
                    [(l-1)*dimM*dimN+dimsumM[domain[l]]*dimN+M.dimension[domain[l]]*dimsumN[codomain[l]]+(i-1)*N.dimension[codomain[l]]+s]
                    :=v[dimsumMN[domain[l]]+(i-1)*N.dimension[domain[l]]+j]
                    [(l-1)*dimM*dimN+dimsumM[domain[l]]*dimN+M.dimension[domain[l]]*dimsumN[codomain[l]]+(i-1)*N.dimension[codomain[l]]+s]
                    - N.genimages[l][j][s];
                od;
            od;
        od;
        for r in [1..M.dimension[domain[l]]] do
            for j in [1..N.dimension[codomain[l]]] do
                for i in [1..M.dimension[codomain[l]]] do
                    v[dimsumMN[codomain[l]]+(i-1)*N.dimension[codomain[l]]+j]
                    [(l-1)*dimM*dimN+dimsumM[domain[l]]*dimN+M.dimension[domain[l]]*dimsumN[codomain[l]]+(r-1)*N.dimension[codomain[l]]+j]
                    :=v[dimsumMN[codomain[l]]+(i-1)*N.dimension[codomain[l]]+j]
                    [(l-1)*dimM*dimN+dimsumM[domain[l]]*dimN+M.dimension[domain[l]]*dimsumN[codomain[l]]+(r-1)*N.dimension[codomain[l]]+j]
                    + M.genimages[l][r][i];
                od;
            od;
        od;
    od;
    f := SafeNullspaceMat(v, M.field);
    return(List(f,x->ExtractHom(x,M.dimension,N.dimension)));
end;

##############################################################################
##
## SumOfImages(rep,rep) . . returns a list of bases which give the sum of images of all 
## module homomorphisms A -> B. Term i in the list is a basis for the subspace of the 
## value of representation B at object i which is part of the sum of images.
##
##############################################################################

SumOfImages:=function(M,N)
    local  homs, basis, l, h;
    homs:=HomBasis(M,N);
    basis:=[];
    for l in [1..Length(M.dimension)] do
        basis[l]:=[];
        for h in homs do
            Append(basis[l],h[l]);
        od;
        if not(basis[l]=[]) then
            basis[l]:=List(SafeBaseMat(basis[l]),x->x);
        fi;
    od;
    return(basis);
end;

#############################################################################
##
## SubmoduleRep(rep, list of lists of vecs) . .  returns the representation which gives
## the action on the submodule spanned at each object by the corresponding
## list of vectors. Each list of vectors must be a basis. This is not checked.
##
#############################################################################

SubmoduleRep:=function(rep,v)
    local dimvec, vs, base, i, newimages, mat, domain, codomain;
    domain:=rep.category.domain;
    codomain:=rep.category.codomain;
    dimvec:=List(v,Length);
    vs:=[];
    base:=[];
    for i in [1..Length(v)] do
        if not(v[i]=[]) then
            vs[i]:=VectorSpace(rep.field,v[i]);
            base[i]:=Basis(vs[i],v[i]);
        fi;
    od;
    newimages:=[];
    for i in [1..Length(rep.genimages)] do
        mat:=List(v[domain[i]],x->[]);
        if not(v[codomain[i]]=[] or v[domain[i]]=[]) then
            mat:=List(base[domain[i]], 
            b->Coefficients(base[codomain[i]], b*rep.genimages[i]));
        fi;
        Add(newimages, mat);
    od;
    return rec(
        category:=rep.category,
        genimages:=newimages,
        field:=rep.field,
        dimension:=dimvec,
        isRepresentation:=true
        );
end;

#############################################################################
##
## QuotientRep(rep, basis structure) . . . returns the representation giving the
## action on the quotient by an invariant subspace.
##
## At the moment this does not work if the basis structure is for the zero subspace.
##
#############################################################################

QuotientRep:=function(rep,v)
    local basestructure, d, zero,onemat,i,j,positions,b,p,g,
        mat,newb,newimages,baseinverse;
    if Length(v)=0 then
        return rep;
    fi;
    basestructure:=List(v,x->ShallowCopy(SafeBaseMat(x)));
    for g in basestructure do
        TriangulizeMat(g);
    od;
    d:=List(basestructure,Length);
    if d=rep.dimension then
        return ZeroRep(rep.category,rep.field);
    fi;
    zero:=Zero(rep.field);
    positions:=[];
    baseinverse:=[];
    for j in [1..Length(rep.dimension)] do
        onemat:=IdentityMat(rep.dimension[j],rep.field);
        i:=1;
        positions[j]:=[];
        for b in basestructure[j] do
            while b[i]=zero do
                Add(positions[j],i);
                i:=i+1;
            od;
            i:=i+1;
        od;
        Append(positions[j],[i..rep.dimension[j]]);
        for p in positions[j] do
            Add(basestructure[j], onemat[p]);
        od;
        if basestructure[j]=[] then
            baseinverse[j]:=[];
        else
            baseinverse[j]:=basestructure[j]^-1;
        fi;
    od;
    newimages:=[];
    for g in [1..Length(rep.genimages)] do
        mat:=[];
        for p in positions[rep.category.domain[g]] do
            if baseinverse[rep.category.codomain[g]] <> [] then
                b:=rep.genimages[g][p]*baseinverse[rep.category.codomain[g]];
            fi;
            newb:=[];
            for i in [d[rep.category.codomain[g]]+1..rep.dimension[rep.category.codomain[g]]] do
                Add(newb,b[i]);
            od;
            Add(mat,newb);
        od;
        Add(newimages, mat);
    od;
    return rec(
        category:=rep.category,
        genimages:=newimages,
        field:=rep.field,
        dimension:=rep.dimension-d,
        isRepresentation:=true
        );
end;


##############################################################################
##
## DecomposeSubmodule(repn, basis structure) . . probably returns a list of two basis 
## structures for summands of the submodule of repn spanned by 
## the given basis structure, if the module is decomposable, and
## if the module is indecomposable it returns a list whose only element is the
## given basis.
##
## This code was developed by Peter Webb from code for group representations
## written by Bryan Simpkins and Robert Hank, University of
## Minnesota, April 2006, related to an approach taken by Michael Smith in
## code written in 1993, and tidied up by Dan Christensen, University of Western Ontario, Aug 2007.
##
##############################################################################

DecomposeSubmodule:= function(M,basisstructure)
	local newrep, c, d, initlist, b, x, a, n, z, kernel, kdim, image ;
	newrep := SubmoduleRep(M, basisstructure);
	d:=Maximum(newrep.dimension);
	initlist := HomBasis(newrep,newrep);
	Add(initlist, List(initlist[1], u->u*0));
	b := Length(initlist);
	while b > 0 do;
		c := b - 1;
		while c > 0 do;
	        a:=initlist[b]+initlist[c];
			n:=1;
			while n < d do
				for z in [1..Length(a)] do
		    		if not(a[z]=[]) then
		        		a[z]:=a[z]*a[z];
		    		fi;
				od;
				n:=2*n;
			od;
			kernel:=List(a,u->SafeNullspaceMat(u,M.field));
		 	kdim:=Sum(List(kernel,Length));
			if not(kdim=0 or kdim=Sum(newrep.dimension)) then
				image:=List(a,SafeBaseMat);
				for z in [1..Length(a)] do
				    if image[z] <> [] then
				        image[z]:=image[z]*basisstructure[z];
				    fi;
				    if kernel[z]<>[] then
				        kernel[z]:=kernel[z]*basisstructure[z];
				    fi;
				od;
				return [kernel,image];
			fi;
	   		c := c - 1;
		od;
		b := b - 1;
	od;
	return [basisstructure];
end;	
	
	
##############################################################################
##
## Decompose(rep) . . returns a list of basis structures of direct summands of rep which
## are probably indecomposable.
##
## This code was developed by Peter Webb from code for group representations
## written by Bryan Simpkins and Robert Hank, University of
## Minnesota, April 2006, related to an approach taken by Michael Smith in
## code written in 1993, and tidied up by Dan Christensen, University of Western Ontario, Aug 2007.
##
##############################################################################

Decompose:= function(rep)
	local summands, result, q;
	if IsBound(rep.summands) then return(rep.summands);
	fi;
	summands := [List(rep.dimension, x->SafeIdentityMat(x,rep.field))];
	q := 1;
	# We maintain the following invariants:
	# - summands is a list of basis structures; the 'union' of these
	#   lists forms a basis structure for rep.
    # - the summands at positions < q appear to be indecomposable;
	#   those at positions >= q haven't been investigated completely.
	while IsBound(summands[q]) do;
		result := DecomposeSubmodule(rep, summands[q]);
		if Length(result) = 2 then
			summands[q] := result[1];
			Add(summands, result[2]);
		else
			q := q + 1;
		fi;
	od;
	rep.summands:=summands;
	return summands;
end;

##############################################################################
##
## Spin(rep, list of lists of vectors)
## returns a basis for the subrepresentation generated by the vectors in the lists.
## There is one entry in the list (of lists of vectors) for each object in the category,
## and it is a list of vectors which all belong to the representation space at that object.
## This is code which was developed from code written by
## Fan Zhang (University of Minnesota), March 2011.
##
##############################################################################


Spin:=function(rep,veclistlist)
local basis, olddim, dim, newlist, g, n, v;
basis:=List(veclistlist,SafeBaseMat);
dim:=Sum(List(basis,Length));
olddim:=dim-1;
while dim>olddim do
    olddim:=dim;
    newlist:=List(basis,x->List(x,y->y));
    for n in [1..Length(rep.genimages)] do
        g:=rep.genimages[n];
        for v in basis[rep.category.domain[n]] do
            Add(newlist[rep.category.codomain[n]],v*g);
        od;
    od;
    basis:=List(newlist,SafeBaseMat);
    dim:=Sum(List(basis,Length));
od;
return basis;
end;

##############################################################################
##
## OrthogonalComplement(list of vectors, dim, field)
## returns a basis for the orthgonal complement of the space spanned by the
## list of vectors, in a space of dimension dim (put there in case the list
## of vectors is empty).
##
##############################################################################

OrthogonalComplement:=function(veclist,n,field)
if veclist=[] then
    return(IdentityMat(n,field));
else return NullspaceMat(TransposedMat(veclist));
fi;
end;


##############################################################################
##
## CoSpin(rep, list of lists of vectors)
## returns a basis for the largest subrepresentation contained in the
## subspaces spanned by the vectors in the lists.
## There is one entry in the list (of lists of vectors) for each object in the category,
## and it is a list of vectors which all belong to the representation space at that object.
##
##############################################################################

CoSpin:=function(rep,veclistlist)
local basis, olddim, dim, newlist, g, n, v, output, i, transposedimages;
transposedimages:=List(rep.genimages,TransposedMat);
basis:=[];
for i in [1..Length(rep.dimension)] do
    basis[i]:=OrthogonalComplement(veclistlist[i],rep.dimension[i],rep.field);
od;
dim:=Sum(List(basis,Length));
olddim:=dim-1;
while dim>olddim do
    olddim:=dim;
    newlist:=List(basis,x->List(x,y->y));
    for n in [1..Length(rep.genimages)] do
        g:=transposedimages[n];
        for v in basis[rep.category.codomain[n]] do
            Add(newlist[rep.category.domain[n]],v*g);
        od;
    od;
    basis:=List(newlist,SafeBaseMat);
    dim:=Sum(List(basis,Length));
od;
output:=[];
for i in [1..Length(rep.dimension)] do
    output[i]:=OrthogonalComplement(basis[i],rep.dimension[i],rep.field);
od;
return output;
end;

##############################################################################
##
## EndomorphismGroup(cat, obj) returns the group of the endomorphisms of obj in
## cat, in permutation form. It assumes every endomorphism is invertible and that the generators of the 
## endomorphism group appear among the generators of the category.
##
## Written by Moriah Elkin July 2018.
##
##############################################################################

EndomorphismGroup:=function(cat,obj)
    local i, g, generators, permutations;
    permutations:=[];
    generators:=StructuralCopy(cat.generators);
    for g in generators do
        if Origin(cat,g)=obj and Terminus(cat,g)=obj then
            #add identity
            i:=1;
            for i in [1..Length(g)] do
                if not IsBound(g[i]) then
                    g[i]:=i;
                fi;
                i:=i+1;
            od;
            #convert to permutation and add to list
            Add(permutations,PermList(g));
        fi;
    od;
    if Length(permutations)>0 then
        return Group(permutations);
    fi;
    return Group([],());
end;
    
##############################################################################
##
## EndomorphismGroups(cat) returns a list containing the endomorphism group for
## each object in the category cat.
##
## Written by Moriah Elkin July 2018.
##
##############################################################################
    
EndomorphismGroups:=function(cat)
    cat.endomorphismgroups:=List(cat.objects,x->EndomorphismGroup(cat,x));
end;


    
##############################################################################
##
## FI(n) and FI2(n) interchangeably return a record for the category FI with
## objects 0...n. O is represented by the first object ( [1] ), and its morphisms
## correspond to the first element in every object, which is otherwise ignored
## (first elements only map to first elements). The category FI is the category of finite sets with
## injective maps that has featured in the theory of representation stability.
##
## Written by Moriah Elkin July 2018.
##
##############################################################################

FI:=function(n)
    local objectlist, morphismlist, i, j, x, m;
    morphismlist:=[];
    
    objectlist:=[];
    j:=0;
    for i in [1..n+1] do
        Add(objectlist, [j+1..j+i]);
        j:=j+i;
    od;
    
    for x in objectlist do
        if Length(x)<=n then
            m:=[];
            for i in x do
                m[i]:=i+Length(x);
            od;
            Add(morphismlist,m);
        fi;
        
        if Length(x)>=3 then
            m:=[];
            for i in x do
                m[i]:=i;
            od;
            m[x[2]]:=x[2]+1;
            m[x[3]]:=x[3]-1;
            Add(morphismlist,m);
        fi;
        
        if Length(x)>=4 then
            m:=[];
            m[x[1]]:=x[1];
            m[x[Length(x)]]:=x[2];
            for i in [x[2]..x[Length(x)-1]] do
                m[i]:=i+1;
            od;
            Add(morphismlist,m);
        fi;
    od;
    
    return ConcreteCategory(morphismlist, objectlist);
end;

FI2:=function(n)
    local objectlist, morphismlist, i, j, k, m;
    morphismlist:=[];
    objectlist:=[];
    j:=0;
    for i in [1..n+1] do
        Add(objectlist, [j+1..j+i]);
        
        if i<=n then
            m:=[];
            for k in [j+1..j+i] do
                m[k]:=k+i;
            od;
            Add(morphismlist,m);
        fi;
        
        if i>=3 then
            m:=[];
            for k in [j+1..j+i] do
                m[k]:=k;
            od;
            m[j+2]:=j+3;
            m[j+3]:=j+2;
            Add(morphismlist,m);
        fi;
        
        if i>=4 then
            m:=[];
            m[j+1]:=j+1;
            m[j+i]:=j+2;
            for k in [j+2..j+i-1] do
                m[k]:=k+1;
            od;
            Add(morphismlist,m);
        fi;
        j:=j+i;
    od;
    
    return ConcreteCategory(morphismlist, objectlist);
end;

##############################################################################
##
## DirectSumRep(cat, rep1, rep2) returns the representation that is the direct
## sum of the representations rep1 and rep2 of the category cat.
##
## Written by Moriah Elkin July 2018.
##
##############################################################################

DirectSumRep:=function(cat,rep1,rep2)
    local i, row, col, newmat, gimages, dDim1, dDim2, cDim1, cDim2;
    if rep1.field<>rep2.field or rep1.category<>rep2.category then
        Error("Representations incompatible.");
    fi;
    gimages:=[];
    for i in [1..Length(cat.generators)] do
        dDim1:=rep1.dimension[cat.domain[i]];
        dDim2:=rep2.dimension[cat.domain[i]];
        cDim1:=rep1.dimension[cat.codomain[i]];
        cDim2:=rep2.dimension[cat.codomain[i]];
        newmat:=EmptyMat(dDim1+dDim2,cDim1+cDim2);
        if newmat<>[] and newmat[1]<>[] then
            for row in [1..Length(newmat)] do
                for col in [1..Length(newmat[1])] do
                    if row in [1..dDim1] and col in [1..cDim1] then
                        newmat[row][col]:=rep1.genimages[i][row][col];
                    elif row in [dDim1+1..dDim1+dDim2] and col in [cDim1+1..cDim1+cDim2] then
                        newmat[row][col]:=rep2.genimages[i][row-dDim1][col-cDim1];
                    else
                        newmat[row][col]:=Zero(rep1.field);
                    fi;
                od;
            od;
        fi;
        Add(gimages,newmat);
    od;
    return rec(category:=cat,genimages:=gimages,field:=rep1.field,dimension:=rep1.dimension+rep2.dimension);
end;

##############################################################################
##
## GeneratorDomains(cat) returns a l x l matrix, where l is the number of objects
## in the category cat, and where the i,j entry is a list of the indices of morphisms
## from object i to object j.
##
## Written by Moriah Elkin August 2018.
##
##############################################################################

GeneratorDomains:=function(cat)
    local M, i;
    if IsBound(cat.generatordomains) then
        return cat.generatordomains;
    fi;
    M:=EmptyMat(Length(cat.objects),Length(cat.objects));
    for i in [1..Length(cat.generators)] do
        Add(M[cat.domain[i]][cat.codomain[i]],i);
    od;
    cat.generatordomains:=M;
    return M;
end;

##############################################################################
##
## MorphismsRep(rep) returns a l x l matrix, where l is the number of objects
## in the category of rep, and where the i,j entry is a list of the matrices of
## morphisms from object i to object j.
##
## Written by Moriah Elkin (August 2018), based on code for categories written
## by Peter Webb.
##
##############################################################################

MorphismsRep:=function(rep)
    local cat, n, genmat, g, mormat, oldlength, newlength, i, j, k, h, templist;
    cat:=rep.category;
    if IsBound(rep.morphimgs) then return(rep.morphimgs);
    fi;
    if not IsBound(cat.objects) then Objects(cat);
    fi;
    n:=Length(cat.objects);
    genmat:=EmptyMat(n,n);
    mormat:=EmptyMat(n,n);
    for g in [1..Length(rep.genimages)] do
        Add(genmat[Origin(cat,cat.generators[g])][Terminus(cat,cat.generators[g])],rep.genimages[g]);
    od;
    for i in [1..n] do
        Add(mormat[i][i],SafeIdentityMat(rep.dimension[i],rep.field));
    od;
    oldlength:=0;
    newlength:=Sum(List(mormat,x->Sum(List(x,Length))));
    while oldlength < newlength do
        oldlength:=newlength;
        for i in [1..n] do
            for j in [1..n] do
                templist:=[];
                for k in [1..n] do
                    for g in genmat[k][j] do
                        for h in mormat[i][k] do
                            if h<>[] and g<>[] then
                                Add(templist, h*g);
                            fi;
                        od;
                    od;
                 od;
                 Append(mormat[i][j],templist);
                 mormat[i][j]:=SSortedList(mormat[i][j]);
            od;
        od;
        newlength:=Sum(List(mormat,x->Sum(List(x,Length))));
    od;
    rep.morphimgs:=mormat;
    return(mormat);
end;

##############################################################################
##
## SubConstant(rep) returns a list of bases for the largest subconstant
## representation of rep. The algorithm finds the common kernel of all differences
## of morphisms from a domain to all codomains.
##
## Written by Moriah Elkin August 2018.
##
##############################################################################

SubConstant:=function(rep)
    local morphisms, vecListList, obj1, obj2, m, m1, m2, perpMat, perpSum, vec;
    morphisms:=MorphismsRep(rep);
    vecListList:=[];
    if Length(morphisms)>0 then
        for obj1 in [1..Length(morphisms)] do
            perpSum:=[];

            for obj2 in [1..Length(morphisms)] do
                perpMat:=[];

                if obj1<>obj2 and Length(morphisms[obj1][obj2])>1 then
                    for m1 in morphisms[obj1][obj2] do
                        for m2 in morphisms[obj1][obj2] do
                            if m1<>m2 then
                                for vec in TransposedMat(m1-m2) do
                                    Add(perpMat,vec);
                                od;
                            fi;
                        od;
                    od;
                    Append(perpSum, SafeBaseMat(perpMat));

                elif obj1=obj2 then
                    for m in morphisms[obj1][obj1] do
                        if rep.dimension[obj1]<>0 then
                            for vec in TransposedMat(m-SafeIdentityMat(rep.dimension[obj1],rep.field)) do
                                Add(perpMat,vec);
                            od;
                        fi;
                    od;
                    Append(perpSum, SafeBaseMat(perpMat));
                fi;
            od;
            
            if perpSum<>[] then
            vecListList[obj1]:=SafeNullspaceMat(TransposedMat(perpSum),rep.field);
            else vecListList[obj1]:=SafeIdentityMat(rep.dimension[obj1],rep.field);
            fi;
        od;
    fi;

    return(vecListList);
end;
