function T = plus(T1, T2)
%PLUS Add two CQT matrices. 
%
%     T = PLUS(T1, T2) adds two CQT matrices and produces a new CQT matrix T. 

if isa(T1, 'cqt') && isa(T2, 'cqt')
    [ cm, cp, cu, cv ] = qt_add(T1.n, T1.p, T1.U, T1.V, ...
        T2.n, T2.p, T2.U, T2.V);
    T = cqt(cm, cp, cu, cv);
elseif ~isa(T1, 'cqt')
    error('Incompatible types addition. \nIf you wan to add a matrix of %s with a cqt matrix T you can use cqt(A) + T',class(T1));
elseif ~isa(T2, 'cqt')
    error('Incompatible types addition. \nIf you wan to add a cqt matrix T  with a matrix of %s you can use T + cqt(A)',class(T2));
end
end
