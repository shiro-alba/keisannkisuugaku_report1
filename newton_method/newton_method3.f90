program main
parameter (eps0=1.0d-9)
parameter (nmax=100)
real*8 x, xold, func, dfunc, dx
real*8 eps
real x1
real :: p1(nmax)
real :: error(nmax)
real(8) r, raws, raww

r = 0.005
raws=300
raww=1000

x0=0.001
x = x0
        
do n=1, nmax
    p1(n)=x
    write(*,*) x
    xold=x
    func = -((x)**3)/3+r*((x)**2)-(raws/raww)*(r**3)*4/3
    dfunc = -x**2+2*r*x

    x=x-func/dfunc

    eps=abs(x-xold)
    write(*,*) err
    error(n)=esp
    if(eps<eps0)then
        write(*,*)'Converged to ',x
        open (18, file='newton_method_3.csv', status='replace')
        do i = 1, n
            write (18, *) p1(i) ,',', error(i)
        end do
        close (18)
        stop 'Ended with success'
    endif

end do

write(*,*) x0, func
write(*,*)'Error: not converged'

end