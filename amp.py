import os
import sys


pxd = "pxd/pxd892993976850884659" # format as seen in /proc/diskstats
dsk = [ "xvdf", "xvdg", "xvdh" ] # backing disks
tests = [ "0", "256", "128", "64", "32", "16", "8", "4", "2", "1" ]  # fsync=...
bs = "64k"
filename = "/mnt/test.1"
size="10G"
fio="fio --blocksize=" + bs + " --filename=" + filename + " --gtod_reduce=1 --ioengine=libaio --readwrite=write --size=" + size + " --name=test --direct=1 --iodepth=128 --end_fsync=1 --fsync="

one = {}
two = {}

log=open("amp.txt", "w")

for fsync in tests:
    one.clear()
    two.clear()

    os.system("sync")

    d=open("/proc/sys/vm/drop_caches", "w")
    d.writelines("3")
    d.close()

    diskstats=open("/proc/diskstats", "r")

    for line in diskstats:
        col=line.split()
        if(int(col[9])):
            one[col[2]]=int(col[9])

    os.system(fio + fsync)

    sys.stdout.flush()

    diskstats.seek(0)

    for line in diskstats:
        col=line.split()
        if(int(col[9])):
            two[col[2]]=int(col[9])

    diskstats.close()

    print "Write Amplification Stats Fsync=" + fsync
    print fio + fsync

    for key, val in two.items():
        print("%25s = %7d MB" % (key, (val-one[key])*512/1024/1024 ) )

    sys.stdout.flush()

    dsksum=0
    for key in dsk:
        dsksum=dsksum+(two[key]-one[key])

    pxdiff=two[pxd]-one[pxd]

    log.write("Fsync=" + fsync )
    log.write(" DskNo=" + str(len(dsk)))
    log.write(" ReqWr=" + size + "B")
    log.write(" PxdWr=" + str(pxdiff*512/1024/1024/1024) + "GB")
    log.write(" DskWr=" + str(dsksum*512/1024/1024/1024) + "GB" )
    log.write(" Ampl={0:.2f}%".format(100 * float(dsksum-pxdiff)/float(pxdiff)) )
    log.write("\n")
    log.flush()

log.close()
