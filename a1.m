img1=imread('C:\Users\larai\Documents\rose.jpg');

imshow(img1);

img2=rgb2gray(img1);
% imshow(img2)

[m,n] = size (img2);



reduced_image1=zeros(m,n);

reduced_image2=zeros(m,n);



reduced_image1=im2uint8(reduced_image1);


reduced_image2=im2uint8(reduced_image2);


array=zeros(r1*c1,1);
a=r1*c1;

i1= 1024/(r1*c1)
c1=1
r1=1
b=1

r2=1
c2=1


 for i=1:(512*512)
    
    %main image loop
    for j=r1:1024
        
        %row controlling
        for k=c1:1024
            
            array(b)= img2(j,k)
            b=b+1
            if(mod(k ,2)==0 )
                
            
              break;
            end
            
        end
        
        if(mod(j,2)== 0)
            b=1
            r1=j+1
            
            break;
            
        end
    end    
    
    [avg]=mean(array);
    
    %resultant row image loop
    for l=r2:1024
    
          %resultant col image loop
        for m=c2:1024
            
           reduced_image1(l,m)=avg;
            if(mod(m,2)==0 )
                
            
              break;
            end 
            
        end
        
        if(mod(l,2)== 0)
            r2=l+1
            
            break;
            
        end
    end  
    
    if(j==1024)
        
        r1=1
        c1=c1+2
        r2=1
        c2=c2+2
    end
    
 end


r1=1
c1=1
r3=1
c3=1
b=1
array2=zeros(r3*c3,1)

for i=1:(256*256)
    
    %main image loop
    for j=r1:1024
        
        %row controlling
        for k=c1:1024
            
            array2(b)= img2(j,k)
            b=b+1
            if(mod(k ,4)==0 )
                
            
              break;
            end
            
        end
        
        if(mod(j,4)== 0)
            b=1
            r1=j+1
            
            break;
            
        end
    end    
    
    [med]=median(array2);
    
    %resultant row image loop
    for l=r3:1024
    
          %resultant col image loop
        for m=c3:1024
            
           reduced_image2(l,m)=med;
            if(mod(m,4)==0 )
                
            
              break;
            end 
            
        end
        
        if(mod(l,4)== 0)
            r3=l+1
            
            break;
            
        end
    end  
    
    if(j==1024)
        
        r1=1
        c1=c1+4
        r3=1
        c3=c3+4
    end
    
end


a=m/4
b=n/4
reduced_image3=zeros(a,b);
reduced_image3=im2uint8(reduced_image3);
r1=1;
c1=1;
ri=1;
ci=1;

for i=1:256*256
    
    for j=r1:1024
        
        %row controlling
        for k=c1:1024
            
             if(mod(k ,2)==0 )
                
            
              break;
            
            a= img2(j,k)
           
           
            end
            
        end
        
        if(mod(j,2)== 0)
            
            r1=j+1
            
            break;
            
        end
    end  
    
    
    for l=ri:256
       
        for m=ci:256
           
            reduced_image3(l,m)=a;
            ci=ci+1;
            
            if(ci==1024)
               
                ri=ri+1;
                ci=1;
                
            end
            break;
            
        end
    end
    
end


subplot(1,4,1),imshow(img2);
subplot(1,4,2),imshow(reduced_image1,[]);
subplot(1,4,3),imshow(reduced_image2);
subplot(1,4,4),imshow(reduced_image3);

% imshow((reduced_image1),[]);
