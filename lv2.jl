#Faris Kasapovic

#Zadatak - KAFA
using Pkg
Pkg.add("JuMP")
Pkg.add("GLPK")

model=Model(GLPK.Optimizer);
@variable(model,x1>=0);
@variable(model,x2>=0);
@objective(model,Max,3x1+5x2);
@constraint(model,c1,x1 <= 4);
@constraint(model,c2,2x2 <= 12);
@constraint(model,c3,3x1+2x2 <= 18);
print(model)


#Faris Kasapović 19418

#Zadatak sa vitaminima
using JuMP
using GLPK

model = Model(GLPK.Optimizer);
@variable(model, x1 >= 0);
@variable(model, x2 >= 0);
@objective(model, Min, 40x1 + 30x2);
@constraint(model, c1, 0.1x1 >= 0.2);
@constraint(model, c2, 0.1x2 >= 0.3);
@constraint(model, c3, 0.5x1 + 0.3x2 >= 3);
@constraint(model, c4, 0.1x1 + 0.2x2 >= 1.2);
print(model)

optimize!(model)
println("Status: ", termination_status(model))

println("Varijable x1 i x2 su:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
print("Vrijednost funkcije cilja: ")
print(objective_value(model))

#Zadatak sa detrdžentima
using JuMP
using GLPK

model = Model(GLPK.Optimizer);
@variable(model, x1 >= 0);
@variable(model, x2 >= 0);
@variable(model, x3 >= 0);
@objective(model, Max, 10x1 + 5x2 + 8x3);
@constraint(model, c1, x1 + x2 + x3 == 100);
@constraint(model, c2, 2x1 + 1.5x2 + 0.5x3 <= 110);
@constraint(model, c3, 2x1 + x2 + x3 >= 120);
print(model)

optimize!(model)
println("Status: ", termination_status(model))

println("Varijabli x1, x2 i x3 su:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("x3 = ", value(x3))
print("Vrijednost funkcije cilja: ")
print(objective_value(model))

#Zadatak 2 Fabrika ZSR
using JuMP
using GLPK

model = Model(GLPK.Optimizer);
@variable(model, x1 >= 0);
@variable(model, x2 >= 0);
@variable(model, x3 >= 0);
@objective(model, Max, 2x1 + 3x2 + x3);
@constraint(model, c1, 2x1 + 2x2 + 2x3 <= 4);
@constraint(model, c2, 3x1 + 3x2 <= 2);
@constraint(model, c3, x2 + x3 <= 3);
print(model)

optimize!(model)
println("Status: ", termination_status(model))

println("Varijabli x1, x2 i x3 su:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("x3 = ", value(x3))
print("Vrijednost funkcije cilja: ")
print(objective_value(model))

#Zadatak 3 Fabrika
using JuMP
using GLPK

model = Model(GLPK.Optimizer);
@variable(model, x1 >= 0);
@variable(model, x2 >= 0);
@objective(model, Max, 3x1 + 7x2);
@constraint(model, c1, 0.25x1 + 0.75x2 <= 20);
@constraint(model, c2, x1 <= 10);
@constraint(model, c3, x2 <= 9);
print(model)

optimize!(model)
println("Status: ", termination_status(model))

println("Varijabli x1 i x2 su:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
print("Vrijednost funkcije cilja: ")
print(objective_value(model))

#Zadatak 3 Kompanija za proizvodnju slatkiša
using JuMP
using GLPK

model = Model(GLPK.Optimizer);
@variable(model, x1 >= 0);
@variable(model, x2 >= 0);
@objective(model, Max, 2x1 + 4x2);
@constraint(model, c1, x1 <= 3);
@constraint(model, c2, x2 <= 6);
@constraint(model, c3, 3x1 + 2x2 <= 18);
print(model)

optimize!(model)
println("Status: ", termination_status(model))

println("Varijabli x1 i x2 su:")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
print("Vrijednost funkcije cilja: ")
print(objective_value(model))


#Primjer: Potrebno je obezbijediti vitaminsku terapiju.... (Predavanje 3, stranica 5)

using Pkg
Pkg.add("JuMP")
Pkg.add("GLPK")
using JuMP, GLPK
m=Model(GLPK.Optimizer)             
@variable(m,x1>=0)                  
@variable(m,x2>=0)                  
@objective(m,Max,2x1-3x2+800)           
@constraint(m,constraint1,1.5x1+x2<=60)   
@constraint(m,constraint2,x1>=20) 
@constraint(m,constraint3,x1+x2<=100)

print(m)                           
optimize!(m)                       
termination_status(m)              
println("Rješenja:")                
println("x1=", value(x1))
println("x2=", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))        
value(constraint1)                 
value(constraint2)
value(constraint3)

#Primjer: Planira se proizvodnja tri tipa detrdzenta...(Predavanje 3 stranica 5)

using Pkg
Pkg.add("JuMP")
Pkg.add("GLPK")
using JuMP, GLPK
m=Model(GLPK.Optimizer)             
@variable(m,x1>=0)                  
@variable(m,x2>=0)                  
@objective(m,Max,2x1-3x2+800)           
@constraint(m,constraint1,1.5x1+x2<=60)   
@constraint(m,constraint2,x1>=20) 
@constraint(m,constraint3,x1+x2<=100)

print(m)                           
optimize!(m)                       
termination_status(m)              
println("Rješenja:")                
println("x1=", value(x1))
println("x2=", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))        
value(constraint1)                 
value(constraint2)
value(constraint3)


#Primjer


using Pkg
Pkg.add("JuMP")
Pkg.add("GLPK")
using JuMP, GLPK
m=Model(GLPK.Optimizer)             
@variable(m,x1>=0)                  
@variable(m,x2>=0)  
@variable(m,x3>=0)               
@objective(m,Max,8x1+16x2+29x3)           
@constraint(m,constraint1,1x1+3x2+5x3<=40)   
@constraint(m,constraint2,1x1+2x2+3x3<=30) 
@constraint(m,constraint3,3x1+8x2+14x3<=100)
print(m)                            
optimize!(m)                        
termination_status(m)              
println("Rješenja:")                
println("x1=", value(x1))
println("x2=", value(x2))
println("x1=", value(x3))
println("Vrijednost cilja:")
println(objective_value(m))        
value(constraint1)                  
value(constraint2)
value(constraint3)


#Primjer: Teretni brod prebacuje dvije vrste tereta.... (Predavanje 3, stranica 6)


using Pkg
Pkg.add("JuMP")
Pkg.add("GLPK")
using JuMP, GLPK
m=Model(GLPK.Optimizer)             
@variable(m,x1>=0)                  
@variable(m,x2>=0)                  
@objective(m,Max,3x1+2x2)           
@constraint(m,constraint1,(1/2)x1+(1/4)x2<=12)   
@constraint(m,constraint2,500x1-200x2<=3000) 
print(m)                           
optimize!(m)                       
termination_status(m)              
println("Rješenja:")                
println("x1=", value(x1))
println("x2=", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))        
value(constraint1)                 
value(constraint2)


