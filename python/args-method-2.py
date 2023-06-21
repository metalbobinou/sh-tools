import os
import sys

# PREPARE FUNCTIONS :
def ZeroArg():
    print("No args at all.")
def OneArg():
    print("1 arg : " + sys.argv[0])
def TwoArgs():
    print("2 args : " + sys.argv[0] + " " + sys.argv[1])
def ThreeArgs():
    print("3 args : " + sys.argv[0] + " " + sys.argv[1] + " " + sys.argv[2])
def defaultArgs():
    print("Too much args")

# METHOD 2 : if/elseif/else (manage "default")
if (NBArgs == 1):
    OneArg()
else if (NBArgs == 2):
    TwoArgs()
else if (NBArgs == 3):
    ThreeArgs()
else:
    defaultArgs()


# sys.argv[0] : python script name
# sys.argv[1] : 1st arg
# sys.argv[2] : 2nd arg
def main():
    NBArgs = len(sys.argv);
#    print("NB Args : " + str(NBArgs))
#    for arg in sys.argv:
#        print(arg)

    if (NBArgs > 0):
        ArgsMgmt[NBArgs]()
    else:
        print("ERROR IN ARGS")
        exit(-1)
    exit(0)

main()
