# 关于在运行OpenCL相关的测试用例，需要先sync https://wiki.nvidia.com/nvcompute/index.php/NVCompute/NVIDIAOpenCL/Building_conformance
# 界面上的Perforce Client Spec部分， 然后执行下面的部分安装OpenCL相关的东西。
# 在Ubuntu上测试过
# download/extract OpenCL SDK Samples package, and compile the sample executables
mkdir -p /home/kerry/kerry_ws/OpenCL/
cd /home/kerry/kerry_ws/OpenCL/
rm -rf *
wget --user=swqa --password=test http://10.19.193.206/teslaswqash_manual/members/jeff/devrel_jeff.tar
tar -xvf devrel_jeff.tar
cd /home/kerry/kerry_ws/OpenCL/devrel/SDK10/Compute/OpenCL/
make clobber
make -j 10
# if libOpenCL not found
sudo cp -rfPv /usr/lib64/nvidia/libOpenCL.so* /usr/lib64/
# if has make error, please try to soft link in ubuntu as below
sudo ln -s /usr/lib/x86_64-linux-gnu/libOpenCL.so.1 /usr/lib/x86_64-linux-gnu/libOpenCL.so

cd /home/kerry/kerry_ws/OpenCL/devrel/SDK10/Compute/OpenCL/bin/linux/release/

# 运行case: conformance_1.2中的（Run conformance_1.2 nightly test on x86 platform）在make release时报错时，可参考：
# 运行时间较长
# https://wiki.nvidia.com/nvcompute/index.php/NVCompute/NVIDIAOpenCL/Building_conformance
