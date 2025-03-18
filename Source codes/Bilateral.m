% storing the filtered images
filtered_images_bilateral = cell(size(images));

% parameters for the bilateral filter
domain_sigma = 10; % Std of spatial domain
range_sigma = 55; % Std of intensity range

% Apply bilateral filter to image
for i = 1:numel(images)
    % Apply bilateral filter
    filtered_images_bilateral{i} = imbilatfilt(images{i}, domain_sigma, range_sigma);
end

% Displaying

for i = 1:numel(filtered_images_bilateral)
    subplot(num_rows, num_cols, i);
    imshow(filtered_images_bilateral{i});
    title(['Bilateral Filtered Image ', num2str(i)]);
end


