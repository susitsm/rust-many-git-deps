Simple crate with 13 dependencies with `git` sources for demonstrating the effectiveness of parallel source updates.

Run `./benchmark.sh` to reproduce

# Benchmarks
```
Starting "cargo update" benchmarks
Uncached, serial, cargo 1.91.0-nightly (840b83a10 2025-07-30):

real	0m22.676s
user	0m10.982s
sys	0m0.448s

Uncached, parallel:

real	0m8.537s
user	0m12.055s
sys	0m1.004s

Cached, serial, cargo 1.91.0-nightly (840b83a10 2025-07-30):

real	0m5.272s
user	0m1.027s
sys	0m0.161s

Cached, parallel:

real	0m1.757s
user	0m1.897s
sys	0m0.358s

```
