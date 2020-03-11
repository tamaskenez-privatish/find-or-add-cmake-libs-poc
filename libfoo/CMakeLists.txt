cmake_minimum_required(VERSION 3.15)
project(libfoo)

add_library(foo STATIC libfoo.cpp libfoo.h)

target_include_directories(foo
    PUBLIC
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
)

install(TARGETS foo EXPORT foo-targets
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
)
install(EXPORT foo-targets
    DESTINATION lib/cmake/foo
    NAMESPACE foo::
    FILE foo-config.cmake
)

# Add a namespaced alias target so client projects can use the same foo::foo target
# both when using foo as a subdirectory and when using it from an install location.
add_library(foo::foo ALIAS foo)

install(DIRECTORY .
    DESTINATION include
    FILES_MATCHING PATTERN *.h
)
