clear all;close all;clc;
f=importdata('data.txt');
N_AS=f.data(:,3)';
N_CP_all=N_AS;
l=length(f.data);
Rreal=zeros(l,1);
Rhelp=zeros(l,1);

for i=1:l
    
    W(i)=f.data(i,1); E(i)=f.data(i,2);
    
end;

Rhelp=W(~isnan(W));
Rreal=E(~isnan(E));

r_prag_epif=Rreal(6);
r_boh8_epif=Rhelp(4);

N_CP=N_CP_all(1);
[testthetacp,theta,cpx,cpy,auxx,auxy,Nnew,testcpx,testcpy]=firstpart(N_CP,r_prag_epif,r_boh8_epif);

enable=1;
[X,matrix,matrixnew,diegershnew]=second_part(theta,r_prag_epif,testthetacp,cpx,cpy,auxx,auxy,N_CP,Nnew,testcpx,testcpy,enable);
enable=0;

figure,plot(cpx,cpy,'-r*',auxx,auxy,'-k*');
h=legend('CP`s','AS`s',2,'Location','Southwest');
set(h,'Interpreter','none');
title(sprintf('mapping ðñïâëÞìáôïò ìå %d âïçèçôéêÝò ðçãÝò, \n %d collocation points, áêôßíá âïçèçôéêÞò åðéöÜíåéáò %g êáé áêôßíá óêåäáóôÞ %g',N_CP,N_CP,r_boh8_epif,r_prag_epif));
xlim([-1.5*max(r_prag_epif,r_boh8_epif) 1.5*max(r_prag_epif,r_boh8_epif)]),ylim([-1.5*max(r_prag_epif,r_boh8_epif) 1.5*max(r_prag_epif,r_boh8_epif)]);
axis square;grid;

third_part(matrixnew,X,diegershnew,N_CP,Nnew,r_prag_epif,r_boh8_epif);

for i=2:length(N_CP_all)-4

    r_prag_epif=Rreal(6);
    r_boh8_epif=0.4;

    N_CP=N_CP_all(i);
    [testthetacp,theta,cpx,cpy,auxx,auxy,Nnew,testcpx,testcpy]=firstpart(N_CP,r_prag_epif,r_boh8_epif);
    [X,matrix,matrixnew,diegershnew]=second_part(theta,r_prag_epif,testthetacp,cpx,cpy,auxx,auxy,N_CP,Nnew,testcpx,testcpy,enable);
    third_part(matrixnew,X,diegershnew,N_CP,Nnew,r_prag_epif,r_boh8_epif);

end;

help=[1,2,3,4,5];

for i=1:length(help)

    r_prag_epif=Rreal(6);
    r_boh8_epif=Rreal(help(i));

    N_CP=N_CP_all(2);
    [testthetacp,theta,cpx,cpy,auxx,auxy,Nnew,testcpx,testcpy]=firstpart(N_CP,r_prag_epif,r_boh8_epif);
    [X,matrix,matrixnew,diegershnew]=second_part(theta,r_prag_epif,testthetacp,cpx,cpy,auxx,auxy,N_CP,Nnew,testcpx,testcpy,enable);
    third_part(matrixnew,X,diegershnew,N_CP,Nnew,r_prag_epif,r_boh8_epif);

end;

fourth_part(60);
