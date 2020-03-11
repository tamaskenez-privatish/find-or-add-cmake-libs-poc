cmake_minimum_required(VERSION 3.15)
project(repo)

if(AIMOT_BUILD_INHOUSE_DEPS_FROM_SUBDIRS)
  add_subdirectory(libfoo)
endif()

enable_testing()
add_subdirectory(app)
