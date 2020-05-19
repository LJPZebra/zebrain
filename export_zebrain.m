%% export masks as png

load MaskDatabase.mat

%%
mkdir PNG
cd PNG

%%
% --- for each brain region ---
for i = 1:294
    region = MaskDatabaseNames{i};      % get region name
    disp(region);                       % displays it
    mask = false(1406,621,138);         % initialize empty mask
    mask(MaskDatabase(:,i)) = true;     % select corresponding region
    % --- for each layer ---
    for z = 1:138 
        img = mask(:,:,z);              % use given layer
        if max(img(:))                  % if the layer contains a part of the region
            fprintf("%d, ", z);         % displays layer number
                                        % define filename and replace slashes inside it
            file = [num2str(z, '%03d') ' ' num2str(i, '%03d') ' ' MaskDatabaseNames{i} '.png'];
            file = replace(file, '/', '-');
            imwrite(img, file);         % write the b&w image
        end   
    end
    fprintf("\n");                      % linebreak
end
% at this point, there should be 7645 images in the PNG folder

%% export region names correspondence table 

cd ..

fid = fopen('region-names.txt', 'w');
for i = 1:294
    fprintf(fid, '%03d\t%s\n', i, MaskDatabaseNames{i});
end
fclose(fid);

%% [optional] export masks of vertically projected regions

mkdir PROJ
cd PROJ

for i = 1:294
    region = MaskDatabaseNames{i};      % get region name
    disp(region);                       % displays it
    mask = false(1406,621,138);         % initialize empty mask
    mask(MaskDatabase(:,i)) = true;     % select corresponding region
    % --- projection ---
    img = max(mask, [], 3);
    % define filename and replace slashes inside it
    file = [num2str(i, '%03d') ' ' MaskDatabaseNames{i} '.png'];
    file = replace(file, '/', '-');
    imwrite(img, file);                 % write the b&w image
end

%% [optional] export masks of horizontally projected regions

mkdir HPROJ
cd HPROJ

fac = 1.2531/0.798; % size of layer interval in horizontal pixel
imwidth = round(138*fac); % width of the image in horizontal pixel

for i = 1:294
    region = MaskDatabaseNames{i};      % get region name
    disp(region);                       % displays it
    mask = false(1406,621,138);         % initialize empty mask
    mask(MaskDatabase(:,i)) = true;     % select corresponding region
    % --- projection ---
    img = squeeze(max(mask, [], 2));
    img = imresize(img, [1406,imwidth]);
    % define filename and replace slashes inside it
    file = [num2str(i, '%03d') ' ' MaskDatabaseNames{i} '.png'];
    file = replace(file, '/', '-');
    imwrite(img, file);                 % write the b&w image
end




