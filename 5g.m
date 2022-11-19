
clc; clear variables; 
% close all;

%Distances from the user to the base station:
d1 = 800;
d2 = 200;
d3=700;
d4=50;


eta = 4;	%Path loss exponent
N = 10^5;



%Rayleigh fading coefficients
h1 = sqrt(d1^-eta)*(randn(N,1)+1i*randn(N,1))/sqrt(2);
h2 = sqrt(d2^-eta)*(randn(N,1)+1i*randn(N,1))/sqrt(2);
h3 = sqrt(d3^-eta)*(randn(N,1)+1i*randn(N,1))/sqrt(2);
h4 = sqrt(d4^-eta)*(randn(N,1)+1i*randn(N,1))/sqrt(2);

%Channel gains
g1 = (abs(h1)).^2;
g2 = (abs(h2)).^2;
g3 = (abs(h3)).^2;
g4 = (abs(h4)).^2;

deltas=eye(N,6);


%Gain difference(Delta gain):
delta12=abs(g1-g2);deltas(:,1)=delta12;
delta13=abs(g1-g3);deltas(:,2)=delta13;
delta14=abs(g1-g4);deltas(:,3)=delta14;
delta23=abs(g2-g3);deltas(:,4)=delta23;
delta24=abs(g2-g4);deltas(:,5)=delta24;
delta34=abs(g3-g4);deltas(:,6)=delta34;
%calculating the magnitude for delta:
%magnitude_of_deltas=eye(N,6);

mag12=delta12.*delta12;        
dp12 = sum(mag12);     
mag12 = sqrt(dp12);   % magnitude

mag13=delta13.*delta13;                 
dp13 = sum(mag13);     
mag13 = sqrt(dp13);   % magnitude

mag14=delta14.*delta14;     
dp14 = sum(mag14);    
mag14 = sqrt(dp14);   % magnitude

mag23=delta23.*delta23;     
dp23 = sum(mag23);   
mag23 = sqrt(dp23);   % magnitude

mag24=delta24.*delta24;     
dp24 = sum(mag24);    
mag24 = sqrt(dp24);   % magnitude

mag34=delta34.*delta34;  
dp34 = sum(mag34);   
mag34 = sqrt(dp34);   % magnitude

%No pairing between user 1 and user 1 same thing for user 2 and user 2 . . . 
%So the pairing probability between same users is 0
p(1,1)=0;
p(2,2)=0;
p(3,3)=0;
p(4,4)=0;


%Row 1 of the matrix ************************
if ((mag14>mag12)&&(mag12>mag13))
    p(1,4)=0.5;
    p(1,2)=0.3;
    p(1,3)=0.2;
end
if(mag14>mag13&&mag13>mag12)
    p(1,4)=0.5;
    p(1,3)=0.3;
    p(1,2)=0.2;
end
    if (mag12>mag14&&mag14>mag13)
    p(1,2)=0.5;
    p(1,4)=0.3;
    p(1,3)=0.2;
    end
    if (mag12>mag13&&mag13>mag14)
    p(1,2)=0.5;
    p(1,3)=0.3;
    p(1,4)=0.2;
    end
    if (mag13>mag12&&mag12>mag14)
    p(1,3)=0.5;
    p(1,2)=0.3;
    p(1,4)=0.2;
    end
 if(mag13>mag14&&mag14>mag12)
    p(1,3)=0.5;
    p(1,4)=0.3;
    p(1,2)=0.2;
end
    %*****************************
    
    
   %Row 2 of the matrix ************************
   if (mag23>mag24&&mag24>mag12) 
    p(2,3)=0.5;
    p(2,4)=0.3;
    p(2,1)=0.2;
   end
    if (mag23>mag12&&mag12>mag24)
    p(2,3)=0.5;
    p(2,1)=0.3;
    p(2,4)=0.2;
    end
    
    if (mag24>mag23&&mag23>mag12)
    p(2,4)=0.5;
    p(2,3)=0.3;
    p(2,1)=0.2;
    end
    if (mag24>mag12&&mag12>mag23)
    p(2,4)=0.5;
    p(2,1)=0.3;
    p(2,3)=0.2;
    end
    if (mag12>mag23&&mag23>mag24)
    p(2,1)=0.5;
    p(2,3)=0.3;
    p(2,4)=0.2;
    end
    if(mag12>mag24&&mag24>mag23)
    p(2,1)=0.5;
    p(2,4)=0.3;
    p(2,3)=0.2;
   end
      
      %****************************************
      
     
      %Row 3 of the matrix ************************
      if(mag24>mag34&&mag34>mag14)
    p(4,2)=0.5;
    p(4,3)=0.3;
    p41=0.2;
      end
    if(mag24>mag14&&mag14>mag34)
    p(4,2)=0.5;
    p(4,1)=0.3;
    p(4,3)=0.2;
    end
    if(mag34>mag24&&mag24>mag14)
    p(4,3)=0.5;
    p(4,2)=0.3;
    p(4,1)=0.2;
    end
    if(mag34>mag14&&mag14>mag24)
    p(4,3)=0.5;
    p(4,1)=0.3;
    p(4,2)=0.2;
    end
    if(mag14>mag34&&mag34>mag24)
    p(4,1)=0.5;
    p(4,3)=0.3;
    p(4,2)=0.2;
    end
      if(mag14>mag24&&mag24>mag34)
    p(4,1)=0.5;
    p(4,2)=0.3;
    p(4,3)=0.2;
      end
    %**********************************
    
    %Row 4 of the matrix ************************
    if(mag23>mag34&&mag34>mag13)
    p(3,2)=0.5;
    p(3,4)=0.3;
    p(3,1)=0.2;
    end
    if(mag23>mag13&&mag13>mag34)
    p(3,2)=0.5;
    p(3,1)=0.3;
    p(3,4)=0.2;
    end
    if(mag34>mag23&&mag23>mag13)
    p(3,4)=0.5;
    p(3,2)=0.3;
    p(3,1)=0.2;
    end
    if(mag34>mag13&&mag13>mag23)
    p(3,4)=0.5;
    p(3,1)=0.3;
    p(3,2)=0.2;
    end
    if(mag13>mag34&&mag34>mag23)
    p(3,1)=0.5;
    p(3,4)=0.3;
    p(3,2)=0.2;
    end
  if  (mag13>mag23&&mag23>mag34)
    p(3,1)=0.5;
    p(3,2)=0.3;
    p(3,4)=0.2;
  end
