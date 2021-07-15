function dy = marrowwithdelay(t,y,n,U,R,R1,s,h,w)

Q = -U*R*y(1)-U*R*y(1);

A=zeros(n,1);
for i=1:1:n
    A(i)=2*U*R*y(i)-U*R*y(i+1)-U*R*y(i+1);
end

X=sum(y(1:1+n));

L = (U*R*R1*X)-(s*y(2+n));

B=zeros(h,1);
for i=1:1:h
    B(i)=s*y(1+n+i)-s*y(2+n+i);
end

C = s*(1/(R*R1))*y(2+n+h)- U*y(3+n+h);

V = w*y(3+n+h) - w*y(4+n+h);

dy=[Q;A;L;B;C;V];

end