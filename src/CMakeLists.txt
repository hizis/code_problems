
add_library (
        code_problems_lib
        Example.h Example.cpp
    )
add_executable (code_problems main.cpp)

target_link_libraries (code_problems 
    code_problems_lib    
    ${Boost_SYSTEM_LIBRARY}
    ${Boost_PROGRAM_OPTIONS_LIBRARY}
    ${Boost_LOCALE_LIBRARY}    
    ${Boost_THREAD_LIBRARY} 
    )

#add_executable (main main.cpp)
#target_link_libraries (mail_example Sqr)