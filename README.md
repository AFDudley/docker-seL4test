# build environment
docker build -t sel4test .

# build binaries
docker run -ti -v $PWD/images:/seL4test/images sel4test /bin/bash -c "cd /seL4test; make ia32_simulation_release_xml_defconfig; make"

# test binaries
docker run -ti -v $PWD/images:/seL4test/images sel4test /bin/bash -c "cd /seL4test; make simulate-ia32"