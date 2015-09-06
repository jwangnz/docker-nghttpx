# How to use this image

```console
$ docker run --name nghttpx-server -p 443:443 -v /path/to/nghttpx.conf:/nghttpx.conf:ro -d tsing/nghttpx --conf /nghttpx.conf
```
