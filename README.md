# HunterC Template

Simple project containing all required files for a C++ project implementing the Hunter package manager.


## Details

The Hunter package manager itself is store [here](https://github.com/deanhu2/hunter). This will be downloaded when CMake is called on this project. 

## Modifying

To add a C++ package follow the Hunter guide for developing a package and update the common.cmake file to include a URL to your own Hunter package repository and provide a SHA1 for the subsequent repository release.