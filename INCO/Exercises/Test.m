function [minPol, roots] = Test(V, root)

base = length(V(:,1))-1;

col = root;

%Find values of root

for i=1:length(V(1,:))
    %(alpha^root)^(2^l)
    value = root*(2^i);
    
    %modulo of vector messages gives the rest value
	tmp = mod(value, base);
	
    %Is this in the collection, col?
	flag = 0;
    for j = 1:length(col(1,:))
       if (col(1,j) == tmp) && (flag == 0)
           flag = 1;
       end
    end
    
    %If not, add it
    if flag == 0
        col(1,length(col(1,:))+1) = tmp;
	end
end

syms x a;

for i = 1:length(col(1,:))
    val(i,1) = x+a^col(1,i);
end

produ = prod(val) %Product of all values
redu = subs(produ, a, 1) %Replaces 'a' with '1'
exp = expand(redu) %Expand all values

% minPol = mod(redu,2); %Find result of 
minPol = mod2partly(exp); %Find result of 

roots = 0;
end