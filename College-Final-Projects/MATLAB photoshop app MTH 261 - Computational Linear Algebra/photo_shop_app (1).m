
%  PHOTO_SHOP_APP 
*Kimberly By Goytia* 
% 
% *04-29-2025*
% 
% *Computational Linear Algebra* 
%% *Introduction:* 
% When I was working on the midterm project I really enjoyed using matrix manipulation 
% to apply color filtering and texture. In that project for my free section I 
% chose to try and combine different image filters to create a new picture. This 
% essentially included removing color channels from the  foreground image, edge 
% detecting it to get an outline, changing the color of the outline to make it 
% stand out, and overlaying this picture on a background image. There was also 
% another section where I removed a part of the foreground image and replaced 
% it/filled it in with the background image. From this free section I wanted to 
% continue working with image filtering, but I specifically wanted to incorperate 
% live camera feed to create image filters similar to instagram/photo booth effects 
% or zoom backgrounds. However, I think my laptop is on it's last breath because 
% everytime I tried to use the Matlab webcam it immediately crashed or the webcam 
% would turned off without pulling up the live feed window. 
% 
% After experiencing this issue I began searching for different ways that I 
% could continue working with image filtering and I came across a Matlab help 
% request around changing an image to binary using the UI app builder. From this 
% help request I began learning how to use the Matlab app builder so that I could 
% create a very basic photo editing interface. In my interface I have  two tabs 
% that create different editing experiences. The first is the edit tab which allows 
% the user to change the saturation, brightness, contrast, warmth, blur, and sharpness 
% of the uploaded image. The second is the filter tab which let's the user select 
% from sepia, blue grey, pink, invert, outline, and grainy which automatically 
% filter the image. 
% 
% 
function photo_shop_app
    fig = uifigure('Name','Photo Editor','Position',[200 200 750 600]', 'Color', [0.1 0.1 0.1]);
    ax = uiaxes(fig, 'Position', [175 250 400 300], 'Box', 'on', 'Color', 'k');
    ax.XTick = [];
    ax.YTick = [];
    ax.YColor = 'none';
    ax.XColor = 'none';
    imgRGB = [];
    imgGray3 = [];
%Image upload button created. 
    uibutton(fig, 'Text', 'Upload Image', 'Position', [60 550 120 35], 'FontWeight', 'bold', 'FontSize', 13, 'ButtonPushedFcn', @(btn, event) uploadImage(), 'BackgroundColor', [0.2 0.2 0.2], 'FontColor', 'w');
%Making the different tabs for edit sliders and filter buttons.
    tabGroup = uitabgroup(fig, 'Position', [0 0 750 280]);
    editTab = uitab(tabGroup, 'Title', 'Edit');
    filterTab = uitab(tabGroup, 'Title', 'Filters');
  
% Creating the greyish-black panel behind the sliders and the edit sliders themselves. 
    ctrlPanel = uipanel(editTab, 'Position', [0 0 750 280], 'BackgroundColor', [0.15 0.15 0.15], 'BorderType', 'none');
    colorSlider = uislider(ctrlPanel, 'Position', [150, 220, 450, 3], 'Limits', [0 1], 'Value', 0.5, 'Enable', 'off', 'MajorTicks', [], 'MinorTicks', [], 'ValueChangedFcn', @(sld,event) blendColor());
    uilabel(ctrlPanel, 'Text', 'Saturation', 'Position', [70 215 70 20], 'FontColor', 'w', 'BackgroundColor', [0.15 0.15 0.15]);
    brightnessSlider = uislider(ctrlPanel, 'Position', [150, 180, 450, 3], 'Limits', [-0.5 0.5], 'Value', 0, 'Enable', 'off', 'MajorTicks', [], 'MinorTicks', [], 'ValueChangedFcn', @(sld,event) blendColor());
    uilabel(ctrlPanel, 'Text', 'Brightness', 'Position', [70 175 70 20], 'FontColor', 'w', 'BackgroundColor', [0.15 0.15 0.15]);
    warmthSlider = uislider(ctrlPanel, 'Position', [150, 140, 450, 3], 'Limits', [-1 1], 'Value', 0, 'Enable', 'off', 'MajorTicks', [], 'MinorTicks', [], 'ValueChangedFcn', @(sld,event) blendColor());
    uilabel(ctrlPanel, 'Text', 'Warmth', 'Position', [70 135 70 20], 'FontColor', 'w', 'BackgroundColor', [0.15 0.15 0.15]);
    contrastSlider = uislider(ctrlPanel, 'Position', [150, 100, 450, 3], 'Limits', [-1 1], 'Value', 0, 'Enable', 'off', 'MajorTicks', [], 'MinorTicks', [], 'ValueChangedFcn', @(sld,event) blendColor());
    uilabel(ctrlPanel, 'Text', 'Contrast', 'Position', [70 95 70 20], 'FontColor', 'w', 'BackgroundColor', [0.15 0.15 0.15]);
    blurSlider = uislider(ctrlPanel, 'Position', [150, 60, 450, 3], 'Limits', [0 1], 'Value', 0, 'Enable', 'off', 'MajorTicks', [], 'MinorTicks', [], 'ValueChangedFcn', @(sld,event) blendColor());
    uilabel(ctrlPanel, 'Text', 'Blur', 'Position', [70 55 70 20], 'FontColor', 'w', 'BackgroundColor', [0.15 0.15 0.15]);
    sharpenSlider = uislider(ctrlPanel, 'Position', [150, 20, 450, 3], 'Limits', [0 1], 'Value', 0, 'Enable', 'off', 'MajorTicks', [], 'MinorTicks', [], 'ValueChangedFcn', @(sld,event) blendColor());
    uilabel(ctrlPanel, 'Text', 'Sharpen', 'Position', [70 15 70 20], 'FontColor', 'w', 'BackgroundColor', [0.15 0.15 0.15]);
    uibutton(ctrlPanel, 'Text', 'Reset', 'Position', [620 150 80 30], 'ButtonPushedFcn', @(btn, event) resetSliders(), 'BackgroundColor', [0.2 0.2 0.2], 'FontColor', 'w');
    filterPanel = uipanel(filterTab, 'Position', [0 0 750 280], 'BackgroundColor', [0.15 0.15 0.15], 'BorderType', 'none');
% This section is where the buttons are actually made usable and connect back to the filter matrices.
    uibutton(filterPanel, 'Text', 'Sepia', 'Position', [175 170 100 30], 'BackgroundColor', [0.2 0.2 0.2], 'FontColor', 'w', 'ButtonPushedFcn', @(btn, event) applySepia());
    uibutton(filterPanel, 'Text', 'Blue Grey', 'Position', [325 170 100 30], 'BackgroundColor', [0.2 0.2 0.2], 'FontColor', 'w', 'ButtonPushedFcn', @(btn, event) applyBlueGrey());
    uibutton(filterPanel, 'Text', 'Pink', 'Position', [475 170 100 30], 'BackgroundColor', [0.2 0.2 0.2], 'FontColor', 'w', 'ButtonPushedFcn', @(btn, event) applyPink());
    uibutton(filterPanel, 'Text', 'Invert', 'Position', [175 120 100 30], 'BackgroundColor', [0.2 0.2 0.2], 'FontColor', 'w', 'ButtonPushedFcn', @(btn, event) applyInvert());
    uibutton(filterPanel, 'Text', 'Outline', 'Position', [325 120 100 30], 'BackgroundColor', [0.2 0.2 0.2], 'FontColor', 'w', 'ButtonPushedFcn', @(btn, event) applyOutline());
    uibutton(filterPanel, 'Text', 'Grainy', 'Position', [475 120 100 30], 'BackgroundColor', [0.2 0.2 0.2], 'FontColor', 'w','ButtonPushedFcn', @(btn, event) applyGrainy());
%We begin the image upload process and make sure that the sliders are working.  
    function uploadImage()
        [file, path] = uigetfile({'*.jpg;*.png;*.jpeg'}, 'Select an image');
        if isequal(file, 0), return; end
        imgRGB = im2double(imread(fullfile(path, file)));
        imgGray = rgb2gray(imgRGB);
        imgGray3 = cat(3, imgGray, imgGray, imgGray);
        imshow(imgRGB, 'Parent', ax);
        colorSlider.Enable = 'on';
        brightnessSlider.Enable = 'on';
        blurSlider.Enable = 'on';
        sharpenSlider.Enable = 'on';
        warmthSlider.Enable = 'on';
        contrastSlider.Enable = 'on';
        colorSlider.Value = 0.5;
        brightnessSlider.Value = 0;
        blurSlider.Value = 0;
        sharpenSlider.Value = 0;
        warmthSlider.Value = 0;
        contrastSlider.Value = 0;
    end
%Making the sliders for each color editing and image enhancing feature. 
    function blendColor()
        if isempty(imgRGB), return; end
        val = colorSlider.Value;
        if val < 0.5
            alpha = val * 2;
            img = (1 - alpha) * imgGray3 + alpha * imgRGB;
        else
            boost = (val - 0.5) * 2;
            hsv = rgb2hsv(imgRGB);
            hsv(:,:,2) = hsv(:,:,2) .* (1 + boost * 1.5);
            hsv(:,:,2) = min(hsv(:,:,2), 1);
            img = hsv2rgb(hsv);
        end
        img = img + brightnessSlider.Value;
        warmthVal = warmthSlider.Value;
        if warmthVal ~= 0
            adjust = zeros(size(img));
            adjust(:,:,1) = warmthVal * 0.15;
            adjust(:,:,3) = -warmthVal * 0.15;
            img = img + adjust;
        end
        contrastVal = contrastSlider.Value;
        if contrastVal ~= 0
            img = (img - 0.5) * (1 + contrastVal) + 0.5;
        end
        blurVal = blurSlider.Value;
        if blurVal > 0
            sigma = blurVal * 10;
            kernelSize = max(3, 2 * ceil(3 * sigma) + 1);
            h = fspecial('gaussian', [kernelSize kernelSize], sigma);
            img = imfilter(img, h, 'replicate');
        end
        sharpVal = sharpenSlider.Value;
        if sharpVal > 0
            h = fspecial('unsharp', 0.5 + sharpVal * 2);
            img = imfilter(img, h, 'replicate');
        end
        img = max(0, min(1, img));
        imshow(img, 'Parent', ax);
    end
%Here is where I start using the matrix filtering from my midterm project M-file.
    function applySepia()
        if isempty(imgRGB), return; end
        sepiaMatrix = [.393 .769 .189; .349 .686 .168; .272 .534 .131];
        [m,n,~] = size(imgRGB);
        imgSepia = zeros(size(imgRGB));
        for i=1:m
            for j=1:n
                pixel = reshape(imgRGB(i,j,:),3,1);
                imgSepia(i,j,:) = sepiaMatrix * pixel;
            end
        end
        imgSepia = uint8(255 * max(0, min(imgSepia, 1)));
        imshow(imgSepia, 'Parent', ax);
    end
    function applyInvert()
        if isempty(imgRGB), return; end
        imgInverted = 1 - imgRGB;
        imgInverted = uint8(255 * imgInverted);
        imshow(imgInverted, 'Parent', ax);
    end
    function applyBlueGrey()
        if isempty(imgRGB), return; end
        hsv = rgb2hsv(imgRGB);
        hsv(:,:,1) = 0.6; 
        hsv(:,:,2) = min(hsv(:,:,2) * 1.3, 1); 
        hsv(:,:,3) = min(hsv(:,:,3) * 1.3, 1); 
        imgGlow = hsv2rgb(hsv);
        imgGlow = imgaussfilt(imgGlow, 1.5); 
        imshow(imgGlow, 'Parent', ax);
    end
    function applyPink()
        if isempty(imgRGB), return; end
        imgGray = rgb2gray(imgRGB);
        pinkGlow = cat(3, imgGray + 0.1, imgGray * 0.9, imgGray + 0.1);
        imgPink = imgaussfilt(pinkGlow, 1.2);
        imgPink = max(0, min(1, imgPink));
        imshow(imgPink, 'Parent', ax);
    end
    function applyOutline()
        if isempty(imgRGB), return; end
        imgGray = rgb2gray(imgRGB);
        h = fspecial('disk', 2);
        imgBlur = imfilter(imgGray, h, 'replicate');
        edges = edge(imgBlur, 'log');
        edges = double(edges);
        imgPainted = repmat(imgBlur, [1 1 3]) .* (1 - edges);
        imshow(imgPainted, 'Parent', ax);
    end
    function applyGrainy()
        if isempty(imgRGB), return; end
        noise = randn(size(imgRGB)) * 0.1;
        imgGrain = imgRGB + noise;
        imgGrain = max(0, min(1, imgGrain));
        imshow(imgGrain, 'Parent', ax);
    end
%Reset so that the image can go back to its original form. 
    function resetSliders()
        colorSlider.Value = 0.5;
        brightnessSlider.Value = 0;
        blurSlider.Value = 0;
        sharpenSlider.Value = 0;
        warmthSlider.Value = 0;
        contrastSlider.Value = 0;
        blendColor();
    end
end
%% *Conclusion:* 
% With the use of the Matlab app builder UI and a few new Matlab built-in functions 
% I was about to create an operating editing interface. Some of the linear algebra 
% concepts used include: scalar matrix addition (brightness), channel linear transofrmations 
% (warmth), gaussian (blur), laplacian (sharpen), linear transformation (sepia), 
% edge detection (outline), gaussian noise (grainy), and many more.  Currently 
% the main downside of this project is that you can only choose to edit or filter 
% the image so you can't overlap the two. For example, if I want a sepia filter 
% image with high contrast and blur I can't create it because the tab functions 
% don't overlap each other. Additionally, I attempted to create a "save image" 
% button so the app could act as a functional editing interface, but I never got 
% it to work so I scrapped the idea. However, both of these issues would be possibly 
% expanded in a deeper exploration at a different time. 
% 
% 
%% *Resources used:*
% I  referenced my M file from the midterm project for some of the filtering 
% matrices.
% 
% 
% 
% This resource gave me the idea of making a filter app:
% 
% <https://www.mathworks.com/matlabcentral/answers/585410-using-gui-to-edit-image 
% https://www.mathworks.com/matlabcentral/answers/585410-using-gui-to-edit-image>
% 
% 
% 
% All of these resources helped me understand how to use the Matlab app UI and 
% what functions would allow me to achieve certain slider filters.
% 
% <https://www.youtube.com/watch?v=oIJ_fmpSfaQ https://www.youtube.com/watch?v=oIJ_fmpSfaQ>
% 
% <https://youtube.com/playlist?list=PLmB_c16LoAcWxSnGEBn_BEGGk0GDmR4Zg&si=vP1R1j0gdZhKFjOk 
% https://youtube.com/playlist?list=PLmB_c16LoAcWxSnGEBn_BEGGk0GDmR4Zg&si=vP1R1j0gdZhKFjOk>
% 
% <https://www.mathworks.com/help/matlab/ref/uifigure.html https://www.mathworks.com/help/matlab/ref/uifigure.html>
% 
% <https://www.mathworks.com/help/matlab/ref/matlab.ui.figureappd-properties.html 
% https://www.mathworks.com/help/matlab/ref/matlab.ui.figureappd-properties.html>
% 
% <https://www.mathworks.com/help/matlab/ref/hsv2rgb.html https://www.mathworks.com/help/matlab/ref/hsv2rgb.html>
% 
% <https://www.mathworks.com/help/images/ref/fspecial.html https://www.mathworks.com/help/images/ref/fspecial.html>
% 
% <https://www.mathworks.com/help/matlab/ref/hsv.html https://www.mathworks.com/help/matlab/ref/hsv.html>
% 
% 
% 
%