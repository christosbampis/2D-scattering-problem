function [X,matrix,matrixnew,diegershnew] = second_part(theta,r1,testthetacp,cpx,cpy,auxx,auxy,N,Nnew,testcpx,testcpy,enable)

orisma=zeros(N,N);
orismanew=zeros(N,N);
diegersh=zeros(1,N);
diegershnew=zeros(1,Nnew);

ko=2*pi/1;
for k=1:N
    diegersh(k)=exp(-1i*ko*cos(theta(k))*r1);
end;

A=1;diegersh=A*diegersh';
for k=1:Nnew
    diegershnew(k)=exp(-1i*ko*cos(testthetacp(k))*r1);
end;

A=1;diegershnew=A*diegershnew';
ho=377;sta8eres=-ko*ho/4;

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
if enable==1
m=max(abs(X));

figure(),grid;
view(-75,24);
hold on ;
plot3(0, 0, 0,'o',...
                'LineWidth',1.5,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[0 1 0],...
                'MarkerSize',8);
plot3([0 0],[0 0], [-3*m +3*m],'r');
for k=1:length(auxx)

title('3d-sketch x-y-z ');xlabel('x');ylabel('y');zlabel('Source amplitude - weights');grid;
if k<length(auxx)
    
    plot3([auxx(k) auxx(k+1)],[auxy(k) auxy(k+1)], [0 0]);
    
else
    
    plot3([auxx(k) auxx(1)],[auxy(k) auxy(1)], [0 0]);
    
end;

plot3([auxx(k) 0],[auxy(k) 0], [0 0],...
                'LineWidth',1.5,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[0 1 0],...
                'MarkerSize',8);
plot3([auxx(k) auxx(k)],[auxy(k) auxy(k)], [0 abs(X(k))],'--k',...
                'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[0 1 0],...
                'MarkerSize',8);
plot3(auxx(k), auxy(k), 0,'o',...
                'LineWidth',1.5,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[0 0 1],...
                'MarkerSize',6);
plot3(auxx(k), auxy(k), abs(X(k)),'o',...
                'LineWidth',1.5,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[0 0 1],...
                'MarkerSize',6);
plot3([auxx(k) auxx(k)],[auxy(k) auxy(k)], [-3*m +3*m],'--k',...
                'LineWidth',0.1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[0 1 0],...
                'MarkerSize',1);
text(auxx(k), auxy(k)-0.003, 0-0.003, sprintf('AS %d',k));

end;

end

end

