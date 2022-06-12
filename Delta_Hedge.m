clear;
K =1365;
TC = .0010;
dt = 1/365;
% Time to expiry on each date to expiry
timeToExp =[30;29;28;25;24;23;22;21;18;17;16;15;14;11;10;9;8;7;4;3;2;1;0]/365;
%Index on each date to expiry

St = [1365.680054;1374.089966;1369.630005;1364.329956;...
      1343.359985;1352.630005;1365.910034;1370.869995;...
      1371.089966;1395.949951;1394.280029;1402.599976;...
      1404.170044;1409.75;1405.52002;1402.890015;...
      1392.780029;1397.109985;1416.5100;1412.52002;...
      1405.540039;1403.280029;1408.469971];
  
subplot(2,1,1),plot(St); hold all; plot(0*St+K);title('Index Level');
xlabel('Days to Expiry'), ylabel('Index Price ($)');
axis([-inf,inf,-inf,inf]); grid on;
r = 0.0008;
y= 0.0163;
Ca = 24;
IV = .15617;
N = numel(St)-1;
deltah = zeros(N-1,1);
fprintf('------------------------------------------------------------------\n');
fprintf('Delta Hedging \n');
fprintf('------------------------------------------------------------------\n');

% Call premium

CallPremium = Ca * (1-TC);

BankBalance = CallPremium;
stockCosts=0;
% Get the vector of delta positions
for t =1:N-1
    S0 = St(t);
    t2e = timeToExp(t);
    [ ~, deltah(t), ~ ] = blackScholesCallPrice( K, t2e, S0, r, y, IV ); 
    if t>1
        oldStockPosition = deltah(t-1);
    else
        oldStockPosition = 0;
    end
    amtBuy = (deltah(t)-oldStockPosition)*St(t);
    stockCosts = amtBuy +abs(amtBuy)*TC;
    BankBalance = BankBalance*exp(r*dt) - stockCosts;

    fprintf(' t= %i; delta = %.2f; bought $ %.2f of the index; Bank $ %.2f \n', t,deltah(t),amtBuy,BankBalance);
   
end

subplot(2,1,2),plot(deltah(1:end));
axis([-inf,inf,-inf,inf]); grid on;
title('Delta Position');
xlabel('Days to Expiry'), ylabel('Delta Position');
fprintf('------------------------------------------------------------------\n');

CallPayoff = max(0,St(end)-K);
profit = deltah(end)*St(end) +BankBalance - CallPayoff;

fprintf('Total Hedge Profit: $ %.2f \n', profit);
fprintf('------------------------------------------------------------------\n');




