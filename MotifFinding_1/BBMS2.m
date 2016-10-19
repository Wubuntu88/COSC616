function [cstr, sc, pos] = BBMS2(DNA, l_mer, iftrace)
disp('Algorithm 2: Branch and Bound Motif Search');
%t is the number of rows; n is the number of columns
[t, n] = size(DNA);
s = ones(1, t); % # of items in s is equal to t
limit = n - l_mer + 1;
[bestScore, bestMotif] = my_score(s, DNA, l_mer);
bestPositions = ones(1, l_mer);
i = 1;
while i > 0
    if i < t
        %ERROR HERE WHEN L_MER IS 3 INDEX OUT OF BOUNDS FOR MY_SCORE FUNC
        %when i is lmer
        optimisticScore = my_score(s, DNA, i) + (t-i) * l_mer;
        if optimisticScore < bestScore
            [s, i] = byPass(s, i, t, limit);
            if iftrace == true
                nodesString = zzPrintNodes(s, i);
                disp(sprintf('\tBypass Candidate: %s', nodesString));
            end
        else
            [s, i] = nextVertex(s, i, length(s), limit);
        end
        %{
        if iftrace == true
            progress = '';
            for i=1:length(s)
                progress = strcat(progress, sprintf(' %3d', s(i)));
            end
            disp(sprintf('\tcurrently at: (%s), best so far = %3d', progress, bestScore));
        end
            %}
    else
        if iftrace == true
                nodesString = zzPrintNodes(s, i);
                disp(sprintf('\t--pass Candidate: %s', nodesString)); 
        end
        [theScore, consensusString] = my_score(s, DNA, l_mer);
        if theScore > bestScore
            bestScore = theScore;
            bestMotif = consensusString;
            bestPositions = s;
            sol = '';
            for i=1:length(s)
                sol = strcat(sol, sprintf(' %d', s(i)));
            end
            disp(sprintf('\tUpdate: best score = %3d at (%s)', bestScore, sol));
            
        end
        [s, i] = nextVertex(s, i, length(s), limit);
    end
end
cstr = bestMotif;
sc = bestScore;
pos = bestPositions;
fprintf('--final best motif: %s\n', bestMotif);
fprintf('--final best score: %2d\n', bestScore);
positions = '';
for i=1:length(s)
    positions = strcat(positions, sprintf(' %d', bestPosition(i)));
end
fprintf('--final best positions: ( %s )\n', positions);
end