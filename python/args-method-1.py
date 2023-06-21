import os
import sys

# METHOD 1 : (do not manage "default")

# SWITCH/CASE WITHOUT DEFAULT
# PREPARE CASES FIRST :
def ZeroArg():
    print("No args at all.")
def OneArg():
    print("1 arg : " + sys.argv[0])
def TwoArgs():
    print("2 args : " + sys.argv[0] + " " + sys.argv[1])
def ThreeArgs():
    print("3 args : " + sys.argv[0] + " " + sys.argv[1] + " " + sys.argv[2])


# PREPARE SWITCH
ArgsMgmt = { 0 : ZeroArg,
             1 : OneArg,
             2 : TwoArgs,
             3 : ThreeArgs,
}

# CALL SWITCH/CASE :
#NBArgs = len(sys.argv);
#ArgsMgmt[NBArgs]()


# sys.argv[0] : python script name
# sys.argv[1] : 1st arg
# sys.argv[2] : 2nd arg
def main():
    NBArgs = len(sys.argv);
#    print("NB Args : " + str(NBArgs))
#    for arg in sys.argv:
#        print(arg)

    if ((NBArgs > 0) and (NBArgs <= max(ArgsMgmt))):
        ArgsMgmt[NBArgs]()
    else:
        print("ERROR IN ARGS : Too much args")
        exit(-1)
    exit(0)

main()
