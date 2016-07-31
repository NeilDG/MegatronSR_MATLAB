path = 'C:\Users\NeilDG\Documents\MSCSGithubProjects\MegatronSR_MATLAB\Difference_Measure_Test\9\';
folder_length = length(dir(path)) - 3;

comparison = '1.jpg'; %image name as comparison

input = imread(strcat(path,comparison));
input = rgb2gray(input);

a = im2double(0);
mkdir(strcat(path,'diff'));

for i = 2:folder_length
   candidate_name = strcat(num2str(i), '.jpg');
   full_path = strcat(path,candidate_name);
   
   if exist(full_path, 'file') == 2
        candidate = rgb2gray(imread(full_path));
   
        [ssimval, ssimmap] = ssim(input,candidate);
        
        a = im2double(a + ssimval);
        
        %figure_title = strcat(candidate_name, ' against  ' , comparison);
        %figure; imshow(ssimmap); title(figure_title); 
        
        %write image SSIM
        
        write_name = strcat(path,'diff\', num2str(i), '_diff.jpg');
        imwrite(ssimmap, write_name);
        
        fprintf('Mean ssim Value is %0.4f\n',ssimval); 
   end   
end

%compute average SSIM
a = a / folder_length;
fprintf('Average SSIM value for all read images: %0.4f\n', a);