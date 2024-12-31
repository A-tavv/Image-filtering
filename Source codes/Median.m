% cell array to store the filtered images
filtered_images_median = cell(size(images));

% Define the size of the median filter
filter_size = [8, 9];

% Apply Median filter to each grayscale image
for i = 1:numel(images)
    % Apply Median filter
    filtered_images_median{i} = medfilt2(images{i}, filter_size);
end

% Display the filtered images and original in a grid layout
figure;

for i = 1:numel(filtered_images_median)
    subplot(num_rows, num_cols, i);
    imshow(filtered_images_median{i});
    title(['Median Filtered Image ', num2str(i)]);
end


for i = 1:numel(images)
    % Original grayscale image
    subplot(2, numel(images), i);
    imshow(images{i});
    title(['Original Image ', num2str(i)]);
    
    % Filtered image (median filter)
    subplot(2, numel(images), i + numel(images));
    imshow(filtered_images_median{i});
    title(['Median Filtered Image ', num2str(i)]);
end

% Plot the median-filtered images and their histograms
figure;
for i = 1:numel(filtered_images_median)
    % Display median-filtered image
    subplot(2, numel(filtered_images_median), i);
    imshow(filtered_images_median{i});
    title(['Median Filtered Image ', num2str(i)]);
    
    % Plot histogram
    subplot(2, numel(filtered_images_median), i + numel(filtered_images_median));
    imhist(filtered_images_median{i});
    title(['Histogram of Median Filtered Image ', num2str(i)]);
end

% Initialize arrays to store PSNR and SSIM values
psnr_values_median = zeros(numel(images), 1);
ssim_values_median = zeros(numel(images), 1);

% Calculate PSNR and SSIM for each image filtered with the median filter
for i = 1:numel(images)
    % Calculate PSNR
    psnr_values_median(i) = psnr(filtered_images_median{i}, images{i});
    
    % Calculate SSIM
    ssim_values_median(i) = ssim(filtered_images_median{i}, images{i});
end

% Display PSNR and SSIM values for median filter
disp('Median Filter PSNR values:');
disp(psnr_values_median);

disp('Median Filter SSIM values:');
disp(ssim_values_median);


