%Part A

syms x;
y = legendreP(10, x);
z = coeffs(y, 'All');
d = roots(z);

%% Part B

q = [];
for i = 1:10
    zh = [];
    po = d(i);
    g = d(d ~= po);
    for h = 1:9
        a = po - g(h);
        zh = [zh; a];
    end
    denom = prod(zh);
    q = [q; denom];
end
%q is the list of all the weights' denominator values.
b = [];
for i = 1:10
  b = [b; x - d(i)];
end
c = [];
for i = 1:10;
    c = [c; prod(b)/b(i)];
end
%c is every numerator for the weights.
qinv = 1./q;

alpha = [];
for i = 1:10
    alpha = [alpha; qinv(i)*c(i)];
end
%alpha is the integrand for each weight, e.g. alpha(1) is the integrand for
%weight #1, and so on.

final = [];
for i = 1:10
    final = [final; int(alpha(i), -1, 1)];
end

%final is the final set of weights

%%
syms x;
y = legendreP(20, x);
z = coeffs(y, 'All');
d = roots(z);

%% PART C

q = [];
for i = 1:20
    zh = [];
    po = d(i);
    g = d(d ~= po);
    for h = 1:19
        a = po - g(h);
        zh = [zh; a];
    end
    denom = prod(zh);
    q = [q; denom];
end
%q is the list of all the weights' denominator values.
b = [];
for i = 1:20
  b = [b; x - d(i)];
end
c = [];
for i = 1:20;
    c = [c; prod(b)/b(i)];
end
%c is every numerator for the weights.
qinv = 1./q;

alpha = [];
for i = 1:20
    alpha = [alpha; qinv(i)*c(i)];
end
%alpha is the integrand for each weight, e.g. alpha(1) is the integrand for
%weight #1, and so on.

final = [];
for i = 1:20
    final = [final; int(alpha(i), -1, 1)];
end

%final is the final set of weights
