clear all
i = 1;
for alfa = 0:12
    [Fadimalfa(i), Ispalfa(i)] = Assigment(alfa, 1.52, 5, 6);
    alfaX(i) = alfa;
    i = i + 1;
end

i = 1;
for picL = 1:12
    [FadimPicL(i), IspPicL(i)] = Assigment(8, 1.52, picL, 6);
    picLX(i) = picL;
    i = i + 1;
end

i = 1;
for picH = 1:12
    [FadimPicH(i), IspPicH(i)] = Assigment(8, 1.52, 5, picH);
    picHX(i) = picH;
    i = i + 1;
end

i = 1;
for pif = 1.5:0.05:2
    [FadimPif(i), IspPif(i)] = Assigment(8, pif, 5, 6);
    pifX(i) = pif;
    i = i + 1;
end

figure

subplot(2,2,1)
[hAx,hLine1,hLine2] = plotyy(alfaX, Fadimalfa, alfaX, Ispalfa)
title('\alpha variable')
xlabel('\alpha')
ylabel(hAx(1), 'F_{adim}')
ylabel(hAx(2), 'I_{sp}')

subplot(2,2,2)
plotyy(picLX, FadimPicL, picLX, IspPicL)

subplot(2,2,3)
plotyy(picHX, FadimPicH, picHX, IspPicH)

subplot(2,2,4)
plotyy(pifX, FadimPif, pifX, IspPif)