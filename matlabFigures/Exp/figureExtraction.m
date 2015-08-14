clear
close all
clc

gapS = 40;

testCase = {'Baseline' 'St005' 'St015' 'St025'};
soundVelocity = sqrt(1.41*8.3145/0.0289645*(22+273.15));
diameter = 0.0254;
for it = 1:4
    text = strcat(testCase{it}, ' = load(''', testCase{it}, '.fig'', ''-mat'');');
    eval(text);
    for itS = 1:6
        text = strcat('signalC.', testCase{it}, '.XData(itS, :) = ', testCase{it},'.hgS_070000.children(1).children(itS).properties.XData*(0.9*soundVelocity/diameter);');
        eval(text);
        text = strcat('signalC.', testCase{it}, '.YData(itS, :) = ', testCase{it},'.hgS_070000.children(1).children(itS).properties.YData;');
        eval(text);
    end
end
close all
fig1 = figure(1); reset(gcf); plot1 = plot(signalC.Baseline.XData.', signalC.Baseline.YData.', '-', signalC.Baseline.XData(:, 1:gapS:end).', signalC.Baseline.YData(:, 1:gapS:end).', '>');
xlabel('$\tau U_j / D_j$',  'Interpreter', 'latex'); ylabel('$\left<P\right>_{t_i}$', 'Interpreter', 'latex'); xlim([-10 10]);
fig2 = figure(2); reset(gcf); plot2 = plot(signalC.St005.XData.', signalC.St005.YData.', '-', signalC.St005.XData(:, 1:gapS:end).', signalC.St005.YData(:, 1:gapS:end).', '<');
xlabel('$\tau U_j / D_j$',  'Interpreter', 'latex'); ylabel('$\left<P\right>_{t_i}$', 'Interpreter', 'latex'); xlim([-10 10]);
fig3 = figure(3); reset(gcf); plot3 = plot(signalC.St015.XData.', signalC.St015.YData.', '-', signalC.St015.XData(:, 1:gapS:end).', signalC.St015.YData(:, 1:gapS:end).', 's');
xlabel('$\tau U_j / D_j$',  'Interpreter', 'latex'); ylabel('$\left<P\right>_{t_i}$', 'Interpreter', 'latex'); xlim([-10 10]);
fig4 = figure(4); reset(gcf); plot4 = plot(signalC.St025.XData.', signalC.St025.YData.', '-', signalC.St025.XData(:, 1:gapS:end).', signalC.St025.YData(:, 1:gapS:end).', 'v');
xlabel('$\tau U_j / D_j$',  'Interpreter', 'latex'); ylabel('$\left<P\right>_{t_i}$', 'Interpreter', 'latex'); xlim([-10 10]);