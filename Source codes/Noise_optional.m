% Define the std of the Gaussian noise
noise_sigma = 0.1;

% cell array to store noisy images
noisy_images = cell(size(images));

% Add Gaussian noise to each grayscale image
for i = 1:numel(images)
    % Add Gaussian noise to the grayscale image
    noisy_images{i} = imnoise(images{i}, 'gaussian', 0, noise_sigma^2);
end

% cell array to store the filtered images
filtered_images_median = cell(size(noisy_images));

% Define the size of the median filter
filter_size = [8, 9];

% Apply Median filter to each noisy image
for i = 1:numel(noisy_images)
    % Apply Median filter
    filtered_images_median{i} = medfilt2(noisy_images{i}, filter_size);
end

% Display both original noisy images and median-filtered noisy images
figure;
for i = 1:numel(noisy_images)
    % Original noisy image
    subplot(2, numel(noisy_images), i);
    imshow(noisy_images{i});
    title(['Original Noisy Image ', num2str(i)]);
    
    % Median-filtered noisy image
    subplot(2, numel(noisy_images), i + numel(noisy_images));
    imshow(filtered_images_median{i});
    title(['Median Filtered Noisy Image ', num2str(i)]);
end