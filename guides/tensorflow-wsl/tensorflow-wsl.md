# Tensorflow in WSL

## Build with Bazel

<!--

```
--jobs=10 \
```

-->

```bash
bazel build \
--experimental_remote_cache_async \
--remote_download_outputs=minimal \
--discard_analysis_cache \
-c opt \
--config=monolithic \
--config=nogcp \
--config=nonccl \
--linkopt="-B/usr/bin" \
--linkopt="-fuse-ld=lld" \
--strip=always \
//tensorflow/lite/delegates/flex:tensorflowlite_flex
```

or (for aarch64):


``` bash
bazel build \
--experimental_remote_cache_async \
--remote_download_outputs=minimal \
--discard_analysis_cache \
-c opt \
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
