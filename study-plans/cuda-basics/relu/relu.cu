#include <cuda_runtime.h>

__global__ void relu_kernel(const float* input, float* output, int N) {
    // Write code here
    float z = 0;
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) output[i] = max(start, input[i]);
}

extern "C" void solve(const float* input, float* output, int N) {
    int threads = 256;
    int blocks = (N + threads - 1) / threads;
    relu_kernel<<<blocks, threads>>>(input, output, N);
    cudaDeviceSynchronize();
}