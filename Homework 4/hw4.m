load('C11_thrust_curve.mat')
x_vals = thrust_data(:,1);
y_vals = thrust_data(:,2);
totalImpulseC11 = trapezoid_data(x_vals,y_vals)
averageThrustC11 = totalImpulseC11/max(x_vals)
plot(x_vals,y_vals)
title('C11 Thrust Data');
xlabel('Time (seconds)');
ylabel('Thrust (Newtons)');
xlim([0,max(x_vals)]);
hold on
t=-5:.01:5;    
  plot(t,ones(size(t))*averageThrustC11,'--');
hold off
saveas(gcf,'c11.png');

load('D11_thrust_curve.mat')
x_vals = thrust_data(:,1);
y_vals = thrust_data(:,2);
totalImpulseD11 = trapezoid_data(x_vals,y_vals)
averageThrustD11 = totalImpulseD11/max(x_vals)
plot(x_vals,y_vals)
title('D11 Thrust Data');
xlabel('Time (seconds)');
ylabel('Thrust (Newtons)');
xlim([0,max(x_vals)]);
hold on   
  plot(t,ones(size(t))*averageThrustD11,'--');
hold off
saveas(gcf,'d11.png');


load('D12_thrust_curve.mat');
x_vals = thrust_data(:,1);
y_vals = thrust_data(:,2);
totalImpulseD12 = trapezoid_data(x_vals,y_vals)
averageThrustD12 = totalImpulseD12/max(x_vals)
plot(x_vals,y_vals)
title('D12 Thrust Data');
xlabel('Time (seconds)');
ylabel('Thrust (Newtons)');
xlim([0,max(x_vals)]);
hold on   
  plot(t,ones(size(t))*averageThrustD12,'--');
hold off
saveas(gcf,'d12.png');


load('E12_thrust_curve.mat');
x_vals = thrust_data(:,1);
y_vals = thrust_data(:,2);
totalImpulseE12 = trapezoid_data(x_vals,y_vals)
averageThrustE12 = totalImpulseE12/max(x_vals)
plot(x_vals,y_vals)
title('E12 Thrust Data');
xlabel('Time (seconds)');
ylabel('Thrust (Newtons)');
xlim([0,max(x_vals)]);
hold on   
  plot(t,ones(size(t))*averageThrustE12,'--');
hold off
saveas(gcf,'e12.png');