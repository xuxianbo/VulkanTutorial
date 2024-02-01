# Findtinyobjloader - attempts to locate the tinyobjloader matrix/vector library.
#
# This module defines the following variables (on success):
# tinyobjloader_INCLUDE_DIRS - where to find tinyobjloader/tinyobjloader.hpp
# tinyobjloader_FOUND - if the library was successfully located
#
# It is trying a few standard installation locations, but can be customized
# with the following variables:
# TINYOBJLOADER_ROOT_DIR - root directory of a tinyobjloader installation
# Headers are expected to be found in either:
# <TINYOBJLOADER_ROOT_DIR>/tinyobjloader/tinyobjloader.hpp OR
# <TINYOBJLOADER_ROOT_DIR>/include/tinyobjloader/tinyobjloader.hpp
# This variable can either be a cmake or environment
# variable. Note however that changing the value
# of the environment variable will NOT result in
# re-running the header search and therefore NOT
# adjust the variables set by this module.
#=============================================================================
# Copyright 2012 Carsten Neumann
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
# License text for the above reference.)
# default search dirs

SET(_tinyobjloader_HEADER_SEARCH_DIRS
"/usr/include"
"/usr/local/include"
"${CMAKE_SOURCE_DIR}/includes"
"C:/Program Files (x86)/tinyobjloader" )
# check environment variable
SET(_tinyobjloader_ENV_ROOT_DIR "$ENV{TINYOBJLOADER_ROOT_DIR}")
IF(NOT TINYOBJLOADER_ROOT_DIR AND _tinyobjloader_ENV_ROOT_DIR)
	SET(TINYOBJLOADER_ROOT_DIR "${_tinyobjloader_ENV_ROOT_DIR}")
ENDIF(NOT TINYOBJLOADER_ROOT_DIR AND _tinyobjloader_ENV_ROOT_DIR)
# put user specified location at beginning of search
IF(TINYOBJLOADER_ROOT_DIR)
	SET(_tinyobjloader_HEADER_SEARCH_DIRS "${TINYOBJLOADER_ROOT_DIR}"
	"${TINYOBJLOADER_ROOT_DIR}/include"
	${_tinyobjloader_HEADER_SEARCH_DIRS})
ENDIF(TINYOBJLOADER_ROOT_DIR)
# locate header
FIND_PATH(tinyobjloader_INCLUDE_DIR "tinyobjloader/tiny_obj_loader.h"
PATHS ${_tinyobjloader_HEADER_SEARCH_DIRS})
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(tinyobjloader DEFAULT_MSG
tinyobjloader_INCLUDE_DIR)
IF(tinyobjloader_FOUND)
	SET(tinyobjloader_INCLUDE_DIRS "${tinyobjloader_INCLUDE_DIR}")
	MESSAGE(STATUS "tinyobjloader_INCLUDE_DIR = ${tinyobjloader_INCLUDE_DIR}")
ENDIF(tinyobjloader_FOUND)
