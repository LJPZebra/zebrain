%% export masks as png

load('MaskDatabase.mat');
cd('MATLAB');

for z = 1:138 % for each layer
for i = 1:294 % for each part
    mask = zeros(1406,621,138);
    mask(MaskDatabase(:,i)) = 1;
    img = mask(:,:,z);
    if max(img(:)) > 0
        disp(MaskDatabaseNames{i});
        file = [num2str(z, '%03d') ' ' num2str(i, '%03d') ' ' MaskDatabaseNames{i} '.png'];
        file = replace(file, '/', '-');
        imwrite(img, file);
    end   
end
end

%% export region names correspondence table 

fid = fopen('region-names.txt', 'w');
for i = 1:294
    fprintf(fid, '%03d\t%s\n', i, MaskDatabaseNames{i});
end
fclose(fid);table
