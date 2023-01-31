 clc; 
 clear;
 clear all;
%Ilk iki soru
xd = input('x[n] ayrık zamanlı işaretinin uzunluğunu girin :');
y = input('x[n] ayrık zamanlı işaretinin başlangıç noktasının koordinasyonunu girin :');

for i = 1 : xd                                                 %ilk işareti alma
    fprintf('n = %d noktası için x işaretinin değeri:', i+y-1);
    x(i) = input('');
end

fprintf('\n');
ad = input('y[m] ayrık zamanlı işaretinin uzunluğunu girin :');
b = input('y[m] ayrık zamanlı işaretinin başlangıç noktasının koordinasyonunu girin :');
fprintf('\n');

for i = 1 : ad                                                 %ikinci işareti alma
    fprintf('n = %d noktası için y işaretinin değeri:', i+b-1);
    y(i) = input('');
end
myConv = myConvFunc(y,ad,x,xd);

subplot(2,2,1);
stem(x);
title('x[n] işareti');
for i=1 : xd
    fprintf('%d ', x(i));
end
fprintf('\n');
subplot(2,2,2);
stem(y)
title('y[m] işareti');
sample=conv(x,y);
for i=1 : ad
    fprintf('%d ', y(i));
end
fprintf('\n');
for i=1 : ad+xd-1
    fprintf('%d ', myConv(i));
end
fprintf('\n');
for i=1 : ad+xd-1
    fprintf('%d ', sample(i));
end
subplot(2,2,3);
stem(myConv);
title('my conv');
subplot(2,2,4);
stem(sample);
title('hazır conv');

    % 3 ve 4. soru
% 
%    
%     input('press a key for 5 sec record');
%     recObj = audiorecorder; %% kayıt başlatma nesnesi
%     disp('Start speaking.') %% ekrana mesaj
%     recordblocking(recObj, 5); %% kayıt işlemi
%     disp('End of Recording.'); %% ekrana mesaj
%     sVo = getaudiodata(recObj); %% kaydedilen sesi x değişkenine saklama
%     iteM = input('enter M');
%     h = zeros(1,400*iteM);
%     for i=1 ; iteM;
%         h(400*i)= 0.8*i;
%     end 
%     compSound = myConvFunc(h,length(h),sVo,length(sVo));
%     input('press a key to listen the audio length of 5sec');
%     sound(sVo);
%         fprintf('\n');
%     input('press a key to listen the convuluted audio length of 5sec');
%     sound(compSound);
%     fprintf('\n');
%     input('press a key for 10 sec record');
%     recObj = audiorecorder; %% kayıt başlatma nesnesi    
%     disp('Start speaking.') %% ekrana mesaj
%     recordblocking(recObj, 10); %% kayıt işlemi
%     disp('End of Recording.'); %% ekrana mesaj
%     slVo = getaudiodata(recObj); %% kaydedilen sesi x değişkenine saklama
%     for i=1 ; iteM;
%         h(400*i)= 0.8*i;
%     end 
%     compSoundL = myConvFunc(h,length(h),sVo,length(slVo));
%     fprintf('\n'); 
%     input('press a key to listen the audio length of 10sec');
%     sound(slVo);
%     input('press a key to listen the convuluted audio length of 10sec');
%     sound(compSoundL);

    function myConv = myConvFunc(y,ad,x,xd)
    fuLength = ad+xd-1;
    myConv=zeros(1,fuLength);
    for i=1 : xd
        for j=1 : ad
            myConv(i+j-1) = myConv(i+j-1) + x(i)*y(j);
                end
            end
        end
