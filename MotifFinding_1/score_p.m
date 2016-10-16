function [score, consensusString] = score_p(prof_matrix)
dimensions = size(prof_matrix);
num_cols = dimensions(2);
consensus_numbers = zeros(1, num_cols);
score = 0;
for i = 1:num_cols
    col_at_i = prof_matrix(:, i);
    most_frequent_element = mode(col_at_i);
    consensus_numbers(i) = most_frequent_element;
    score = score + sum(col_at_i == most_frequent_element);
end
consensusString = num2actg(consensus_numbers);
end