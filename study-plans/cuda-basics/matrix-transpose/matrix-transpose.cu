#include <cuda_runtime.h>

__global__ void matrix_transpose_kernel(const float* A, float* B, int M, int N) {
    // Write code here
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int indexy = (i * N) + j;
    int indexx = (j * M) + i;
    
    if (i < M && j < N) B[indexx] = A[indexy];
    
}

extern "C" void solve(const float* A, float* B, int M, int N) {
    dim3 threads(16, 16);
    dim3 blocks((N + 15) / 16, (M + 15) / 16);
    matrix_transpose_kernel<<<blocks, threads>>>(A, B, M, N);
    cudaDeviceSynchronize();
}
