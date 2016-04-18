# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.5.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.5.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/aaronbarlow/Desktop/fann

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/aaronbarlow/Desktop/fann

# Include any dependencies generated for this target.
include src/CMakeFiles/fann.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/fann.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/fann.dir/flags.make

src/CMakeFiles/fann.dir/floatfann.c.o: src/CMakeFiles/fann.dir/flags.make
src/CMakeFiles/fann.dir/floatfann.c.o: src/floatfann.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aaronbarlow/Desktop/fann/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/fann.dir/floatfann.c.o"
	cd /Users/aaronbarlow/Desktop/fann/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fann.dir/floatfann.c.o   -c /Users/aaronbarlow/Desktop/fann/src/floatfann.c

src/CMakeFiles/fann.dir/floatfann.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fann.dir/floatfann.c.i"
	cd /Users/aaronbarlow/Desktop/fann/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/aaronbarlow/Desktop/fann/src/floatfann.c > CMakeFiles/fann.dir/floatfann.c.i

src/CMakeFiles/fann.dir/floatfann.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fann.dir/floatfann.c.s"
	cd /Users/aaronbarlow/Desktop/fann/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/aaronbarlow/Desktop/fann/src/floatfann.c -o CMakeFiles/fann.dir/floatfann.c.s

src/CMakeFiles/fann.dir/floatfann.c.o.requires:

.PHONY : src/CMakeFiles/fann.dir/floatfann.c.o.requires

src/CMakeFiles/fann.dir/floatfann.c.o.provides: src/CMakeFiles/fann.dir/floatfann.c.o.requires
	$(MAKE) -f src/CMakeFiles/fann.dir/build.make src/CMakeFiles/fann.dir/floatfann.c.o.provides.build
.PHONY : src/CMakeFiles/fann.dir/floatfann.c.o.provides

src/CMakeFiles/fann.dir/floatfann.c.o.provides.build: src/CMakeFiles/fann.dir/floatfann.c.o


# Object files for target fann
fann_OBJECTS = \
"CMakeFiles/fann.dir/floatfann.c.o"

# External object files for target fann
fann_EXTERNAL_OBJECTS =

src/libfann.2.2.0.dylib: src/CMakeFiles/fann.dir/floatfann.c.o
src/libfann.2.2.0.dylib: src/CMakeFiles/fann.dir/build.make
src/libfann.2.2.0.dylib: src/CMakeFiles/fann.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/aaronbarlow/Desktop/fann/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libfann.dylib"
	cd /Users/aaronbarlow/Desktop/fann/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fann.dir/link.txt --verbose=$(VERBOSE)
	cd /Users/aaronbarlow/Desktop/fann/src && $(CMAKE_COMMAND) -E cmake_symlink_library libfann.2.2.0.dylib libfann.2.dylib libfann.dylib

src/libfann.2.dylib: src/libfann.2.2.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate src/libfann.2.dylib

src/libfann.dylib: src/libfann.2.2.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate src/libfann.dylib

# Rule to build all files generated by this target.
src/CMakeFiles/fann.dir/build: src/libfann.dylib

.PHONY : src/CMakeFiles/fann.dir/build

src/CMakeFiles/fann.dir/requires: src/CMakeFiles/fann.dir/floatfann.c.o.requires

.PHONY : src/CMakeFiles/fann.dir/requires

src/CMakeFiles/fann.dir/clean:
	cd /Users/aaronbarlow/Desktop/fann/src && $(CMAKE_COMMAND) -P CMakeFiles/fann.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/fann.dir/clean

src/CMakeFiles/fann.dir/depend:
	cd /Users/aaronbarlow/Desktop/fann && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/aaronbarlow/Desktop/fann /Users/aaronbarlow/Desktop/fann/src /Users/aaronbarlow/Desktop/fann /Users/aaronbarlow/Desktop/fann/src /Users/aaronbarlow/Desktop/fann/src/CMakeFiles/fann.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/fann.dir/depend

