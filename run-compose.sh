#!/bin/bash


# from https://github.com/open-webui/open-webui
# Detect GPU driver
get_gpu_driver() {
    # Detect NVIDIA GPUs using lspci or nvidia-smi
    if lspci | grep -i nvidia >/dev/null || nvidia-smi >/dev/null 2>&1; then
        echo "nvidia"
        return
    fi

    # Detect AMD GPUs (including GCN architecture check for amdgpu vs radeon)
    if lspci | grep -i amd >/dev/null; then
        # List of known GCN and later architecture cards
        # This is a simplified list, and in a real-world scenario, you'd want a more comprehensive one
        local gcn_and_later=("Radeon HD 7000" "Radeon HD 8000" "Radeon R5" "Radeon R7" "Radeon R9" "Radeon RX")

        # Get GPU information
        local gpu_info=$(lspci | grep -i 'vga.*amd')

        for model in "${gcn_and_later[@]}"; do
            if echo "$gpu_info" | grep -iq "$model"; then
                echo "amdgpu"
                return
            fi
        done

        # Default to radeon if no GCN or later architecture is detected
        echo "radeon"
        return
    fi

    # Detect Intel GPUs
    if lspci | grep -i intel >/dev/null; then
        echo "i915"
        return
    fi

    # If no known GPU is detected
    echo "Unknown or unsupported GPU driver"
    exit 1
}


export GPU_DRIVER=$(get_gpu_driver)
echo "GPU DRIVER: $GPU_DRIVER"
docker compose up -d
