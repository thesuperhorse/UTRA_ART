# CMake generated Testfile for 
# Source directory: /home/brian/UTRA_ART/UTRA_ws/src/sensors/src/urg_node
# Build directory: /home/brian/UTRA_ART/UTRA_ws/build/sensors/src/urg_node
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_urg_node_roslint_package "/home/brian/UTRA_ART/UTRA_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/brian/UTRA_ART/UTRA_ws/build/test_results/urg_node/roslint-urg_node.xml" "--working-dir" "/home/brian/UTRA_ART/UTRA_ws/build/sensors/src/urg_node" "--return-code" "/opt/ros/kinetic/share/roslint/cmake/../../../lib/roslint/test_wrapper /home/brian/UTRA_ART/UTRA_ws/build/test_results/urg_node/roslint-urg_node.xml make roslint_urg_node")
add_test(_ctest_urg_node_roslaunch-check_launch_urg_lidar.launch "/home/brian/UTRA_ART/UTRA_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/brian/UTRA_ART/UTRA_ws/build/test_results/urg_node/roslaunch-check_launch_urg_lidar.launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/brian/UTRA_ART/UTRA_ws/build/test_results/urg_node" "/opt/ros/kinetic/share/roslaunch/cmake/../scripts/roslaunch-check -o '/home/brian/UTRA_ART/UTRA_ws/build/test_results/urg_node/roslaunch-check_launch_urg_lidar.launch.xml' '/home/brian/UTRA_ART/UTRA_ws/src/sensors/src/urg_node/launch/urg_lidar.launch' ")
