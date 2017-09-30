
find_path(Log4cplus_INCLUDE_DIR log4cplus/logger.h
  PATHS
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
  PATH_SUFFIXES include
)

find_library(Log4cplus_LIBRARY
  NAMES Log4cplus log4cplus
  PATH_SUFFIXES lib64/ lib/
  PATHS
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

if(Log4cplus_INCLUDE_DIR-NOTFOUND OR Log4cplus_LIBRARY-NOTFOUND)
  set(Log4cplus_FOUND FALSE)
else()
  set(Log4cplus_FOUND TRUE)
endif()

mark_as_advanced(
  Log4cplus_INCLUDE_DIR
  Log4cplus_LIBRARIES
)

