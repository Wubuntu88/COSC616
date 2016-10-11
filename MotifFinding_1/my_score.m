function [the_score, cs] = my_score(s, DNA, l_mer)
prof = profile(s, DNA, l_mer);
[the_score, cs] = score_p(prof);
end