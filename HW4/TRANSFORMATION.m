syms th,t1,t2
A =[cos(th),-sin(th),t1; sin(th), cos(th), t2; 0, 0 ,1];
V3 = [t1/2 - t2*sin(th)/(2*(1-cos(th))); t2/2+t1*sin(th)/(2*(1-cos(th)));1];

T= [1,1,t1/2 - t2*sin(th)/(2*(1-cos(th))); -1i,1i,t2/2+t1*sin(th)/(2*(1-cos(th)));0,0,1];
pretty(inv(T))