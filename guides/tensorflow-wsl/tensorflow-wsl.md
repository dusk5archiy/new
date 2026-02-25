# Tensorflow in WSL

## Build with Bazel

```bash
bazel build -c opt --config=monolithic --local_resources=memory=2048 //tensorflow/lite/delegates/flex:tensorflowlite_flex
# or
bazel build -c opt --config=monolithic --config=elinux_aarch64 --local_resources=memmory=2048 //tensorflow/lite/delegates/flex:tensorflowlite_flex
```
