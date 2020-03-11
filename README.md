# Selectable Installed/In-Project Libraries with CMake - Proof of Concept

During development it's more convenient to build the project and all its inhouse
dependencies in a single project. Regarding CMake we're just adding all the
dependencies source directories to the project with `add_subdirectory`.

In the CI we might need to use prebuilt dependencies to reduce building times.
In that case the prebuilt libraries must be consumed from an install location,
not as part of the same project. In CMake we're using `find_package` to locate
the dependency.

Here we demonstrate how this can be implemented with minimal changes to the
projects' CMakeLists.

## Description

This repo contains an `app` main project which depends on the `libfoo` library.

The repo provides two scripts to build and run the `app`.

## Usage

Run `./build-run-repo-with-installed-libs.sh` to

- build `libfoo` and copy the artifacts to an install dir
- build `app` which finds `libfoo` with `find_package`
- run `app`

Run `./build-run-repo-with-libs-as-subdir.sh` to

- build `app` with `libfoo` as subdirectory.
- run `app`
