function [p] = farfield(param, N)

theta=0:2*pi/N:2*pi-2*pi/N;
r2=2*param/3;
auxx=r2*cos(theta);
auxy=r2*sin(theta);

Nnew=1*N;

orisma=zeros(N,N);
orismanew=zeros(N,N);
diegersh=zeros(1,N);

testthetacp=0:2*pi/Nnew:2*pi-2*pi/Nnew;

r1=100;
cpx=param*cos(theta);
cpy=param*sin(theta);
testcpx=r1*cos(testthetacp);
testcpy=r1*sin(testthetacp);
ko=2*pi/1;
for k=1:N
    diegersh(k)=exp(-1i*ko*cos(theta(k))*param);
end;

%8ewrhmeno platos arxikou prospiptontos A=1
A=1;diegersh=A*diegersh';

ho=377;sta8eres=ko*ho/4;

for i=1:N
    
    for j=1:N
        
    %metro dianusmatikhs diaforas ka8e collocation point gia ka8e boh8htikh phgh
    orisma(i,j)=((cpx(i)-auxx(j))^2+(cpy(i)-auxy(j))^2)^0.5;
    
    end;
    
end;

    for i=1:Nnew
        
        for j=1:N
        
            orismanew(i,j)=((testcpx(i)-auxx(j))^2+(testcpy(i)-auxy(j))^2)^0.5;
        
        end;
        
    end;


matrix=(sta8eres*besselh(0,2,ko*orisma));
matrixnew=(sta8eres*besselh(0,2,ko*orismanew));

X=linsolve(matrix,-diegersh);


p=abs(matrixnew*X);

end

