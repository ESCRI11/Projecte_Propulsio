%ASSIGMENT
clear all
%% DADES
g=9.77;
Tt4=1450;%[K]
Mo=0.85;
To=216.65;%[K]
Po=22632;%[Pa]
gamc=1.4;
gamt=1.3;
R=287;
h=43e6;%[J/kg]
pid=0.98;
etaf=0.89;
etacL=0.88;
etacH=0.86;
pib=0.96;
etab=0.99;
etatH=0.91;
etatL=0.92;
etamH=0.993;
etamL=0.997;
alfa=11;
pif=1.52;
picL=6;
picH=9;
cpc=1004.5;
cpt=1243.6;

%% CÀLCULS
%CORRENT LLIURE
thetao=1+((gamc-1)/2)*Mo*Mo;
deltao=(thetao)^(gamc/(gamc-1));
ao=sqrt(gamc*R*To);

%FLUX PRIMARI

%COMBUSTIÓ
thetat=Tt4/To;
%COMPRESSOR
taucL=1+((picL^((gamc-1)/gamc)-1)/etacL);
taucH=1+((picH^((gamc-1)/gamc)-1)/etacH);
tauf=(((pif^((gamc-1)/gamc))-1)/etaf)+1;
%FRACCIÓ DE COMBUSTIBLE
A=cpt/cpc;
tauC=taucL*taucH;
C=(etab*h)/(cpc*To);
f=(A*thetat-tauC*thetao)/(C-A*thetat);

%TURBINA
tautH=1-(cpc*thetao*((taucL*taucH)-taucL))/(etamH*cpt*thetat*(1+f));
tautL=1-(cpc*thetao*((taucL-1)+alfa*(tauf-1))/(etamL*tautH*cpt*thetat*(1+f)));
pitL=(1-((1-tautL)/etatL))^(gamt/(gamt-1));
pitH=(1-((1-tautH)/etatH))^(gamt/(gamt-1));
%TOBERA
Pt9Po=deltao*pid*picL*picH*pib*pitH*pitL;
M9=sqrt((2/(gamt-1))*((Pt9Po^((gamt-1)/gamt))-1));

if M9<1
    P9Po=1;
end

if M9>=1
    M9=1;
    P9Po=Pt9Po*(2/(gamt+1))^(gamt/(gamt-1));
end

T9To=(thetat*tautL*tautH)/(1+((gamt-1)/2)*M9*M9);

%FLUX SECUNDARI
Pt19Po=deltao*pid*pif;
M19=sqrt((2/(gamc-1))*((Pt19Po^((gamc-1)/gamc))-1));

if M19<1
    P19Po=1;
end

if M19>=1
    M19=1;
    P19Po=Pt19Po*(2/(gamc+1))^(gamc/(gamc-1));
end

T19To=(thetao*tauf)/(1+((gamc-1)/2)*M19*M19);

%EMPENYIMENT
coef9=((1+f)/M9)*sqrt(1/(gamc*gamt))*sqrt(T9To);
coef19=(alfa/(gamc*M19))*sqrt(T19To);
u9ao=M9*sqrt(gamt/gamc)*sqrt(T9To);
u19ao=M19*sqrt(T19To);

Fadim=(1+f)*u9ao-Mo+coef9*(1-inv(P9Po))+alfa*(u19ao-Mo)+coef19*(1-inv(P19Po))
Cs=(1/ao)*(f/Fadim);
Isp=1/(Cs*g)

    
    
    
    

