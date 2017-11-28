function setoption(keyword, value)
%SETOPTION Set an option for the CQT toolbox.

global cqt_inversion;
global cqt_sqrt;
global cqt_compression;

switch keyword
	case 'inversion'
		cqt_inversion = value;
	case 'sqrt'
		cqt_sqrt = value;
    case 'compression'
        cqt_compression = value;
	otherwise
		error('Unsupported option specified');
end

end

