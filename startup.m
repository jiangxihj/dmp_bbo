% Author:  Freek Stulp, Robotics and Computer Vision, ENSTA-ParisTech
% Website: http://www.ensta-paristech.fr/~stulp/
% 
% Permission is granted to copy, distribute, and/or modify this program
% under the terms of the GNU General Public License, version 2 or any
% later version published by the Free Software Foundation.
% 
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
% Public License for more details
%
% If you use this code in the context of a publication, I would appreciate 
% it if you could cite it as follows:
%
% @MISC{stulp_dmp_bbo,
%   author = {Freek Stulp},
%   title  = {dmp_bbo: Matlab library for black-box optimization of dynamical movement primitives.},
%   year   = {2013},
%   url    = {https://github.com/stulp/dmp_bbo}
% }

%--------------- Startup ---------------
disp('startup dmp_bbo')
addpath(genpath('dynamicmovementprimitive'))
addpath(genpath('evolutionaryoptimization'))
addpath(genpath('fileio'))
addpath(genpath('tasks'))
if (exist('dealiasing','dir'))
  addpath(genpath('dealiasing'))
end
if (exist('proximodistalmaturation','dir'))
  addpath(genpath('proximodistalmaturation'))
end
  