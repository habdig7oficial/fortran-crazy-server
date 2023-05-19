cmake_minimum_required(VERSION 3.6)

project(F90-TESTES)
enable_language(Fortran)

if(CMAKE_Fortran_COMPILER_ID MATCHES "GNU")
    set(dialect "-ffree-form -std=f2008 -fimplicit-none")
    set(bounds "-fbounds-check")
endif()
if(CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
    set(dialect "-stand f08 -free -implicitnone")
    set(bounds "-check bounds")
endif()
if(CMAKE_Fortran_COMPILER_ID MATCHES "PGI")
    set(dialect "-Mfreeform -Mdclchk -Mstandard -Mallocatable=03")
    set(bounds "-C")
endif()

#set_property(TARGET executable PROPERTY LINKER_LANGUAGE Fortran)

set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} ${bounds}")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${dialect}")



find_package(Drogon CONFIG REQUIRED)
#add_library(Drogon)

#INCLUDE_DIRECTORIES(/usr/local/lib/)
#LINK_DIRECTORIES(/usr/local/lib/)

#target_link_libraries(libdrogon.a)



file(GLOB_RECURSE sources  src/*.f90 src/*.h)
add_executable(${PROJECT_NAME} trigger.f90)

target_link_libraries(${PROJECT_NAME} PRIVATE Drogon::Drogon)
