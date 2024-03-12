
from sympy import *
init_printing()
from IPython.display import *

var('a:z')

def Sympower2(A,N):

    V=Matrix(2,1,[u,v])
    B=A*V
    mm=Poly((u+v)**N).monoms()
    dd=len(mm)
    X=[]

    for i in range(dd):
        F=x**mm[i][0]*y**mm[i][1]
        GG=F.subs(x,B[0]).subs(y,B[1]);FF=expand(GG)
        X.append([FF.coeff(u**mm[i][0]*v**mm[i][1]) for i in range(dd)])
 
    MX=Matrix(1,dd,X[0])
    for i in range(1,dd):
        XM=Matrix(1,dd,X[i])
        MX=MX.col_join(XM)    

    return MX

def Sympower3(A,N):

    V=Matrix(3,1,[u,v,w])
    B=A*V
    mm=Poly((u+v+w)**N).monoms()
    dd=len(mm)
    X=[]

    for i in range(dd):
        F=x**mm[i][0]*y**mm[i][1]*z**mm[i][2]
        GG=F.subs(x,B[0]).subs(y,B[1]).subs(z,B[2]);FF=expand(GG)
        X.append([FF.coeff(u**mm[i][0]*v**mm[i][1]*w**mm[i][2]) for i in range(dd)])
 
    MX=Matrix(1,dd,X[0])
    for i in range(1,dd):
        XM=Matrix(1,dd,X[i])
        MX=MX.col_join(XM)    

    return MX

def SymmTraces(A,order):

    IX=eye(A.shape[0])
    delta=series(((IX-t*A).det())**(-1),t,0,order)
    for i in range(order):
        display(delta.coeff(t,i))
        
def PowerTraces(A,order):       
    IX=eye(A.shape[0])
    delta=series(trace((IX-t*A).inv()),t,0,order)
    for i in range(order):
       display(delta.coeff(t,i))

print("This provides macros for symmetric tensor powers.\n")
print("Sympower2(A,N): 2x2 matrix A and degree N")
print("Sympower3(A,N): 3x3 matrix A and degree N")
print("PowerTraces(A,n): matrix A and order of the series")
print("SymmTraces(A,n): matrix A and order of the series")
