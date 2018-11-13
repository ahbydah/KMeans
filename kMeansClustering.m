
load 'netflix.mat';




%x is vector of positions, k is num clusters
%output = group num, centroids, sum distances, all distances
%[g, C, sumd, d] = kmeans(X, k)

%group users into 10 groups
k = 3000;
[g, c] = kmeans(RT, k);

r = [5 3 5 2 2 4 1 4 3 5 3 1 1 2 1 3];
r2 = zeros(1:16);
for i = 1:16
    r2(i) = randi(1, 16);
% r(6) = 0;
% r(13) = 0;
% r(14) = 0;

grp = getGrp(c, r)

disp("num people in group");
RTg = length(find(g == grp))

av = getAvg(RT, g, grp)


function grp = getGrp(C, r)
[n,m] = size(C);
grp = 1;
r = 1;
d = norm(r-C(1,:));
for j = 2:n 
    d2 = norm(r-C(j, :));
    if d2 < d
        grp = j;
        d = d2;
    end
end
end


function A = getAvg(R, g, k)

[n,m] = size(R);
R0 = R(g==k, :);

A = zeros(1,m);
for j = 1:m
    s = sum(R0(:, j));
    l = length(find(R0(:, j)>0));
    if l ~= 0
        A(j) = s/l;
    end
end
end


