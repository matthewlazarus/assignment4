% Matthew Lazarus 100962142

%% Assignment 4

%% Part 4
% In order to deal with the non-linear element in the circuit, a new column
% matrix ('f(x)') is introduced into the equation (Gx +f(x) = b -- DC
% Case). Then, in order to solve the
% system, the jacobian of the matrix would need to be calculated.
% The jacobian is added to the derivative of the new column matrix (for the
% imaginary values). The sum is then divided by the sum of G*x+f(x)-b,
% giving the change in the result (delta X)
% Then, the 
% Newton Raphson method is applied until the change in resulting values is 
% sufficiently small. The time can be advanced and the
% jacobian+newton raphson method can be applied again.
