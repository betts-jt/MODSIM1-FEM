function [value] = Evaluate(Problem,x)
%EVALUATE Given a Problem, returns the interpolated value at x
%   (Problem, x)
%   Problem - A generated Problem WITH solution/result.
%   x - The value at which the solved Problem should be evaluted.
%
%   Outputs
%   value - The linearly interpolated value at x.

%Work out position of x in nvec
flooredValue=x-Problem.mesh.xmin; % Convert value to a position from x=0;

% Find which element the value is in.
containedElem=1+fix(flooredValue/Problem.mesh.dx); 

% Set node indicies from either side of the element and fetch value at node.
c0NodeID=containedElem;
c1NodeID=c0NodeID+1;
c0NodeValue=Problem.Result(c0NodeID);
c1NodeValue=Problem.Result(c1NodeID);

% Calculate the position of x within the element as standard parameter xi.
internalposition=(2*(rem(flooredValue,Problem.mesh.dx)/Problem.mesh.dx))-1;

%Using linear basis function so c=c0basis0+c1basis1
basis0=@(z) (1-z)/2;
basis1=@(z) (1+z)/2;

% Calculate the value at x.
value=(c0NodeValue*basis0(internalposition))+...
    (c1NodeValue*basis1(internalposition));

end

