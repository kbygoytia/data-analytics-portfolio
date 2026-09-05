%% *Pre-Processing*
% 
% 
% *1. Importing the image for processing:*

ImJPG=imread('pretty_image.jpg') 
%% 
% *2. Find dimensions of the image.*

[m,n,l]=size(ImJPG)
%% 
% *3. Find the range of colors in the image.* 

maxImJPG = max(ImJPG)
minImJPG = min(ImJPG)
%% 
% *4. Display the image*

imshow(ImJPG)
%% *Manipulating the Image*
% 
% 
% *1. Look at the Red, Green, and Blue hues of the image.* 

red = ImJPG(:,:,1);
%imshow(red)

green = ImJPG(:,:,2);
%imshow(green)

blue = ImJPG(:,:,3);
%imshow(blue)

%% 
% *2. Convert the image to gray-scale:* 

GrayMatrix = [1/3 1/3 1/3; 1/3 1/3 1/3; 1/3 1/3 1/3]
%To do: create gray matrix
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Gray(i,j,:)=uint8(GrayMatrix*PixelColor);
    end
end

%imshow(ImJPG_Gray)


%% 
% *Q1: Explain the purpose of uint8 and double commands in the code above.* 
%% 
% * The double command converts the pixel color values in the processed image 
% from unit8 to double. Then unit8 converts the image back to the original pixel 
% format. 
%% 
% *3. Reproduce the code above with the following filter matrix:*

SepiaMatrix = [.393 .769 .189; .349 .686 .168; .272 .534 .131]

%To do: create sepia matrix
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Sepia(i,j,:)=uint8(SepiaMatrix*PixelColor);
    end
end

%imshow(ImJPG_Sepia)

%% 
% 
% 
% *4. Modify the above code again using the following filter matrix.*					

FilterMatrix = [1 0 0; 0 0 0; 0 0 0]
%To do: create filter matrix

for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Filter(i,j,:)=uint8(FilterMatrix*PixelColor);
    end
end

imshow(ImJPG_Filter)

%% 
% *Q2: What does the transformation above do?* 
%% 
% * The transformation above increases the red color in the picture to saturate 
% it in a bold red. 
%% 
% *5. Modify the above code again using the following matrix* 				

ModifiedMatrix = [0 0 1; 0 1 0; 1 0 0]
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Mod(i,j,:)=uint8(ModifiedMatrix*PixelColor);
    end
end

imshow(ImJPG_Mod)
%% 
% *Q3: What does the transformation above do?*	
%% 
% * The code above changes the red hues in the image to blue hues. 
%% 
% *6. You can produce hue rotation effects with this general transformation. 
% Here θ is the angle of rotation. You can try experimenting with various values 
% of the*
% 
% *angle θ to get different color effects.*

HueMatrix_1 = ([.213 .715 .072; .213 .715 .072; .213 .715 .072] + cos((3*pi)/4)*[.787 -.715 -.072; -.213 .285 -.072; -.213 -.715 .928] + sin(-1/2)*[.213 -.715 .928;  .143 .140 -.283; -.787 .715 .072])
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Hue_1(i,j,:)=uint8(HueMatrix_1*PixelColor);
    end
end

%imshow(ImJPG_Hue_1)
%% 
% 

HueMatrix_2 = ([.213 .715 .072; .213 .715 .072; .213 .715 .072] + cos(-10)*[.787 -.715 -.072; -.213 .285 -.072; -.213 -.715 .928] + sin(-pi/2)*[.213 -.715 .928;  .143 .140 -.283; -.787 .715 .072])
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Hue_2(i,j,:)=uint8(HueMatrix_2*PixelColor);
    end
end

%imshow(ImJPG_Hue_2)
%% 
% 

HueMatrix_3 = ([.213 .715 .072; .213 .715 .072; .213 .715 .072] + cos(sqrt(3)/2)*[.787 -.715 -.072; -.213 .285 -.072; -.213 -.715 .928] + sin((2*sqrt(2))/2)*[.213 -.715 .928;  .143 .140 -.283; -.787 .715 .072])
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Hue_3(i,j,:)=uint8(HueMatrix_3*PixelColor);
    end
end

%imshow(ImJPG_Hue_3)
%% 
% 
% 
% *7. See what other color changing, color enhancing, or color muting matrices 
% you can create.*

%This is my attempt at making the Gingham instagram color filter

Gingham_Filter = [0.9  0.15  0.0; 0.1  0.85  0.1; 0.1  0.1   0.7];
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Gingham(i,j,:)=uint8(Gingham_Filter*PixelColor);
    end
end
imshow(ImJPG_Gingham)
%% 
% 

%Will now be making a pixie hallow yellow glow filter

YGlow_Filter = [1.3  0.2  0.1; 0.2  1.2  0.2; 0.0  0.1  0.9];
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_YGlow(i,j,:)=uint8(YGlow_Filter*PixelColor);
    end
end
imshow(ImJPG_YGlow)
%% 
% 
% 
% *8. Try running the follwoing commands.* 

Crop = ImJPG(100:m-100, 100:n-70)
imshow(Crop)
%% 
% 

Flipped = flip(ImJPG)
imshow(Flipped)
%% 
% 

Rotate_90 = rot90(ImJPG)
imshow(Rotate_90)
%% 
% 

Inverted = 255-ImJPG
imshow(Inverted)
%% 
% 

Muted = ImJPG-50
imshow(Muted)
%% 
% 

Brighten = uint8(1.25*ImJPG) %change the number to see what happens
Exposure_1 = uint8(1.25*ImJPG)
imshow(Exposure_1)

Exposure_2 = uint8(.50*ImJPG)
imshow(Exposure_2)
%% 
% 

filterOut_Blue = [ 1 0 0; 0 1 0; 0 0 0]
%% 
% 

% Convert to grayscale
grayImage = rgb2gray(ImJPG);
imshow(grayImage)
% Transpose
ImTransposed = permute(ImJPG, [2, 1, 3]);
imshow(ImTransposed)

% Flip the transposed image - it turns up
ImFlipped = flip(ImTransposed, 2);
imshow(ImFlipped)

%% 
% *Q4: 	What do each of these commands do?* 
%% 
% * ImJPG(100:m-100, 100:n-70) - crops the image, but for some reason it also 
% comes out gray scale. 
% * flip(ImJPG) - Flips the image so what was on the bottom is now on top.
% * rot90(ImJPG) - Rotates the image 90 degrees so the apple that was in the 
% bottom left corner vertically is now on the bottom right corner horizontally. 
% * 255-ImJPG - Shows the color inversion of the image.
% * ImJPG -50 - Mutes or darkens the color of the image.
% * uint8(1.25*ImJPG) - Changes the brightness/exposure of the image.
%% 
% *9. Delete one of the colors (RGB) in the image. First, produce a filter matrix 
% which deletes the color in the image and keeps the other two intact. Use it 
% to filter the image.* 

for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_Filter(i,j,:)=uint8(filterOut_Blue*PixelColor);
    end
end

imshow(ImJPG_Filter)
%% *Exercises*
% *1. Color Adjusting Matrix* 

%We will check if the matrix given is invertable

A = [.7 .15 .15; .15 .7 .15; .15 .15 .7]
det(A)
%Since the det(A) = 0.3025 it seems to be invertable. 

%Let's make the inverse filter 
Inverse_filter = inv(A)

%Apply both to the original image 

%Matrix A
for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(ImJPG(i,j,:)), 3, 1); 
        ImJPG_A(i,j,:) = uint8(min(max(A * PixelColor, 0), 255)); 
    end
end
imshow(ImJPG_A)

%Inverse
for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(ImJPG_A(i,j,:)), 3, 1); 
        ImJPG_inv(i,j,:) = uint8(min(max(Inverse_filter * PixelColor, 0), 255)); 
    end
end
imshow(ImJPG_inv)
%% 
% *Q5: Explain what the initial transformation does to the image. What does 
% the inverse transformation do with the colors?* 
%% 
% * Information is actually not lost at least from what I am seeing. The image 
% went from being dull with the matrix A transformation to having its normal coloring 
% again after the inverse transformation. 
%% 
% *2. Let us create 3 Andy Warhol style arts with the image. To do so, we arrange 
% four copies of the image in a 2x2 matrix. For the top-left corner we will take 
% the unaltered image. For the subsequent corners, change the colors, flip the 
% images, rotate the images, etc. Then arrange the images together in one larger 
% matrix by matrix concatenation. Finally, display the resulting block matrix 
% as a single image. Do this 3 times with different combinations of altered images. 
% Explain what you did to each image in a short write-up with the images.* 
% 
% 
% 
% *Warhol Image 1:*

spotty = uint8(255 * (rand(m, n) > 0.98)); %Here we are creating noise spots to overlay on the image. 
ImJPG_spotty = ImJPG - spotty %This removes the spot texture to create negative space.

%This will add a blue color filter over the spotty image to create a plasma
%like glow similar to a ghost. 
dark_blue = [0.2  0.1  0.8; 0.1  0.2  0.9; 0.2  0.2  1.5]; 
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG_spotty(i,j,:)),3,1);
        ImJPG_Spotblue(i,j,:)=uint8(dark_blue*PixelColor);
    end
end

grainy = uint8(300 * randn(m, n, 3)); %This will add white noise to the image. 
ImJPG_Grain = ImJPG + grainy %Overlaying the white noise onto the image
ImJPG_invert = 270-ImJPG %Causes color inversion of the image.

Warhol_1= [ImJPG ImJPG_Spotblue; ImJPG_invert ImJPG_Grain]; %The first warhol matrix

imshow(Warhol_1);
%% 
% *Warhol Image 2:*


pink_contrast = [2.0  -0.2  0.5; -0.1 1.8 -0.3; 0.3  -0.2  1.5]; %Increasing contrast of the image colors so strong redish-pinks stand out. 
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_pinkcontrast(i,j,:)=uint8(pink_contrast*PixelColor);
    end
end

purple_filter = [1.2  0.1  1.3; 0.2  0.6  0.2; 1.1  0.1  1.3]; %Making a filter to turn the image purpleish-pink
for i=1:m
    for j=1:n
        PixelColor=reshape(double(ImJPG(i,j,:)),3,1);
        ImJPG_purple(i,j,:)=uint8(purple_filter*PixelColor);
    end
end

Image_invert = 280 - ImJPG; %Inverting my image 
blue_filter = [0.2 0.2 1.5; 0.2 0.3 1.4; 0.2 0.2 1.6]; %Then once inverted I will use this matrix to filter it blue which will turn it to gray scale.
for i=1:m
    for j=1:n
        PixelColor=reshape(double(Image_invert(i,j,:)),3,1);
        ImJPG_blue_invert(i,j,:)=uint8(blue_filter*PixelColor);
    end
end

Warhol_2= [ImJPG ImJPG_blue_invert; ImJPG_purple ImJPG_pinkcontrast]; %The second warhol matrix

imshow(Warhol_2);
%% 
% *Warhol Image 3:* 

first_image_flip = fliplr(ImJPG); %Flipping image left to right. 
for i = 1:m
    for j = 1:n
        PixelColor = reshape(double(first_image_flip(i,j,:)), 3, 1); 
        NewPixel = SepiaMatrix * PixelColor; % Apply sepia matrix 
        ImJPG_flip_sepia(i,j,:) = uint8(min(max(NewPixel, 0), 255));
    end
end


second_image_flip = flip(ImJPG) % Here I will be flipping the bottom left image up to bottom to create a mirror effect. 
for i = 1:m
    for j = 1:n
        PixelColor = double(second_image_flip(i,j,:));
        ImJPG_flip_dark(i,j,:) = uint8(0.8 * PixelColor); % Reducing the brightness of flipped image
    end
end


Rotate_180 = imrotate(ImJPG, 180); %Rotates image on the bottom right 180 degrees
blue_red_filter = [0.8  0.1  0.2; 0.1  1.2  0.2; 0.1  1.2  0.2]; %Enhances the cyan and a few spots of red. 
for i=1:m
    for j=1:n
        PixelColor=reshape(double(Rotate_180(i,j,:)),3,1);
        ImJPG_br_rotate(i,j,:)=uint8(blue_red_filter*PixelColor);
    end
end


Warhol_3= [ImJPG ImJPG_flip_sepia; ImJPG_flip_dark ImJPG_br_rotate]; %The third warhol matrix

imshow(Warhol_3);
%% *Free*

%For this free section I originally wanted to do image to sound processing, but that was a bit ambitious. Instead I will be using image color segmentation, edge detection, and overlaying images. 

%My resources for all of these pieces can be found here: 
%https://blogs.mathworks.com/steve/2019/12/03/how-to-overlay-a-color-on-an-image-using-a-mask/
%https://www.mathworks.com/matlabcentral/answers/414351-overlay-image-on-top-of-image
%https://www.mathworks.com/matlabcentral/answers/414351-overlay-image-on-top-of-image


%% 
% 

%Here I am reading in my person image that I will be doing edge detection and color segmentation on. 
PersonJPG=imread('person.jpg') 
imshow(PersonJPG,'InitialMagnification','fit')

%Now I am reading in my first background image that will go into the first image.
BackgroundJPG=imread('background.jpg')   
imshow(BackgroundJPG)

%Time to do color segmentation on the person picture. We will be segmenting
%it into 3 different color clusters by using k-means clustering. 
numColors = 3;
L = imsegkmeans(PersonJPG,numColors); %This assigns the pixel segments to the labels 1-3.
B = labeloverlay(PersonJPG,L); %This helps to overlay the segmented boundaries of the clusters.
imshow(B)
%The image can know be turned into different masks that keep and removes
%certain segments of the image. In mask1 I will be removing everything
%inside the picture/anything that is not segmented yellow. 
mask1 = pixel_labels == 1;
cluster1 = PersonJPG.*uint8(mask1); %masks out anything that is not yellow
imshow(cluster1)

%We will then add edge detection to the picture to create an outline of the
%person. The edges will also be thickened and changed to the color magenta
%to make it pop. 
Edge_cluster1 = edge(rgb2gray(cluster1),'canny'); %This will do the edge detection by using canny. 
imshow(Edge_cluster1); 
Edge_thicken = imdilate(Edge_cluster1,ones(3,3)); %helps to thicken the edge so that is more visible. 
Magenta_overlay = imoverlay(cluster1,Edge_thicken,'magenta'); %overlays the now magenta edges to the masked image. 
imshow(Magenta_overlay); 
%With our new mask and edge picture we will fill the black space with our
%backgroud image. 
foreground = Magenta_overlay
background = BackgroundJPG
%To make sure the that person image and the background are dimension
%compatiable we will resize the background to the same dimensions as our
%altered person image. 
background = imresize(background, [size(foreground, 1), size(foreground, 2)]);

%This section will change the black space and replace it with the
%background image. 

mask1 = foreground(:,:,1) == 0 & foreground(:,:,2) == 0 & foreground(:,:,3) == 0;% identifies the black pixels in the person image that will be replaced. 

Image_one = foreground;
for channel = 1:3
    foreChannel = Image_one(:,:,channel); %extracts an RBG channel from 1 to 3. 
    BgChannel = background(:,:,channel);%it extracts the same channel in the background picture. 
    foreChannel(mask1) = BgChannel(mask1); %replaces the black pixels with the background pixels. 
    Image_one(:,:,channel) = foreChannel; %updates the picture to combine the background with the mask. 
end
imshow(Image_one);

%With this mask it will keep everything that is segmented as cluster 2 and
%remove everything else. 
mask2 = pixel_labels == 2;
cluster2 = PersonJPG.*uint8(mask2); %keeping only cluster 2 segment
imshow(cluster2)

%Then we will also edge detect the new altered picture to draw an outline
%in blue. 
Edge_cluster2 = edge(rgb2gray(cluster2),'canny');
imshow(Edge_cluster2);
%Here we once again thicken the edge and change the color to blue. 
Edge_thicken = imdilate(Edge_cluster2,ones(3,3));
Blue_overlay = imoverlay(cluster2,Edge_thicken,'blue');
imshow(Blue_overlay);
%After the blue edge overlay we will then overlay this picture ontop of a
%new star background. 
fground = Blue_overlay
bground = imread('background_2.jpg');

% Resizing the background to match our person image
bground = imresize(bground, [size(fground, 1), size(fground, 2)]);

%Once again replacing the black pixels with the background image. 
mask2 = fground(:,:,1) == 0 & fground(:,:,2) == 0 & fground(:,:,3) == 0;

Image_two = fground;

for channel = 1:3
    fg_channel = Image_two(:,:,channel);
    bg_channel = bground(:,:,channel);
    fg_channel(mask2) = bg_channel(mask2);
    Image_two(:,:,channel) = fg_channel;
end

imshow(Image_two);