program main 
parameter(errmax=1.0d-10)
parameter(nmax=100)

real(8) x0, x1, x2
real(8) f0, f1, f2
real :: p1(nmax)
real :: p2(nmax)
real :: error(nmax)
integer n 
real(8) r, raws, raww

r = 0.005
raws=300
raww=1000

x0=0.00
x1=r
f0 = -((x0)**3)/3+r*((x0)**2)-(raws/raww)*(r**3)*4/3
f1 = -((x1)**3)/3+r*((x1)**2)-(raws/raww)*(r**3)*4/3
!write(*,*) f0
!write(*,*) f1
!write(*,*) f0*f1

if(f0*f1<0)then
else
    write(*,*) 'The initial value is invaild'
    stop
endif

do n=1, nmax
    p1(n)=x0
    p2(n)=x1

    x2=(x0+x1)/2.0
    f2=-((x2)**3)/3+r*((x2)**2)-(raws/raww)*(r**3)*4/3

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
        open (18, file='bisection_method_3.csv', status='replace')
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