%Convertir la tabla de datos a un array 
load('Data.mat');

%%Para limpiar un poco los datos (no pude borrarlos y acodomodarlos directamente del archivo
%    ¯\_(?)_/¯ )
dataset(:,{'observa','BP1_7','acomapanado'}) = [];
dataset = dataset(:,[1:22 24:29 23]);
 dataset(69,:) = [];
dataset(1607,:) = [];
dataset(2842,:) = [];
dataset(2883,:) = [];


%%Funcion de kmeans a todos los datos
A = table2array( dataset(:, (1:28)) );
B=kmeans(A, 9);


%Exactitud de todos los datos
datasetA= sortrows(dataset(:,2),'TD_TIPO','ascend');
datasetB = sortrows(B,'ascend');
AB= table2array(datasetA);
AD= (datasetB);
n=length(AB);
[cantidad,posicion]=find(AB == AD);
ExactitudGral= [[num2str(length(cantidad)*100/n)],'%']


%% tabla solo con la informacion de los extorsionadores
extorsionadores = dataset(:,8:23);

%%Funcion de kmeans solo a los extorsionadores
AExtorsionadores = table2array( extorsionadores );
BExtorsionadores=kmeans(AExtorsionadores, 5);

datasetAE= sortrows(dataset(:,2),'TD_TIPO','ascend');
datasetBE = sortrows(BExtorsionadores,'ascend');
ABE= table2array(datasetAE);
ADE= (datasetBE);
n=length(ABE);
[cantidad,posicion]=find(ABE == ADE);
ExactitudExtorsionadores= [[num2str(length(cantidad)*100/n)],'%'];


%% tabla solo con la info de las cosas que pidieron
requested = dataset(:,22:27);
Arequested = table2array( requested );
BExtorsionadores=kmeans(Arequested, 9);

datasetAE= sortrows(dataset(:,2),'TD_TIPO','ascend');
datasetBE = sortrows(BExtorsionadores,'ascend');
ABE= table2array(datasetAE);
ADE= (datasetBE);
n=length(ABE);
[cantidad,posicion]=find(ABE == ADE);
ExactitudRequested= [[num2str(length(cantidad)*100/n)],'%'];


