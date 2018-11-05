%%Set up path space
startSolver;

Batch=problemBatch(@part2a,[0.5 294.15 5],[1.5 322.15 5],[5 5 1]);
Batch=solveBatch(Batch);

%Set Plot Options
PlotOpts=[]; %Clear previous opts.
PlotOpts.title='Part 2a Coef Comparison Results';
PlotOpts.filepath='status/part2a_comp.png';
PlotOpts.x.label='x (m)';
PlotOpts.y.label='Temperature (K)';
extraFcn='grid;';
close all

%Plot the solution with dedicated function.
plotSolution(Batch,PlotOpts,extraFcn);

%3D plot max positions.

f3=figure('Name','Parameter Space - Part 2a - Constant x Position');
[x,y,z]= generateContorMatricies(Batch,1,2,3);
[cc,hh]=contourf(x,y,z,10,'ShowText','on');
hh.LevelList=round(hh.LevelList,0);  %rounds levels to 3rd decimal place
  clabel(cc,hh)
xlabel('Q');
ylabel('TL (K)');
zlabel('c value');
title('Variation in Temperature at Constant x Position with Q and TL');
colorbar;
saveas(f3,'status/part2a_contor.png');


%Plot how temp profile varies with TL
f4=figure('pos',[400,400,620,475],'Name','Temperature Profile - Part 2a - Varying TL');
[x,y,z]= compileResultProfiles(Batch,2,2);
contourf(x,y,z,50,'ShowText','off','LineColor','none');
hold on
[cc,hh]=contour(x,y,z,12,'ShowText','on','LineColor','k');
hh.LevelList=round(hh.LevelList,0);  %rounds levels to 3rd decimal place
  clabel(cc,hh)
xlabel('TL (K)');
ylabel('x (m)');
zlabel('c value');
title('Part 2a Temperature Profile as TL Only Varies');
colorbar;
saveas(f4,'status/part2a_profile.png');

%Plot how temp profile varies with Q
f5=figure('pos',[400,400,620,475],'Name','Temperature Profile - Part 2a - Varying Q');
[x,y,z]= compileResultProfiles(Batch,1,5);
contourf(x,y,z,50,'ShowText','off','LineColor','none');
hold on
[cc,hh]=contour(x,y,z,12,'ShowText','on','LineColor','k');
hh.LevelList=round(hh.LevelList,0);  %rounds levels to 3rd decimal place
  clabel(cc,hh)
xlabel('Q');
ylabel('x (m)');
zlabel('c value');
title('Part 2a Temperature Profile as Q Only Varies');
colorbar;
saveas(f5,'status/part2a_profile_Q.png');

