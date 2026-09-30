# CUDA Parallel-Computing Portfolio

Six CUDA C/C++ implementations developed for Wright State University's CS 4370, Parallel Programming for Many-Core GPUs. The programs compare CPU and GPU execution, report timing, and perform result checks.

## Included Work

| Program | CUDA technique | Current status |
|---|---|---|
| Matrix addition | 2-D grid with bounds checks | CPU/GPU comparison included |
| Matrix multiplication | Direct global-memory kernel | CPU/GPU comparison included |
| Tiled matrix multiplication | Dynamic shared-memory tiles and synchronization | CPU/GPU comparison included |
| Reduction | Iterative shared-memory reduction | Historical results retained; rerun required |
| Prefix sum | Per-block scan and block-sum propagation | Experimental; historically correct only at the smallest tested size |
| Histogram | Global atomics versus per-block shared histograms | CPU/global/shared comparison included |

## Build

Requirements: NVIDIA GPU, compatible driver, CUDA toolkit, and `nvcc`.

```bash
make
./build/tiled-matrix-multiplication
./build/histogram
```

The prefix-sum target is not part of the default build because its documented multi-block limitation still needs correction. Build it explicitly with `make build/prefix-sum-experimental`.

## Historical Results

- 1024×1024 tiled matrix multiplication: approximately 6 s CPU versus 13 ms GPU.
- Reduction at 16,777,216 elements: approximately 42 ms CPU versus 2.8 ms kernel time plus 7.5 ms transfer time.
- Histogram at 1,048,576 elements: approximately 2.19 ms CPU, 0.61 ms global-memory GPU, and 0.20 ms shared-memory GPU before reported transfer overhead.

These course-report observations came from university NVIDIA P100 nodes. They are not controlled cross-platform benchmarks and should be regenerated before being used as current performance claims.

## Attribution and Boundary

Brandon Walker authored the implementations for coursework taught by Meilin Liu in Fall 2024. The showcase excludes assignment prompts, executables, screenshots, editor state, and duplicate office documents. No reuse license has been selected; the source is available for inspection and portfolio review.
