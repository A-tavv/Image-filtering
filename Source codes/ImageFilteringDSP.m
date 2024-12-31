%--- Image filtering with usage of High-Low pass and Median Filter ---%
%--- Ali Tavakoli Yaraki ---% (Presentor)==> 2040500
%--- Federica Battisti ---% (Professor)

% the sample images
portello = imread('portello.jpg');
road = imread('road.jpg');
overexposed = imread('overexposed.jpg');
barbecue = imread('barbecue.jpg');


% Apply high-pass filters (Color)
sobel_filtered = imfilter(portello, fspecial('sobel'));
%imshow (sobel_filtered);
laplacian_filtered = imfilter(portello, fspecial('laplacian'));
%imshow (laplacian_filtered);

% Apply low-pass filters (Color)
gaussian_filtered = imfilter(portello, fspecial('gaussian', 5));
%imshow (gaussian_filtered);

% Convert sample images to grayscale
portello_gray = rgb2gray(portello);
road_gray = rgb2gray(road);
overexposed_gray = rgb2gray(overexposed);
barbecue_gray = rgb2gray(barbecue);


% cell array to store the grayscale images
images = {portello_gray, road_gray, overexposed_gray,barbecue_gray};

% Number of images
num_images = numel(images);

% subplots for displaying histograms
figure;
for i = 1:num_images
    subplot(2, num_images, i);
    %imshow(images{i});
    %title(['Image ', num2str(i)]);
    
    subplot(2, num_images, i + num_images);
    %imhist(images{i});
    %title(['Histogram ', num2str(i)]);
end


% cell array to store the filtered images
filtered_images_highpass = cell(size(images));

% Apply Sobel filter to each grayscale image
for i = 1:numel(images)
    % Apply Sobel filter
    filtered_images_highpass{i} = edge(images{i}, 'Sobel');
end

% Define the number of rows and columns in the grid
num_rows = 2;
num_cols = 2;

% Display the filtered images in a grid layout
figure;

for i = 1:numel(filtered_images_highpass)
    subplot(num_rows, num_cols, i);
    %imshow(filtered_images_highpass{i});
    title(['High-Pass Filtered Image ', num2str(i)]);
end

% cell array to store the filtered images
filtered_images_lowpass = cell(size(images));

% Define the size of the Gaussian filter (standard deviation)
filter_size = [5, 7];

% Apply Gaussian filter to each grayscale image
for i = 1:numel(images)
    % Apply Gaussian filter
    filtered_images_lowpass{i} = imgaussfilt(images{i}, filter_size);
end


for i = 1:numel(filtered_images_lowpass)
    subplot(num_rows, num_cols, i);
    %imshow(filtered_images_lowpass{i});
    %title(['Low-Pass Filtered Image ', num2str(i)]);
end


