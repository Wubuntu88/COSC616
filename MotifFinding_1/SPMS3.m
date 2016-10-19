function [cstr, minDistance, pos] = SPMS3(DNA, l_mer, iftrace)
disp('Algorithm 3: Simple Median Search');
%t is the number of rows; n is the number of columns
[t n] = size(DNA);
s = ones(1, l_mer); % # of items in s is equal to t
bestDistance = intmax;
bestWord = num2actg(s);
bestPosition = ones(1, l_mer);
i = 1;
while i > 0
    if i < l_mer
        [s, i] = nextVertex(s, i, length(s), 4);
    else
        word = num2actg(s);
        dist = totalDistance(word, DNA);
        if dist < bestDistance
            bestDistance = dist;
            bestWord = word;
            bestPosition = s;
            sol = '';
            for i=1:length(s)
                sol = strcat(sol, sprintf(' %d', s(i)));
            end
            disp(sprintf('\tUpdate: best dist = %2d at (%s)', bestDistance, sol));
        end
        [s, i] = nextVertex(s, i, length(s), 4);
    end
end
cstr = bestWord;
minDistance = bestDistance;
pos = bestPosition;
fprintf('--final best word: %s\n', bestWord);
fprintf('--final best distance: %2d\n', minDistance);
positions = '';
for i=1:length(s)
    positions = strcat(positions, sprintf(' %d', bestPosition(i)));
end
fprintf('--final best positions: ( %s )\n', positions);
end