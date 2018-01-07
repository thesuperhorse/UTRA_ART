# CMake generated Testfile for 
# Source directory: /home/brian/UTRA_ART/UTRA_ws/src/navigation/src/laser_geometry
# Build directory: /home/brian/UTRA_ART/UTRA_ws/build/navigation/src/laser_geometry
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_laser_geometry_gtest_projection_test "/home/brian/UTRA_ART/UTRA_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/brian/UTRA_ART/UTRA_ws/build/test_results/laser_geometry/gtest-projection_test.xml" "--return-code" "/home/brian/UTRA_ART/UTRA_ws/devel/lib/laser_geometry/projection_test --gtest_output=xml:/home/brian/UTRA_ART/UTRA_ws/build/test_results/laser_geometry/gtest-projection_test.xml")
add_test(_ctest_laser_geometry_nosetests_test.projection_test.py "/home/brian/UTRA_ART/UTRA_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/brian/UTRA_ART/UTRA_ws/build/test_results/laser_geometry/nosetests-test.projection_test.py.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/brian/UTRA_ART/UTRA_ws/build/test_results/laser_geometry" "/usr/local/bin/nosetests-2.7 -P --process-timeout=60 /home/brian/UTRA_ART/UTRA_ws/src/navigation/src/laser_geometry/test/projection_test.py --with-xunit --xunit-file=/home/brian/UTRA_ART/UTRA_ws/build/test_results/laser_geometry/nosetests-test.projection_test.py.xml")
