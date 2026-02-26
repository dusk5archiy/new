# Tensorflow in WSL

## Build with Bazel

```
--notrack_incremental_state \
--nokeep_state_after_build \
```

```bash
bazel build -c opt --jobs=5 --config=monolithic --local_resources=memory=2048 //tensorflow/lite/delegates/flex:tensorflowlite_flex
# or
bazel build \
--experimental_remote_cache_async \
--remote_download_outputs=minimal \
--discard_analysis_cache \
-c opt \
--jobs=4 \
--config=monolithic \
--config=nogcp \
--config=nonccl \
--config=elinux_aarch64 \
--linkopt="-B/usr/bin" \
--linkopt="-fuse-ld=lld" \
--strip=always \
//tensorflow/lite/delegates/flex:tensorflowlite_flex
```

Prepare openssl:

```bash
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install openssl
brew install openssl
```
