function SaveTif(Ima,SaveFile)

%If the name of the file to be saved is unknown, opens a window for manual
%selection of the directory + name.

if exist('SaveFile','var')==0    
    [Savename,SaveFolder]=uigetFile();
    SaveFile=strcat(Savename,SaveFolder);
end

%Can't work without any image or movie to save...
NLines=size(Ima,1);
NCol=size(Ima,2);
NIma=size(Ima,3);

tagstruct=setTag(NLines,NCol);


Compt=1;
nn=1;
while nn<(NIma+1)
    try
    t = Tiff(SaveFile, 'a');
    t.setTag(tagstruct);
    t.write(single(Ima(:,:,nn)));
    t.close();
    
    nn=nn+1;
    Compt=1;
    
    catch error
        Compt=Compt+1;
        if Compt>10
            disp(error)
            break
        end
        pause(0.05)
    end

end