cmake_minimum_required(VERSION 3.15)
project(app)

if(NOT AIMOT_BUILD_INHOUSE_DEPS_FROM_SUBDIRS)
  find_package(foo REQUIRED)
endif()

add_executable(app main.cpp)

target_link_libraries(app PRIVATE foo::foo)

add_test(test_app app)
