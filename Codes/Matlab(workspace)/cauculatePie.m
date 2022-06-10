% 基于蒙特卡洛算法
s=0;
n=input('n?\n');
for i=1:n
    x=rand(1);
    y=rand(1);
    if x*x+y*y<=1
        s=s+1;
    end
end
pai=s/n*4