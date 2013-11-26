function [ph] = fourth_part(N_SW)

b=[0.6 0.4 0.2 0.1 0.05];
p=zeros(length(b),N_SW);

k=0:0.01:pi;
j=k.*180/pi;
itermax=10;
figure();
semilogy(j,scattering(b(1),itermax),'-',j,scattering(b(2),itermax),'-',j,scattering(b(3),itermax)...
    ,'-',j,scattering(b(4),itermax),'-',j,scattering(b(5),itermax),'-');
h = legend('0.6','0.4','0.2','0.1','0.05',5,'Location','BestOutside');
set(h,'Interpreter','none');
title(sprintf('theoretical scattering range for different values \n normalized scatterer radius'));
xlim([0 180]);ylim([0 20]);xlabel('moires 0..180');ylabel('SW');grid;

for i=1:length(b)
    
    p(i,:)=farfield(b(i),N_SW); 
    
end;

g=0:360/length(p):360-360/length(p);
color=['-b' '-g' '-r' '-c' '-m'];
figure();
k=1;

for i=1:length(b)
    ph(i,:)=fliplr(p(i,1:ceil(size(p,2)/2)));
    semilogy(g(1:ceil(length(g)/2)),2*pi*100*(ph(i,:).^2),[color(k) color(k+1)]);
    hold on;
    h = legend('0.6','0.4','0.2','0.1','0.05',5,'Location','BestOutside');
    set(h,'Interpreter','none');
    title(sprintf('calculated scattering range for different values \n normalized scatterer radius'));
    xlim([0 180]);ylim([0 20]);xlabel('moires 0..180');ylabel('SW');grid;
    k=k+2;
end;
hold off;

end

