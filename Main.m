disp("*****  lyrics.txt   *****");
texto("lyrics.txt");

disp("*****  soundMono.wav   *****");
audio("soundMono.wav");

disp("*****  landscape.bmp   *****");
imagem("landscape.bmp");

disp("*****  MRI.bmp   *****");
imagem("MRI.bmp");

disp("*****  MRIbin.bmp   *****");
imagem("MRIbin.bmp");


%--------EX6---------
disp("**** EXERCÍCIO 6****");

%leitura do query
query = imread("query.bmp");

%alfabeto das imagens
alfa = (0:(2^8)-1);

passo = 15;

figure();

%target ao que vamos comparar o query
target = imread("target_original.bmp");

%calculo da informação mútua
aux1 = infomutua(target, query, alfa,passo);

%x e y, são as coordenas do valor máximo da informação mútua
[y, x] = find(ismember(aux1, max(aux1(:))));

disp("Informação mútua máxima do 'target_original.bmp': " + max(aux1(:)));
imshow(target);
title("target_original.bmp");
%Devido às coordenadas x & y não serem as verdadeiras do target, multiplicamos por 15
%por causa do step
rectangle("Position", [(x-1)*15, (y-1)*15, size(query,2), size(query,1)],"LineWidth", 2, "LineStyle", "--", "EdgeColor", "r");  


%O mesmo é utilizado paras as outras imagens


figure();

target1 = imread("target_noise.bmp");
aux1 = infomutua(target1, query, alfa,passo);
[y, x] = find(ismember(aux1, max(aux1(:))));
disp("Informação mútua máxima do 'target_noise.bmp': " + max(aux1(:)));
imshow(target1);
title("target_noise.bmp");
rectangle("Position", [(x-1)*15, (y-1)*15, size(query,2), size(query,1)],"LineWidth", 2, "LineStyle", "--", "EdgeColor", "r"); 


figure();

target2 = imread("target_lightning_contrast.bmp");
aux1 = infomutua(target2, query, alfa,passo);
[y, x] = find(ismember(aux1, max(aux1(:))));
disp("Informação mútua máxima do 'target_lightning_contrast.bmp': " + max(aux1(:)));
imshow(target2);
title("target_lightning_contrast.bmp");
rectangle("Position", [(x-1)*15, (y-1)*15, size(query,2), size(query,1)],"LineWidth", 2, "LineStyle", "--", "EdgeColor", "r");  


figure();

target3 = imread("target_inverted.bmp");
aux1 = infomutua(target3, query, alfa,passo);
[y, x] = find(ismember(aux1, max(aux1(:))));
disp("Informação mútua máxima do 'target_inverted.bmp': " + max(aux1(:)));
imshow(target3);
title("target_inverted.bmp");
rectangle("Position", [(y-1)*15, (x-1)*15, size(query,2), size(query,1)],"LineWidth", 2, "LineStyle", "--", "EdgeColor", "r");


figure();

target3 = imread("target1.bmp");
aux1 = infomutua(target3, query, alfa,passo);
[y, x] = find(ismember(aux1, max(aux1(:))));
disp("Informação mútua máxima do 'target1.bmp': " + max(aux1(:)));
imshow(target3);
title("target1.bmp");
rectangle("Position", [(x-1)*15, (y-1)*15, size(query,2), size(query,1)],"LineWidth", 2, "LineStyle", "--", "EdgeColor", "r");  

figure();

target4 = imread("target2.bmp");
aux1 = infomutua(target4, query, alfa,passo);
[y , x] = find(ismember(aux1, max(aux1(:))));
disp("Informação mútua máxima do 'target2.bmp': " + max(aux1(:)));
imshow(target4);
title("target2.bmp");
rectangle("Position", [(x-1)*15, (y-1)*15, size(query,2), size(query,1)],"LineWidth", 2, "LineStyle", "--", "EdgeColor", "r");  


figure();

target5 = imread("target3.bmp");
aux1 = infomutua(target5, query, alfa,passo);
[y, x] = find(ismember(aux1, max(aux1(:))));
disp("Informação mútua máxima do 'target3.bmp': " + max(aux1(:)));
imshow(target5);
title("target3.bmp");
rectangle("Position", [(x-1)*15, (y-1)*15, size(query,2), size(query,1)],"LineWidth", 2, "LineStyle", "--", "EdgeColor", "r");  

figure();

target6 = imread("target4.bmp");
aux1 = infomutua(target6, query, alfa,passo);
[y, x] = find(ismember(aux1, max(aux1(:))));
disp("Informação mútua máxima do 'target4.bmp': " + max(aux1(:)));
imshow(target6);
title("target4.bmp");
rectangle("Position", [(x-1)*15, (y-1)*15, size(query,2), size(query,1)],"LineWidth", 2, "LineStyle", "--", "EdgeColor", "r");  





