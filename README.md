Simple crate with 13 dependencies with `git` sources for demonstrating the effectiveness of parallel source updates.

Run `./benchmark.sh` to reproduce

# Benchmarks
```
Starting "cargo update" benchmarks
Uncached, serial, cargo 1.91.0-nightly (840b83a10 2025-07-30):

real	0m18.497s
user	0m6.969s
sys	0m0.435s

Uncached, parallel:

real	0m6.372s
user	0m7.343s
sys	0m0.825s

Cached, serial, cargo 1.91.0-nightly (840b83a10 2025-07-30):

real	0m4.445s
user	0m0.707s
sys	0m0.101s

Cached, parallel:

real	0m1.036s
user	0m1.103s
sys	0m0.246s

Uncached, shallow, serial, cargo 1.91.0-nightly (840b83a10 2025-07-30):

real	0m9.295s
user	0m1.116s
sys	0m0.215s

Uncached, shallow, parallel:

real	0m1.521s
user	0m1.479s
sys	0m0.317s

```
