# Copyright (c) 2013, 2015 Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

### Include HunterGate module from git submodule
set(gate_dir "${CMAKE_CURRENT_LIST_DIR}/")
set(gate_module "${CMAKE_CURRENT_LIST_DIR}/HunterGate.cmake")

get_filename_component(gate_module "${gate_module}" ABSOLUTE)
if(NOT EXISTS "${gate_module}")
  message(
      FATAL_ERROR
      "${gate_module} module not found (update git submodule needed?)"
  )
endif()

message("Including HunterGate: ${gate_module}")
include("${gate_module}")

### Check testing variables are set
string(COMPARE EQUAL "${TESTING_URL}" "" url_is_empty)
string(COMPARE EQUAL "${TESTING_SHA1}" "" sha1_is_empty)
string(COMPARE EQUAL "${HUNTER_ROOT}" "" hunter_root_is_empty)

if(NOT url_is_empty AND NOT sha1_is_empty AND NOT hunter_root_is_empty)
  get_filename_component(TESTING_URL "${TESTING_URL}" ABSOLUTE)

  ### HunterGate module
  HunterGate(URL "${TESTING_URL}" SHA1 "${TESTING_SHA1}" ${TESTING_CONFIG_OPT})
else()
  get_filename_component(HUNTER_ROOT "${CMAKE_CURRENT_LIST_DIR}" ABSOLUTE)
  HunterGate(URL "https://github.com/deanhu2/hunter/archive/v0.19.211.tar.gz" SHA1 "09b9946bad3338b25cbf5450e8dec00b0465b7fa" ${TESTING_CONFIG_OPT})
endif()
