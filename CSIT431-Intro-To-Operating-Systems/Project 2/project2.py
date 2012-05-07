#!/bin/python3

import sys

class Process:
    def __init__(self):
        self.name = ''
        self.entrytime = 0
        self.requiredtime = 0
class Processor:
    def __init__(self):
        self.processes = [] #List of processes scheduled to run
        self.queue = [] #List of processes currently running
        self.mode = 0 #SJF or FCFS or RR
        self.rrquantum = 0#Round robin time quatum
        self.time = 0 #How much time has passed
        self.rrtime = 0#Time left in roun robin time quantum before context switch
        self.contextFlag = 0 #Do we need to switch context?
        self.contextPenalty = 0 #Time penalty for switching context
        self.contextPenaltyTime = 0 #How much time left on the context penalty

    def readSchedule(self, path):
        try:
            f = open(path, 'r')
        except:
            print("Scheduling File Not Found!")
            printHelp()
        while True:
            line = f.readline()
            if not line:
                break
            process = Process()
            index1 = line.find(':')
            index2 = line.find(':', index1+1)
            process.name = line[:index1]
            process.entrytime = int(line[index1+1:index2])
            process.requiredtime = int(line[index2+1:])
            self.processes.append(process)

        print(str(len(self.processes)) + " processes found!")

    def tick(self):
        #Update Process Queue
        i = 0
        for each in self.processes:
            if self.time >= each.entrytime:
                self.queue.append(each)
                self.processes.pop(i)
                i += 1

        print("Time " + str(self.time) + ": ", end="")

        if(len(self.queue) > 0):
            #Run process or switch context
        
            if(self.mode == 0):
                self.SJF()
            if(self.mode == 1):
                self.FCFS()
            if(self.mode == 2):
                self.RR()
                
            if self.contextFlag == 1:
                print("Changing context")
                self.contextPenaltyTime -= 1
                while self.contextPenaltyTime > 0:
                    self.time += 1
                    print("Time " + str(self.time) + ": Changing context")
                    self.contextPenaltyTime -= 1
                self.contextPenaltyTime = self.contextPenalty
                self.contextFlag = 0
        else:
            if(len(self.processes) > 0):
                print("Waiting for a process to enter the queue")

        self.time += 1

        if len(self.processes) == 0 and len(self.queue) == 0:
            return 0#exit
        else:
            return 1

    def SJF(self):
        flag = 0
        if(self.queue[0].requiredtime == 0):
            self.queue.pop(0)
            self.contextFlag = 1
            i = 0
            for each in self.queue:
                if each.requiredtime < self.queue[0].requiredtime:
                    temp = self.queue.pop(i)
                    self.queue.insert(0, temp)
                i += 1
        else:
            i = 0
            for each in self.queue:
                if each.requiredtime < self.queue[0].requiredtime:
                    temp = self.queue.pop(i)
                    self.queue.insert(0, temp)
                    self.contextFlag = 1
                    flag = 1
                i += 1
            if flag == 0:
                print("Running process " + self.queue[0].name)
                self.queue[0].requiredtime -= 1

    def FCFS(self):
        if(self.queue[0].requiredtime == 0):
            self.queue.pop(0)
            self.contextFlag = 1
        else:
            self.queue[0].requiredtime -= 1
            print("Running process " + self.queue[0].name)

    def RR(self):
        if(self.queue[0].requiredtime == 0):
            self.queue.pop(0)
            self.rrtime = self.rrquantum
            self.contextFlag = 1
        if(self.rrtime == 0):
            self.rrtime = self.rrquantum
            if(len(self.queue) > 1):
                temp = self.queue.pop(0)
                self.queue.append(temp)
                self.contextFlag = 1
        if(self.rrtime > 0 and len(self.queue) > 0 and self.contextFlag == 0):
            self.rrtime -= 1
            try:
                self.queue[0].requiredtime -= 1
                print("Running process " + self.queue[0].name)
            except:
                self.contextFlag = 1
            
    

def printHelp():
    print("You ran this program inccorectly! Run this program as:")
    print("./project2.py pathtotextfile.txt scheduling context_penalty RRQuantum(optional)")
    print("pathtotextfile.txt is the path to the text file that details processes.")
    print("scheduling may be RR or SJF or FCFS")
    print("context_penalty must be an integer")
    print("if scheduling is RR then an integer RRQuantum must be provided")
    exit()

#Main
#Not enough arguments given
if(len(sys.argv) < 4):
    print("Not enough arguments given!")
    printHelp()
if(sys.argv[2] != 'RR' and sys.argv[2] != 'SJF' and sys.argv[2] != 'FCFS'):
    print("Invalid scheduling mode of operation given!")
    printHelp()
if(sys.argv[2] == 'RR' and not sys.argv[4]):
    print("No time quantum supplied for round robin scheduling!")
    printHelp()

processor = Processor()
processor.readSchedule(sys.argv[1])

if sys.argv[2] == 'SJF':
    processor.mode = 0
if sys.argv[2] == 'FCFS':
    processor.mode = 1
if sys.argv[2] == 'RR':
    processor.mode = 2
processor.contextPenalty = processor.contextPenaltyTime = int(sys.argv[3])
try:
    if sys.argv[4]:
        processor.rrquantum = int(sys.argv[4])
except:
    if processor.mode == 2:
        print("YOU NEED A ROUND ROBIN TIME QUANTUM!!!")
        printHelp()

while True:
    ret = processor.tick()
    if ret == 0:
        break

print("All processes have completed running")
    


