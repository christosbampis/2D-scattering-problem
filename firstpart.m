function [testthetacp,theta,cpx,cpy,auxx,auxy,Nnew,testcpx,testcpy]=firstpart(N,r1,r2)

theta=0:2*pi/N:2*pi-2*pi/N;

auxx=r2*cos(theta);
auxy=r2*sin(theta);
Nnew=10*N;
testthetacp=0:2*pi/Nnew:2*pi-2*pi/Nnew;

cpx=r1*cos(theta);
cpy=r1*sin(theta);
testcpx=r1*cos(testthetacp);
testcpy=r1*sin(testthetacp);

figure,hold on;
plot([cpx(end) cpx(1)],[cpy(end) cpy(1)],'-r*');
plot([auxx(end) auxx(1)],[auxy(end) auxy(1)],'-k*');
plot(cpx,cpy,'-r*',auxx,auxy,'-k*');
h=legend('CP`s','AS`s',2,'Location','Southwest');
set(h,'Interpreter','none');
title(sprintf('mapping of the problem with %d secondary sources, \n %d collocation points, radius of secondary surface %g and radius of scatterer %g',N,N,r2,r1));
xlim([-1.5*max(r1,r2) 1.5*max(r1,r2)]),ylim([-1.5*max(r1,r2) 1.5*max(r1,r2)]);
axis square;grid;
hold off;

end

