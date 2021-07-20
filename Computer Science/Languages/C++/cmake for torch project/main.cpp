#include <torch/torch.h>
#include <iostream>


int main(int argc, char** argv) {
	std::cout << "LibTorch Test\n" << std::endl;

	// DEVICE
	
	auto cuda_available = torch::cuda::is_available();
	torch::Device device(cuda_available ? torch::kCUDA : torch::kCPU);
	std::cout << (cuda_available ? "GPU being Used" : "CPU being Used") << '\n' << std::endl;

	torch::Tensor tensor = torch::rand({ 2, 3 }, torch::kCUDA);
	std::cout << tensor << std::endl;
}
