#include <cuda_runtime.h>

__global__ void matmul_kernel(const float* A, const float* B, float* C, int M, int N, int K) {
    // Write code here
    int j =blockIdx.x * blockDim.x + threadIdx.x;
    int i =blockIdx.y * blockDim.y + threadIdx.y;
    float acc = 0.0f;

    if (i >= M || j >= N) {
    return;
    }
    
    for (int k = 0; k < K; k++){
        acc += A[i*K + k] * B[k*N + j];
    }
    
    C[i * N + j] = acc;

}

extern "C" void solve(const float* A, const float* B, float* C, int M, int N, int K) {
    dim3 threads(16, 16);
    dim3 blocks((N + 15) / 16, (M + 15) / 16);
    matmul_kernel<<<blocks, threads>>>(A, B, C, M, N, K);
    cudaDeviceSynchronize();
}
