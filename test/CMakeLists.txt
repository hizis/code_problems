
find_package (Boost COMPONENTS system filesystem unit_test_framework REQUIRED)

include_directories (${TEST_SOURCE_DIR}/src
                     ${Boost_INCLUDE_DIRS}
                     )

#add_definitions (-DBOOST_TEST_DYN_LINK)
ADD_DEFINITIONS(-DBOOST_TEST_DYN_LINK) 


set(
    TEST_SOURCES
    ut_main.cpp
    test_Example.cpp
)

add_executable (unit_tests ${TEST_SOURCES} )

target_link_libraries (unit_tests
                       code_problems_lib
                       ${Boost_FILESYSTEM_LIBRARY}
                       ${Boost_SYSTEM_LIBRARY}
                       ${Boost_LOCALE_LIBRARY}
                       ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY}
                       )
enable_testing ()
add_test (NAME MyTest COMMAND Test)


#enable_testing()
#add_test(MyTest test)
