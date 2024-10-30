#Zadatak 1: Izracunati vrijednost izraza
3+466/23+31.54+2^6
sin(π/7)*ℯ^0.3*(2+0.9im)
sqrt(2)*log(10)
(5+3im)/(1.2+4.5im)

#Zadatak 2: Dodijeliti varijablama vrijednosti pa Izracunati
a=(atan(5)+ℯ^5.6)/3
b=(sin(pi/3))^(1/15)
c=(log(15)+1)/23
d=sin(pi/2)+cos(pi)

(a+b)*c
acos(b)*asin(c/11)
((a-b)^4)/d
c^(1/a)+((b*im)/(3+2im))

#Zadatak 3 
using LinearAlgebra

A=[1 -4*im sqrt(2); log(Complex(-1)) sin(pi/2) cos(pi/3); asin(0.5) acos(0.8) ℯ^0.8]

transpose(A)
A+transpose(A)
A*transpose(A)
transpose(A)*A
det(A)
inv(A)

#Zadatak 4
zeros(8,9)
ones(7,5)
#jedinicna matrica
I(5)
I(5)+zeros(5,5)
randn(4,9)

#Zadatak 5
#Izracunaj zbir elemenata po svim redovima,kolonama,dijagonalama,max i min element
a=[2 7 6;9 5 1;4 3 8]

sum(a,dims=1) 
sum(a,dims=2) 
tr(a) 
tr(rotl90(a)) 
minimum(a, dims=1) 
maximum(a, dims=2) 
minimum(diag(a))
maximum(diag(rotl90(a))) 
minimum(diag(rotl90(a))) 
maximum(diag(a)) 
maximum(a, dims=1) 
minimum(a, dims=2)

# dims=1 po kolonama    dims=2 po redovima
# tr - suma elemenata na glavnoj dijagonali

#Zadatak 6
a=[1 2 3; 4 5 6; 7 8 9]
b=[1 1 1; 2 2 2; 3 3 3]

#Izracunaj matricu c tako da:
#1) svaki element matrice c bude jednak sinusu odgovarajuceg elementa matrice a
c=sin.(a)
#2) svaki element matrice c = sinusu a pomnozenog sa kosinusom matrice b..
c=sin.(a).*cos.(b)             # . znaci da ce se primijeniti na svaki element
#3) matrica c jednaka trecem korijenu matrice A
c=a^(1/3) 
#4) svaki element matrice c bude jednak trecem korijhenu odg. elementa matrice a
c=a.^(1/3) 

#Zadatak 7
#Formirati vektore
#a) vektor red koji ima 100 elemenata:0,1,2,...99
0:99
#b) vektor red koji ima 100 elemenata: 0,0.01,0.02,...,0.99
[0:0.01:0.99;]' 
#c) vektor kolonu koja ima 20 elemenata i to 39,37,35,...,5,3,1
[39:-2:1;]

#Zadatak 8
a=[7*ones(4,4) zeros(4,4); 3*ones(4,8)]
#a)
b=I(8)+a 
#b)
c=b[1:2:8,:] 
#c)
d=b[:,1:2:8] 
#d)
e=b[1:2:8,1:2:8] 

#Zadatak 9  - paket "Plots"
import Pkg; 
Pkg.add("Plots")
using Plots
#a)Nacrtati grafik funkcije y = sin x u intervalu [–π, π] koristeci 101 tacku

x=[-pi:pi/50:pi;];
y=sin.(x)
plot(x,y,title = "Sinus", label = "sin(x)")
xlabel!("x")
ylabel!("y")

#b) Nacrtati grafik funkcije y = cos x u intervalu [–π, π] koristeci 101 tacku
x=range(-pi,stop=pi,length=101);
y=cos.(x)
plot(x,y,title = "Kosinus", label = "cos(x)")
xlabel!("x")
ylabel!("y")

#c) Nacrtati grafik funkcije y = sin 1/x u intervalu [1, 10] koristeci 101tacku. Grafik nacrtati punom crnom linijom;
x=range(1,stop=10,length=101);
y=sin.(1 ./ x);
plot(x,y,color=:black, label = "sin(1/x)")

# Funkcije i metaprogramiranje
#Zadatak 1

function saberi_oduzmi(x=0,y=0)
    if(size(x)==size(y))
        x+y, x-y
    else return (0,0)
    end
end

#Zadatak 2

function sume(mat) 
    suma_matrice=0
    suma_redova=zeros(size(mat,1))
    suma_kolona=zeros(size(mat,2))
    suma_diagonale=0
    suma_sporedne=0
    for i = 1:size(mat,1)
        for j = 1:size(mat,2)
           suma_matrice+=mat[i,j]
           suma_redova[i]+=mat[i,j]
           suma_kolona[j]+=mat[i,j]
           if size(mat,1) == size(mat,2)
              if i==j
                  suma_diagonale+=mat[i,j]
              end
              if (i + j) == (size(mat,1)+1)
                    suma_sporedne += mat[i,j]; 
              end
           end
        end
    end
    return suma_matrice,suma_redova,suma_kolona, suma_diagonale, suma_sporedne
end

sume([1 2 3; 4 5 6; 7 8 9])
a=[2 7 6; 9 5 1; 4 3 8]; 
sume(a) 
sume(a[2,:]) 
sume(a[1:2,1:2]) 


#Zadatak 3

function crtaj(s::String)
    global x=LinRange(-5,5,100)
    x=[x;];
    y = eval(Meta.parse(s))
    plot(x,y)
end
using Plots;

function crtaj2(s::String)
    x=LinRange(-5,5,100)
    x=[x;];
    f = eval(Meta.parse("(x) -> $s"))
    y = Base.invokelatest(f,x)
    plot(x,y)
end

crtaj("x.^2")
crtaj2("x.^2")
crtaj("sin.(x)")
crtaj2("sin.(x)")

