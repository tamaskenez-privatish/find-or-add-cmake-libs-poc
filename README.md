# Selectable Installed/In-Project Libraries with CMake - Proof of Concept

During development it's more convenient to build the project and all its inhouse
dependencies in a single project. Regarding CMake we're just adding all the
dependencies' source directories to the project with `add_subdirectory`.

In the CI we might need to use prebuilt dependencies to reduce build times.
In that case the prebuilt libraries must be consumed from an install location,
not as part of the same project. In CMake we're using `find_package` to locate
the dependency.

Here we demonstrate how this all can be implemented with minimal changes to the
projects' CMakeLists.

## Description

This repo contains an `app` main project which depends on the `libfoo` library.

The repo provides two scripts to build and run the `app` (with CTest). One of
the scripts builds the application and dependencies as a single project, the
other one builds them in separate projects.

## Usage

Run `./build-run-repo-with-installed-deps.sh` to

- build `libfoo` and copy the artifacts to an install dir
- build `app` which finds `libfoo` with `find_package`
- run `app`

Run `./build-run-repo-with-deps-as-subdir.sh` to

- build `app` with `libfoo` as subdirectory.
- run `app`

## What needs to be changed in existing projects

- In the application's `CMakeLists.txt` call `add_subdirectories` for
  dependencies only if we're building a single project (controlled by the
  `AIMOT_BUILD_INHOUSE_DEPS_FROM_SUBDIRS` variable). Otherwise, call
  `find_package` for the dependecies.
- In the dependencies' `CMakeLists.txt` call `find_package` only if the
  `PROJECT_SOURCE_DIR` == `CMAKE_SOURCE_DIR`.
- Everywhere use namespaced target names (`foo::foo`) or at least and empty
  namespace: `::foo`.
- Every dependency should provide an install target (see
  `libfoo/CMakeLists.txt`)
