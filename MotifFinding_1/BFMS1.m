function [bestMotif, bestScore, pos] = BFMS1(DNA, l_mer, iftrace)
disp('Algorithm 1: Simple Brute Force Motif Search');
%t is the number of rows; n is the number of columns
[t n] = size(DNA);
s = ones(1, t); % # of items in s is equal to t
[bestScore, bestMotif] = my_score(s, DNA, l_mer);

L = length(s);
limit = 68-l_mer+1;

while true
    
    s = nextLeaf(s, L, limit);
    [newScore, consensusString] = my_score(s, DNA, l_mer);
    
    if iftrace == true
        if s(t-1) == 1 && s(t) == 1 % prints out the final answer when the nextLeaf
            % method loops back to 111...; this may take a month or so, lol
            sol = '';
            for i=1:length(s)
                sol = strcat(sol, sprintf(' %d', s(i)));
            end
            disp(sprintf('\tUpdate: bestScore = %3d, at (%s)', bestScore, sol));
        end
    end
    
    if newScore > bestScore
        bestScore = newScore;
        bestMotif = consensusString;
        pos = s;
        sol = '';
        for i=1:length(s)
            sol = strcat(sol, sprintf(' %d', s(i)));
        end
        disp(sprintf('\tUpdate: best score = %3d at (%s)', bestScore, sol));
        disp(sprintf('\tUpdate: best Motif so far = (%s)', bestMotif));
    end
end
end
