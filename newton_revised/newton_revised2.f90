program main
parameter (eps0=1.0d-9)
parameter (nmax=100)
real*8 x, xold, func, dfunc, dx
real*8 eps
real x1
real :: p1(nmax)
real :: result(6)
real :: stepnumber(6)
real :: error(nmax)

x0=1.0
x = x0

do j=1, 6
    dx=0.0000001*(10**j)
    write(*,*) dx
    do n=1, nmax
        p1(n)=x
        write(*,*) x
        xold=x
        func = cos(x)-x/5
        dfunc = ((cos(x+dx)-x/5)-func)/dx

        x=x-func/dfunc

        eps=abs(x-xold)
        !write(*,*) err
        error(n)=esp
        if(eps<eps0)then
            write(*,*)'Converged to ',x
            result(j)=x
            stepnumber(j)=n
            open (18, file='newton_revised2.csv', status='replace')
            do i = 1, n
                write (18, *) p1(i) ,',', error(i)
            end do
            close (18)
        x=x0
        exit
        endif

    end do
end do

open (18, file='newton_revised_result_and_stepnuber.csv', status='replace')
do i = 1, 6
    write (18, *) result(i) ,',', stepnumber(i)
end do
close (18)

write(*,*) x0, func
write(*,*)'Error: not converged'

end