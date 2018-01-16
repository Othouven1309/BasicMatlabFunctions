function tagstruct = setTag(size1, size2) 

%TAG TIFF
tagstruct.ImageLength = size1;
tagstruct.ImageWidth = size2;
tagstruct.Compression = Tiff.Compression.None;
tagstruct.SampleFormat = Tiff.SampleFormat.IEEEFP;
tagstruct.Photometric = Tiff.Photometric.MinIsBlack;
tagstruct.BitsPerSample =  32;
tagstruct.SamplesPerPixel =  1;
tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
%END TAG TIFF

end