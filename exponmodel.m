%hyperelastic exponential model
function P=exponmodel(X,Stretch)
u = X(1);
r = X(2);

for i=1:length(Stretch)
P(i) = -u*(1/Stretch(i))^4*exp(r*(2*Stretch(i)^2-3)+1/(Stretch(i)^4))+u*Stretch(i)^2*exp(r*(2*Stretch(i)^2-3)+1/(Stretch(i)^4));
end
