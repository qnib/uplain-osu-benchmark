ARG SRC_IMG=uplain-mpich
FROM qnib/${SRC_IMG}

ARG OSU_MPIBENCH_VER=5.6.2
ARG OSU_URL=http://mvapich.cse.ohio-state.edu/download/mvapich

RUN mkdir -p /opt/osu-micro-benchmarks \
 && wget -qO - ${OSU_URL}/osu-micro-benchmarks-${OSU_MPIBENCH_VER}.tar.gz | tar xfz - -C /opt/osu-micro-benchmarks --strip-components=1 \
 && cd /opt/osu-micro-benchmarks \
 && ./configure CC=mpicc CXX=mpicxx \
 && make \
 && make install \
 && rm -rf /opt/osu-micro-benchmarks
WORKDIR /usr/local/libexec/osu-micro-benchmarks/mpi/pt2pt/