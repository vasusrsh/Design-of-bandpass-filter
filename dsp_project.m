clear all; 
close all;

%% Filter Design

A_p = 3;    % passband attenuation in dB 
A_s = 60;   % stopband attenuation in dB

ws = [ 0.1*pi , 0.3*pi ];   % stopband frequency
wp = [0.16*pi , 0.24*pi ];  % passband frequency

[ n , wc ] = buttord( wp/pi ,ws/pi , A_p , A_s ); % calculation of order of the filter(n) and cutt off(wn)

[ b , a ] = butter( n , wc , 'bandpass'  );        % Transfer function

w = 0:0.001:pi;

%% Digital Domain

%z domain conversion

    [ h , ph ] = freqz(b , a , w);      % freq response in digital domain
    magn = 20*log10(abs(h));
    phase = angle(h);                   % calculates phase angle

   
    subplot(1,3,1);
    title('MAGNITUDE RESPONSE');
    plot(ph/pi, magn);
    xlabel('Normalized Frequency (x \pi rads/sample)');
    ylabel('Magnitude (dB)');
    grid on; 
    
    subplot(1,3,3);
    title('POLE-ZERO PLOT');
    zplane(b,a);
    xlabel('Real part');
    ylabel('Imaginary part');
    grid on;
    
    subplot(1,3,2);
    title('PHASE RESPONSE');
    plot(ph/pi,phase); 
    xlabel('Normalized Frequency (x \pi rads/sample)');
    ylabel('Phase');
    grid on;
    hold on;
    
    
   
    
    
    

 