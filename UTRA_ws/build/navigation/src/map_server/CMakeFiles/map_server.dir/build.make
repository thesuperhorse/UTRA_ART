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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/brian/UTRA_ART/UTRA_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/brian/UTRA_ART/UTRA_ws/build

# Include any dependencies generated for this target.
include navigation/src/map_server/CMakeFiles/map_server.dir/depend.make

# Include the progress variables for this target.
include navigation/src/map_server/CMakeFiles/map_server.dir/progress.make

# Include the compile flags for this target's objects.
include navigation/src/map_server/CMakeFiles/map_server.dir/flags.make

navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o: navigation/src/map_server/CMakeFiles/map_server.dir/flags.make
navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o: /home/brian/UTRA_ART/UTRA_ws/src/navigation/src/map_server/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/brian/UTRA_ART/UTRA_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o"
	cd /home/brian/UTRA_ART/UTRA_ws/build/navigation/src/map_server && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/map_server.dir/src/main.cpp.o -c /home/brian/UTRA_ART/UTRA_ws/src/navigation/src/map_server/src/main.cpp

navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/map_server.dir/src/main.cpp.i"
	cd /home/brian/UTRA_ART/UTRA_ws/build/navigation/src/map_server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/brian/UTRA_ART/UTRA_ws/src/navigation/src/map_server/src/main.cpp > CMakeFiles/map_server.dir/src/main.cpp.i

navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/map_server.dir/src/main.cpp.s"
	cd /home/brian/UTRA_ART/UTRA_ws/build/navigation/src/map_server && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/brian/UTRA_ART/UTRA_ws/src/navigation/src/map_server/src/main.cpp -o CMakeFiles/map_server.dir/src/main.cpp.s

navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o.requires:

.PHONY : navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o.requires

navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o.provides: navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o.requires
	$(MAKE) -f navigation/src/map_server/CMakeFiles/map_server.dir/build.make navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o.provides.build
.PHONY : navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o.provides

navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o.provides.build: navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o


# Object files for target map_server
map_server_OBJECTS = \
"CMakeFiles/map_server.dir/src/main.cpp.o"

# External object files for target map_server
map_server_EXTERNAL_OBJECTS =

/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: navigation/src/map_server/CMakeFiles/map_server.dir/build.make
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /home/brian/UTRA_ART/UTRA_ws/devel/lib/libmap_server_image_loader.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libroscpp.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/librosconsole.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libtf2.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/librostime.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libcpp_common.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libBulletDynamics.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libBulletCollision.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libLinearMath.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libBulletSoftBody.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libSDLmain.a
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libSDL.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libSDL_image.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libroscpp.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/librosconsole.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libtf2.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/librostime.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /opt/ros/kinetic/lib/libcpp_common.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server: navigation/src/map_server/CMakeFiles/map_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/brian/UTRA_ART/UTRA_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server"
	cd /home/brian/UTRA_ART/UTRA_ws/build/navigation/src/map_server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/map_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
navigation/src/map_server/CMakeFiles/map_server.dir/build: /home/brian/UTRA_ART/UTRA_ws/devel/lib/map_server/map_server

.PHONY : navigation/src/map_server/CMakeFiles/map_server.dir/build

navigation/src/map_server/CMakeFiles/map_server.dir/requires: navigation/src/map_server/CMakeFiles/map_server.dir/src/main.cpp.o.requires

.PHONY : navigation/src/map_server/CMakeFiles/map_server.dir/requires

navigation/src/map_server/CMakeFiles/map_server.dir/clean:
	cd /home/brian/UTRA_ART/UTRA_ws/build/navigation/src/map_server && $(CMAKE_COMMAND) -P CMakeFiles/map_server.dir/cmake_clean.cmake
.PHONY : navigation/src/map_server/CMakeFiles/map_server.dir/clean

navigation/src/map_server/CMakeFiles/map_server.dir/depend:
	cd /home/brian/UTRA_ART/UTRA_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/brian/UTRA_ART/UTRA_ws/src /home/brian/UTRA_ART/UTRA_ws/src/navigation/src/map_server /home/brian/UTRA_ART/UTRA_ws/build /home/brian/UTRA_ART/UTRA_ws/build/navigation/src/map_server /home/brian/UTRA_ART/UTRA_ws/build/navigation/src/map_server/CMakeFiles/map_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navigation/src/map_server/CMakeFiles/map_server.dir/depend

