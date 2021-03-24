n = 7; -- parametro de entrada

loadPackage "NautyGraphs"
R = QQ[x_1..x_n]; -- ZZ para coeficientes en Enteros; QQ para coeficientes en racionales

-- Codigo
L = generateGraphs(n, OnlyConnected => true);
fout = openOut toString(horizontalJoin("./",toString(n),".txt"));

for s in L do (

    G = stringToGraph s;
    
    M = diagonalMatrix gens R - G.adjacencyMatrix;

    for i from 1 to n do(
	-- Conviene solo calcular los menores sin calcular la base de G, quizas ya este el 1 por ahí
	    I = minors(i,M);
	
        k = 0;
        for j from 0 to length(I_*)-1 do (
            if I_j == 1_R or I_j == -1_R then (
                k = 1;
                break
            )
        );
        if k == 0 then (
            J = gens gb I;
            if J_0_0 == 1_R or J_0_0 == -1_R then (
            ) else (
                gamma = i - 1; -- gamma
                fout << s << " " << gamma << "\n";
            );
        )
    );

    print s;
)
fout << close;