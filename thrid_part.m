function [] = third_part(matrixnew,X,diegershnew,N_CP,Nnew,r_sked,r_boh8_epif)

sfalma=abs(matrixnew*X+diegershnew);
figure,plot(0:360/length(sfalma):360-360/length(sfalma),sfalma);
title(sprintf('Error for %d AS`s and full total of CP`s %g,\n scatterer radius %g and radius of secondary surface %g',N_CP,Nnew,r_sked,r_boh8_epif))
grid,xlabel('0...360\circ'),xlim([0 360]);

end
