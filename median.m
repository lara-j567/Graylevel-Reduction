
function [m]=median(array2)

   n=length(array2)
   
   if(mod (n,2) ==0)
       
       m=array2(n/2)
       
   else
      
       m=array((array2(n-1)+array2(n+1))/2)
   end

end