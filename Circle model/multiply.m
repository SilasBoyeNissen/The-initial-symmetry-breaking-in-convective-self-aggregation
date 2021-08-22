function M = multiply(p) % makes four replicas of each circle to ensure double-periodic boundary conditions
M = [p; p(p(:, 1) <= 0.5, :) + repmat([1 0 0 0 0], size(sum(p(:, 1) <= 0.5), 1), 1)];
M = [M; p(p(:, 1) > 0.5, :) - repmat([1 0 0 0 0], size(sum(p(:, 1) > 0.5), 1), 1)];
M = [M; p(p(:, 2) > 0.5, :) - repmat([0 1 0 0 0], size(sum(p(:, 2) > 0.5), 1), 1)];
M = [M; p(p(:, 2) <= 0.5, :) + repmat([0 1 0 0 0], size(sum(p(:, 2) <= 0.5), 1), 1)];
M = [M; p((p(:, 1) <= 0.5) + (p(:, 2) <= 0.5) == 2, :) + repmat([1 1 0 0 0], size(sum((p(:, 1) <= 0.5) + (p(:, 2) <= 0.5) == 2), 1), 1)];
M = [M; p((p(:, 1) <= 0.5) + (p(:, 2) > 0.5) == 2, :) + repmat([1 -1 0 0 0], size(sum((p(:, 1) <= 0.5) + (p(:, 2) > 0.5) == 2), 1), 1)];
M = [M; p((p(:, 1) > 0.5) + (p(:, 2) > 0.5) == 2, :) + repmat([-1 -1 0 0 0], size(sum((p(:, 1) > 0.5) + (p(:, 2) > 0.5) == 2), 1), 1)];
M = [M; p((p(:, 1) > 0.5) + (p(:, 2) <= 0.5) == 2, :) + repmat([-1 1 0 0 0], size(sum((p(:, 1) > 0.5) + (p(:, 2) <= 0.5) == 2), 1), 1)];
M = sortrows(M, 5);