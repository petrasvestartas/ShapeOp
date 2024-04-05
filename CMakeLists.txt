cmake_minimum_required(VERSION 3.5)
project(TestProject)
include(ExternalProject)
option(DOWNLOAD_DEPENDECIES ON)
option(BUILD OFF)

set(CMAKE_CXX_STANDARD 14)

if(DOWNLOAD_DEPENDECIES)
    ExternalProject_Add(Nanobind
    GIT_REPOSITORY https://github.com/wjakob/nanobind.git
    GIT_TAG master
    PREFIX ${CMAKE_BINARY_DIR}/nanobind
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD ON
    )
endif()



if(BUILD)

    find_package(Python 3.9 COMPONENTS Interpreter Development.Module REQUIRED)

    if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
        set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
        set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
    endif()

    include(${CMAKE_BINARY_DIR}/nanobind/src/Nanobind/cmake/nanobind-config.cmake)
    nanobind_add_module(my_ext libShapeOp/my_ext.cpp)

endif()