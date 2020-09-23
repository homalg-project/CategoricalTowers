#***************************************************************************
# This is an excerpt of the file
#
# [catreps](https://www-users.math.umn.edu/~webb/GAPfiles/catreps)
#
# It includes only those functions necessary to define the function `ConcreteCategory`
#***************************************************************************

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
## ObjectsList(cat) returns the objects of the concrete category cat, as a list
## of sets. At the moment it will not work unless for every object there
## is at least one generator morphism whose support is that object.
##
##############################################################################
ObjectsList:=function(cat)
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
ObjectsList(C);
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
        ObjectsList(output);
    fi;

    Domains(output);
    return(output);
end;
