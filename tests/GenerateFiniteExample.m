function [T1, T2, U1, V1, W1, Z1, sn1, sp1, U2, V2, W2, Z2, sn2, sp2] = GenerateFiniteExample(n, k1, k2, m1, m2)
%GENERATEFINITEEXAMPLE Generate two random finite CQT matrices of the same dimensions.
%
% [T1, U1, V1, sn1, sp1, T2, U2, V2, sn2, sp2] = GENERATEEXAMPLE(n, k1, k2)
%     generates two CQT matrices T1 and T2 that can be used as test
%     examples.
%
% Author: Leonardo Robol <leonardo.robol@cs.kuleuven.be>

if ~exist('m1', 'var')
    m1 = 100;
end

if ~exist('m2', 'var')
    m2 = 80;
end

if k1>0 || k2 >0
    [U1,~] = qr(randn(n, k1) + 1i * randn(n, k1), 0); [V1,~] = qr(randn(n, k1), 0);
    [U2,~] = qr(randn(n, k2) + 1i * randn(n, k2), 0); [V2,~] = qr(randn(n, k2), 0);
    [W1,~] = qr(randn(n, k1) + 1i * randn(n, k1), 0); [Z1,~] = qr(randn(n, k1), 0);
    [W2,~] = qr(randn(n, k2) + 1i * randn(n, k2), 0); [Z2,~] = qr(randn(n, k2), 0);
else
    U1 = 0; V1 = 0; W1 = 0; Z1 = 0; U2 = 0; V2 = 0; W2 = 0; Z2 = 0;
end

sn1 = [ 15 rand(1, 5) ];
sp1 = [ sn1(1) , rand(1, 4) ];
sn2 = rand(1, 4);
sp2 = [ sn2(1), rand(1, 7) ];

T1 = cqt(sn1, sp1, U1, V1, W1, Z1, m1, m2);
T2 = cqt(sn2, sp2, U2, V2, W2, Z2, m1, m2);

end

