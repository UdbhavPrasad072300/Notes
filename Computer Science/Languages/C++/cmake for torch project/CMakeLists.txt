# CMakeList.txt : CMake project for cpppractice, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project("MNIST_PyTorch_CPP")

find_package(Torch REQUIRED)

# Add source to this project's executable.
add_executable (MNIST_PyTorch_CPP "main.cpp")

target_link_libraries(MNIST_PyTorch_CPP "${TORCH_LIBRARIES}")
set_property(TARGET MNIST_PyTorch_CPP PROPERTY CXX_STANDARD 14)

if (MSVC)
  file(GLOB TORCH_DLLS "${TORCH_INSTALL_PREFIX}/lib/*.dll")
  add_custom_command(TARGET MNIST_PyTorch_CPP
                     POST_BUILD
                     COMMAND ${CMAKE_COMMAND} -E copy_if_different
                     ${TORCH_DLLS}
                     $<TARGET_FILE_DIR:MNIST_PyTorch_CPP>)
endif (MSVC)

# TODO: Add tests and install targets if needed.
