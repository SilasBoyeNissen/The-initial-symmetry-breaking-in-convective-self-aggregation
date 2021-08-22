function M = multiply(S)
M = [S; S(S(:, 1) <= 0.5, :) + repmat([1 0 0 0 0], size(sum(S(:, 1) <= 0.5), 1), 1)];
M = [M; S(S(:, 1) > 0.5, :) - repmat([1 0 0 0 0], size(sum(S(:, 1) > 0.5), 1), 1)];
M = [M; S(S(:, 2) > 0.5, :) - repmat([0 1 0 0 0], size(sum(S(:, 2) > 0.5), 1), 1)];
M = [M; S(S(:, 2) <= 0.5, :) + repmat([0 1 0 0 0], size(sum(S(:, 2) <= 0.5), 1), 1)];
M = [M; S((S(:, 1) <= 0.5) + (S(:, 2) <= 0.5) == 2, :) + repmat([1 1 0 0 0], size(sum((S(:, 1) <= 0.5) + (S(:, 2) <= 0.5) == 2), 1), 1)];
M = [M; S((S(:, 1) <= 0.5) + (S(:, 2) > 0.5) == 2, :) + repmat([1 -1 0 0 0], size(sum((S(:, 1) <= 0.5) + (S(:, 2) > 0.5) == 2), 1), 1)];
M = [M; S((S(:, 1) > 0.5) + (S(:, 2) > 0.5) == 2, :) + repmat([-1 -1 0 0 0], size(sum((S(:, 1) > 0.5) + (S(:, 2) > 0.5) == 2), 1), 1)];
M = [M; S((S(:, 1) > 0.5) + (S(:, 2) <= 0.5) == 2, :) + repmat([-1 1 0 0 0], size(sum((S(:, 1) > 0.5) + (S(:, 2) <= 0.5) == 2), 1), 1)];
M = sortrows(M, 5);