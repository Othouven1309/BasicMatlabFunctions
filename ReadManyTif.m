function Ima=ReadManyTif(DataFolder)

if exist('DataFolder','var')==0    
    DataFolder=uigetdir();
end

cd(DataFolder)
list3=ls('*.TIF');

%Opens all .tif to create a movie
%Opens first time point to extract relevant info for faster import
NImages=size(list3,1);
l=strtrim(list3(1,:));
FileTif=strcat(FinalDataPath,l);
NameFiles=l(1:end-5);
Infos=imfinfo(FileTif);
NCol=Infos(1).Width;
NLines=Infos(1).Height;

%Opens all data
Ima=zeros(NLines,NCol,NImages);

for ii=1:NImages
    FileTif=strcat(FinalDataPath,NameFiles,num2str(ii),'.tif');
    Ima(:,:,ii) = double(imread(FileTif,'Info', Infos));
end

end