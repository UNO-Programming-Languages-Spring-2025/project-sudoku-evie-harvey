% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

#const n = 4.

% Our final solution _has_ to have the initial values, so fill those in
sudoku(X,Y,N) :- initial(X,Y,N).

% Each cell has precisely one value
{ sudoku(X,Y,1..n) } == 1 :- X = 1..n, Y = 1..n.
% Restrict solution space such that no rows have duplicates => each n appears exactly once
% (if different cells (distinct Y's) have the same value N => the solution is invalid)
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.
% Same thing for columns
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Show grid
#show sudoku/3.
