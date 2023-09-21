cmake_minimum_required(VERSION 3.14)
project(quickmwtest LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)
find_package(Qt6 COMPONENTS Quick)
find_package(Qt6 COMPONENTS ShaderTools)

qt_add_executable(quickmwtest
    main.cpp
)
target_link_libraries(quickmwtest PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Quick
)

qt6_add_resources(quickmwtest "quickmwtest_resources"
    PREFIX
        "/"
    FILES
        "screen.qml"
)
