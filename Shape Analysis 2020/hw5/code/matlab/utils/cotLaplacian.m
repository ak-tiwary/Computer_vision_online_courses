% Compute the cotangent weight Laplacian.
% W is the symmetric cot Laplacian, and A are the area weights 
function [W A] = cotLaplacian(X, T)

nv = size(X,1);
nf = size(T,1);

% Find orig edge lengths and angles
L1 = normv(X(T(:,2),:)-X(T(:,3),:));
L2 = normv(X(T(:,1),:)-X(T(:,3),:));
L3 = normv(X(T(:,1),:)-X(T(:,2),:));
EL = [L1,L2,L3];
A1 = (L2.^2 + L3.^2 - L1.^2) ./ (2.*L2.*L3);
A2 = (L1.^2 + L3.^2 - L2.^2) ./ (2.*L1.*L3);
A3 = (L1.^2 + L2.^2 - L3.^2) ./ (2.*L1.*L2);
A = [A1,A2,A3];
A = acos(A);

% The Cot Laplacian 
I = [T(:,1);T(:,2);T(:,3)];
J = [T(:,2);T(:,3);T(:,1)];
S = 0.5*cot([A(:,3);A(:,1);A(:,2)]);
In = [I;J;I;J];
Jn = [J;I;I;J];
Sn = [-S;-S;S;S];
W = sparse(In,Jn,Sn,nv,nv);

% Triangle areas
N = cross(X(T(:,1),:)-X(T(:,2),:), X(T(:,1),:)-X(T(:,3),:));
Ar = .5*normv(N);

% Vertex areas = sum triangles nearby
I = [T(:,1);T(:,2);T(:,3)];
J = ones(size(I));
S = [Ar;Ar;Ar]/3;
A = sparse(I,J,S,nv,1);

function nn = normv(V)
nn = sqrt(sum(V.^2,2));

