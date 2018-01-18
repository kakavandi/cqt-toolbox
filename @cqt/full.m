function A = full(T)
%FULL Return the dense representation of the finite CQT-matrix T
%
% A = full(T) returns a dense matrix A representing T. Notice this only
% makes sense for finite CQT matrices. 

if max(T.sz) == inf
	error('Invalid infinite dimensions for the function full')
end

if min(T.sz) == 0
	A = zeros(T.sz(1), T.sz(2));
	return;
end

A = toep(T.n, T.p, T.sz(1), T.sz(2));
A(1:size(T.U,1),1:size(T.V,1)) = A(1:size(T.U,1),1:size(T.V,1)) + T.U*T.V.';
temp = T.W*T.Z.';
A(end-size(T.W,1)+1:end, end-size(T.Z,1)+1:end) = A(end-size(T.W,1)+1:end,...
	end-size(T.Z,1)+1:end) + temp(end:-1:1,end:-1:1);
