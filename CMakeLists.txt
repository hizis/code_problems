cmake_minimum_required (VERSION 2.8)
#-------------------------------------------------------------------------------
# Имя и версия проекта
#-------------------------------------------------------------------------------
set ( PROJECT code_problems )
set ( PROJECT_DESCRIPTION "Задачки по программированию c++" )
set ( PROJECT_VERSION_MAJOR 1 )
set ( PROJECT_VERSION_MINOR 0 )
set ( PROJECT_VERSION_PATCH 0 )
project ( ${PROJECT} )


#-------------------------------------------------------------------------------
# Установка переменных CMake
#-------------------------------------------------------------------------------
#set ( CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin )
#set ( CMAKE_LIBRARY_OUTPUT_DIRECTORY ../lib )
#set ( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ../bin )

set(CODE_PROBLEMS_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# The path to the directory where cmake modules are.
set(CMAKE_MODULE_PATH ${CODE_PROBLEMS_DIR}/cmake)

#-------------------------------------------------------------------------------
# Установка флагов компиляции ( -DCMAKE_BUILD_TYPE=[Debug,Release] )
#-------------------------------------------------------------------------------
set ( CMAKE_CXX_FLAGS "-W -Wall" )
set ( CMAKE_CXX_FLAGS_DEBUG "-O0 -g3" )
set ( CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG -DBOOST_DISABLE_ASSERTS" )

include(CheckCXXCompilerFlag)

CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)

message(STATUS "COMPILER_SUPPORTS_CXX11: ${COMPILER_SUPPORTS_CXX11}")

if(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
#elseif(COMPILER_SUPPORTS_CXX0X)
#    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
#else()
#        message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

add_definitions ( "-D_FILE_OFFSET_BITS=64" )

#-------------------------------------------------------------------------------
# Установка путей для поиска файлов проекта
#-------------------------------------------------------------------------------

include_directories ( 
                       src 
                    )

message(STATUS "***** Autocompleter project *****")
message(STATUS "Searching for Boost...")



find_package(Boost 1.65 COMPONENTS
   program_options
    system
    locale
    unit_test_framework            
    thread
)

message(STATUS "Boost components summary:")
message(STATUS "  program options: ${Boost_PROGRAM_OPTIONS_FOUND}")
message(STATUS "  system: ${Boost_SYSTEM_FOUND}")
message(STATUS "  locale: ${Boost_LOCALE_FOUND}")
message(STATUS "  unit test framework: ${Boost_UNIT_TEST_FRAMEWORK_FOUND}")
message(STATUS "  thread: ${Boost_THREAD_FOUND}")

if (Boost_FOUND)
  message(STATUS "Boost library dirs: " ${Boost_LIBRARY_DIRS})
  message(STATUS "Boost include dirs: " ${Boost_INCLUDE_DIRS})
  include_directories(${Boost_INCLUDE_DIRS})
else ()
  message(FATAL_ERROR "Some boost libraries not found.")
endif ()




message(STATUS "Searching for Log4cplus...")
find_package(Log4cplus)
if (Log4cplus_FOUND)
  message(STATUS "Log4cplus library libs: " ${Log4cplus_LIBRARY})
  message(STATUS "Log4cplus include dir: " ${Log4cplus_INCLUDE_DIR})
  include_directories(${Log4cplus_INCLUDE_DIRS})
else ()
  message(FATAL_ERROR "Log4cplus not found in the system. On Ubuntu install package liblog4cplus-dev")
endif ()

add_subdirectory (src) 
add_subdirectory (test)

enable_testing ()
add_test (NAME MyTest COMMAND Test)
