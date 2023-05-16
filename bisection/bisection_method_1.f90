program main 
parameter(errmax=1.0d-10)
parameter(nmax=100)

real(8) x0, x1, x2
real(8) f0, f1, f2

integer n 
real :: p1(nmax)
real :: p2(nmax)
real :: error(nmax)

x0=0.0
x1=2.0

f0=x0**2-2
f1=x1**2-2

if(f0*f1<0)then
else
    stop
endif

do n=1, nmax
    x2=(x0+x1)/2.0
    f2=x2**2-2

    p1(n)=min(x0,x1)
    p2(n)=max(x0,x1)

    if(f0*f2<0)then
        x0 = x0
        x1 = x2
    endif

    if(f1*f2<0)then
        x0 = x2
        x1 = x1
    endif

    if(f2==0)then
    endif
    

    err=abs(x1-x0)/2.0
    !write(*,*) err
    error(n)= err

    if(err<errmax)then
        write(*,*)'The answer is in range of',min(x0,x1),'<',max(x0,x1)
        open (18, file='bisection_method_1.csv', status='replace')
        do i = 1, n
            write (18, *) p1(i), ',', p2(i), ',', error(i)
        end do
        close (18)
        stop 'Ended with success'
    endif
    
end do

write(*,*) x0, f0
write(*,*) x1, f1
write(*,*)'Error: not converged'

end