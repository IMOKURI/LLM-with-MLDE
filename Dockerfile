FROM huggingface/transformers-pytorch-deepspeed-latest-gpu:latest

ARG PROXY

ENV http_proxy=$PROXY \
    https_proxy=$PROXY

RUN apt-get update && \
    apt-get install -y daemontools

RUN pip install --no-cache -U \
    accelerate \
    auto-gptq \
    bitsandbytes \
    determined \
    optimum \
    peft \
    protobuf==3.20.* \
    tensorboard-plugin-profile \
    torch-tb-profiler \
    wandb

