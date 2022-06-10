m=input('m=?\n');
p=1:m;
p(1)=0;
for i=2:sqrt(m)
    for j=2*i:i:m  %对于不包含自身的所有范围内的倍数排除掉
        p(j)=0;
    end
end
n=find(p~=0);
p(n)