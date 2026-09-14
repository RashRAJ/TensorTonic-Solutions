#include <cuda_runtime.h>

__global__ void matrix_add_kernel(const float* A, const float* B, float* C, int M, int N) {
    // Write code here
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j =  blockIdx.x * blockDim.x + threadIdx.x;
    // stuff here means the the flatten out 2d array index
    int stuff = (i * N ) + j; 
    if (i < M && j < N) C[stuff] = A[stuff] + B[stuff];
    
}

extern "C" void solve(const float* A, const float* B, float* C, int M, int N) {
    dim3 threads(16, 16);
    dim3 blocks((N + 15) / 16, (M + 15) / 16);
    matrix_add_kernel<<<blocks, threads>>>(A, B, C, M, N);
    cudaDeviceSynchronize();
}
