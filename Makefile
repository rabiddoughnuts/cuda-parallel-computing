NVCC ?= nvcc
NVCCFLAGS ?= -std=c++11 -O2
BUILD_DIR := build

DEFAULT_TARGETS := \
	$(BUILD_DIR)/matrix-addition \
	$(BUILD_DIR)/matrix-multiplication \
	$(BUILD_DIR)/tiled-matrix-multiplication \
	$(BUILD_DIR)/reduction \
	$(BUILD_DIR)/histogram

.PHONY: all clean

all: $(DEFAULT_TARGETS)

$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/matrix-addition: src/matrix_addition.cu | $(BUILD_DIR)
	$(NVCC) $(NVCCFLAGS) $< -o $@

$(BUILD_DIR)/matrix-multiplication: src/matrix_multiplication.cu | $(BUILD_DIR)
	$(NVCC) $(NVCCFLAGS) $< -o $@

$(BUILD_DIR)/tiled-matrix-multiplication: src/tiled_matrix_multiplication.cu | $(BUILD_DIR)
	$(NVCC) $(NVCCFLAGS) $< -o $@

$(BUILD_DIR)/reduction: src/reduction.cu | $(BUILD_DIR)
	$(NVCC) $(NVCCFLAGS) $< -o $@

$(BUILD_DIR)/prefix-sum-experimental: src/prefix_sum_experimental.cu | $(BUILD_DIR)
	$(NVCC) $(NVCCFLAGS) $< -o $@

$(BUILD_DIR)/histogram: src/histogram.cu | $(BUILD_DIR)
	$(NVCC) $(NVCCFLAGS) $< -o $@

clean:
	$(RM) -r $(BUILD_DIR)
