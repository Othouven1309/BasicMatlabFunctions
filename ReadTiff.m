function Ima=ReadTiff(DataFolder,FileName)

if exist('DataFolder','var')==0
    if exist('FileName','var')==0
        [FileName,DataFolder]=uigetfile();
    else
        DataFolder=pwd;
    end
else
    if exist('FileName','var')==0
        FileName=uigetfile('.tif','choose tif file',DataFolder);
    end
end

File=strcat(DataFolder,FileName);

Infos=imfinfo(File);
NCol=Infos(1).Width;
NLines=Infos(1).Height;
NImages=numel(Infos);
Ima=zeros(NLines,NCol,NImages);

for ii=1:NImages
    Ima(:,:,ii) = double(imread(File,'Index',ii,'Info', Infos));  
end

end