# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/liurenju/Desktop/research/mobisys-2020/armnn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liurenju/Desktop/research/mobisys-2020/armnn/build

# Include any dependencies generated for this target.
include src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/depend.make

# Include the progress variables for this target.
include src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/progress.make

# Include the compile flags for this target's objects.
include src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o: ../src/backends/neon/test/NeonCreateWorkloadTests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonCreateWorkloadTests.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonCreateWorkloadTests.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonCreateWorkloadTests.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o


src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o: ../src/backends/neon/test/NeonEndToEndTests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonEndToEndTests.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonEndToEndTests.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonEndToEndTests.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o


src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o: ../src/backends/neon/test/NeonJsonPrinterTests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonJsonPrinterTests.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonJsonPrinterTests.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonJsonPrinterTests.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o


src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o: ../src/backends/neon/test/NeonLayerSupportTests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonLayerSupportTests.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonLayerSupportTests.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonLayerSupportTests.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o


src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o: ../src/backends/neon/test/NeonLayerTests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonLayerTests.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonLayerTests.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonLayerTests.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o


src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o: ../src/backends/neon/test/NeonOptimizedNetworkTests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonOptimizedNetworkTests.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonOptimizedNetworkTests.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonOptimizedNetworkTests.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o


src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o: ../src/backends/neon/test/NeonRuntimeTests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonRuntimeTests.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonRuntimeTests.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonRuntimeTests.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o


src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o: ../src/backends/neon/test/NeonTimerTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonTimerTest.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonTimerTest.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonTimerTest.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o


src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/flags.make
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o: ../src/backends/neon/test/NeonMemCopyTests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liurenju/Desktop/research/mobisys-2020/armnn/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && CCACHE_CPP2=yes  ccache /usr/bin/aarch64-linux-gnu-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o -c /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonMemCopyTests.cpp

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.i"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonMemCopyTests.cpp > CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.i

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.s"
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && /usr/bin/aarch64-linux-gnu-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test/NeonMemCopyTests.cpp -o CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.s

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o.requires:

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o.requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o.provides: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o.requires
	$(MAKE) -f src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o.provides.build
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o.provides

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o.provides.build: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o


armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o
armnnNeonBackendUnitTests: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build.make

.PHONY : armnnNeonBackendUnitTests

# Rule to build all files generated by this target.
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build: armnnNeonBackendUnitTests

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/build

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonCreateWorkloadTests.cpp.o.requires
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonEndToEndTests.cpp.o.requires
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonJsonPrinterTests.cpp.o.requires
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerSupportTests.cpp.o.requires
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonLayerTests.cpp.o.requires
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonOptimizedNetworkTests.cpp.o.requires
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonRuntimeTests.cpp.o.requires
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonTimerTest.cpp.o.requires
src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires: src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/NeonMemCopyTests.cpp.o.requires

.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/requires

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/clean:
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test && $(CMAKE_COMMAND) -P CMakeFiles/armnnNeonBackendUnitTests.dir/cmake_clean.cmake
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/clean

src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/depend:
	cd /home/liurenju/Desktop/research/mobisys-2020/armnn/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liurenju/Desktop/research/mobisys-2020/armnn /home/liurenju/Desktop/research/mobisys-2020/armnn/src/backends/neon/test /home/liurenju/Desktop/research/mobisys-2020/armnn/build /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test /home/liurenju/Desktop/research/mobisys-2020/armnn/build/src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/backends/neon/test/CMakeFiles/armnnNeonBackendUnitTests.dir/depend

