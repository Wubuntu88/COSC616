function [cstr sc pos] = BFMS2(DNA, l_mer, iftrace)
disp('Algorithm 2: Branch and Bound Motif Search');
%t is the number of rows; n is the number of columns
[t n] = size(DNA);
s = ones(1, t); % # of items in s is equal to t
limit = n - l_mer + 1;
[bestScore, bestMotif] = my_score(s, DNA, l_mer);
i = 1;
while i > 0
    if i < t
        optimisticScore = my_score(s, DNA, i) + (t-i) * l_mer;
        if optimisticScore < bestScore
            [s, i] = byPass(s, i, t, limit);
        else
            [s, i] = nextVertex(s, i, length(s), limit);
        end
        
        progress = '';
        for i=1:length(s)
            progress = strcat(progress, sprintf(' %3d', s(i)));
        end
        disp(sprintf('\tcurrently at: (%s), best so far = %3d', progress, bestScore));
        
    else
        [theScore, consensusString] = my_score(s, DNA, l_mer);
        if theScore > bestScore
            bestScore = theScore;
            bestMotif = consensusString;
            sol = '';
            for i=1:length(s)
                sol = strcat(sol, sprintf(' %d', s(i)));
            end
            disp(sprintf('\tUpdate: best score = %3d at (%s)', bestScore, sol));
        end
        %disp(sprintf('\tUpdate: best Motif = (%s)', bestMotif));
        
        [s, i] = nextVertex(s, i, length(s), limit);
    end
end
cstr = bestMotif;
sc = bestScore;
end