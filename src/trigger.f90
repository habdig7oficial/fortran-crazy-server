!subroutine Drogon()
!   implicit none
!
!    print *, "Drogon"
!end subroutine Drogon

program testes
    !implicit none

    external Drogon

    call Drogon()

    !call new(drogon,"0.0.0.0",8080);
    !call drogon()

    print *, "Hello World"

end program testes