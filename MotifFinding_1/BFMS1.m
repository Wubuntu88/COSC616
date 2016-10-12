function [cstr sc pos] = BMFT1(DNA, l_mer, iftrace)
disp('Algorithm 1: Simple Brute Force Motif Search');
%t is the number of rows; n is the number of columns
[t n] = size(DNA);
nElems = 4; % ACTG are the 4 items in DNA
s = ones(1, t); % # of items in s is equal to t
bestScore = my_score(s, DNA, l_mer);

while true
    
    s = nextLeaf(s, length(s), nElems);
    newScore = my_score(s, DNA, l_mer);
    
    if iftrace == 1
        if s(t-1) == 1 && s(t) == 1 % prints out the final answer when the nextLeaf
            % method loops back to 111...; this may take a month or so, lol
            sol = '';
            for i=1:length(s)
                sol = strcat(sol, sprintf(' %d', s(i)));
            end
            disp(sprintf('\tUpdate: bestScore = %3d at (%s)', bestScore, sol));
        end
    end
    
    break
end
end








