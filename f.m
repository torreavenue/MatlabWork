%H1, Q1, a

q = -2:0.25:2;
er = 0.1;

for i = 1:16
    a = q(i);
    b = q(i+1);
    fa = a^5 - 3*(a^2)+1;
    fb = b^5 - 3*(b^2)+1;
    er = 0.1;
    if fa * fb < 0
        while abs(a-b)>er
            c = (a+b)/2;
            fc = c^5 - 3*(c^2)+1;
            if fa*fc < 0
                b = c;
                fb = fc;
            elseif fb * fc < 0
               a = c;
               fa = fc;
            else
                break
            end
        end
        c
    end
end

%%
%Q1, 1b

q = -2:6;
er = 1e-12;
dx = 1;
g = 7;

for i = 1:8
    a = q(i);
    b = q(i+1);
    fa = a^2 - 4*(a)-5;
    fb = b^2 - 4*(b)-5;
    if fa * fb < 0
        x = a;
        while dx > er
           fprime = 2*(x) - 4;
           xnew = x - (g/fprime);  
           dx=abs(x-xnew);        
           x = xnew;
           g = (x^2) - 4*(x) -5;
        end
        x
    end  
end

%%

q = -1:0.1:1.5;
er = 1e-12;
dx = 1;

for i = 1:24
    a = q(i);
    b = q(i+1);
    fa = (a^5) - 3*(a^2) + 1;
    fb = (b^5) - 3*(b^2) + 1;
    if fa * fb < 0
        x = a;
        nmax=50;                                       
        eps=1;                                         
        xvals=x;                                       
        n=0;                                           

        while eps>=1e-12&n<=nmax                        
            y=x-((x^5)- 3*(x^2) + 1)/(5*(x^4) - 6*x);  
            xvals=[xvals;y];                           
            eps=abs(y-x);                               
            x=y;
            n=n+1;                                  
        end
        x
    end
    end  


