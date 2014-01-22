%run

%Résout l'équation différentielle
options = odeset('RelTol',1e-10,'AbsTol',[1e-10 1e-10]);
[T,Y] = ode45('system',[0.001 9],[1 -1],options);

%Calcule la courbe donnant la position moyenne des électrons
min=minimum(T,Y)
courbeMoyenne=zeros(size(T)-min,2);
i=min+1;
j=1;
while i<=size(T,1)
    a=autreCoteCourbe(min,i,Y);
    courbeMoyenne(j,1)=(T(a)+T(i))/2;
    courbeMoyenne(j,2)=Y(a);
    i=i+1;
    j=j+1;
end

%Calcule la dérivée de la courbe moyenne pour estimer le coefficient
%directeur
dt=floor(size(T,1)/10);
derivee=zeros(size(T)-min-dt,2);
for i=1 : size(derivee,1)
    derivee(i,1)=courbeMoyenne(i,1);
    derivee(i,2)=(courbeMoyenne(i+dt,2)-courbeMoyenne(i,2))/(courbeMoyenne(i+dt,1)-courbeMoyenne(i,1));
end

%Affiche le tout
subplot(1,2,1);
plot(T,Y(:,1),'b',courbeMoyenne(:,1),courbeMoyenne(:,2),'r')
subplot(1,2,2);
plot(derivee(:,1),derivee(:,2),'.')
axis([2 6 0 0.5])