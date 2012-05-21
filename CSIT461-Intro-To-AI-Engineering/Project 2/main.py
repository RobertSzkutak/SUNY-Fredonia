#!/bin/python3

#This was built and tested under Python 3.2.2

#Database stores each type of disease found and the statistics of each syptom for that disease
class Database:
    def __init__(self):
        self.diseases = []

    def readDatabase(self, path):
        data = ""
        try:
            data = open('formatted_training.txt', 'r')
        except:#Formatted Data Not Found
            formatted = open(path, 'r')
            print("Formatting Data...")
            while True:
                line = formatted.readline()
                if not line:
                   break
                if(line[:7] == "Patient"):
                   print(line)
                if(line != "\n"):
                    data += line
                else:
                    print("Line killed!")
            formatted.close()
            formatted = open('formatted_training.txt', 'w')
            formatted.write(data)
            formatted.close()
            data = open('formatted_training.txt', 'r')

        while True:
            #Patient ID
            print(data.readline(), "")
            #Diagnosis
            diagnosis = data.readline()
            #Fever
            feverline = data.readline()
            if not feverline:#Redundant? Sure. But this saves puppies.
                break
            fever = int(feverline)
            #Pain
            pain = self.evaluate(data.readline())
            #Nausea
            nausea = self.evaluate(data.readline())
            #Neurological Symptoms
            neurological = self.evaluate(data.readline())
            #Chills
            chills = self.evaluate(data.readline())
            #Wound
            wound = self.evaluate(data.readline())
            #print(wound)
            #Jaundice
            jaundice = self.evaluate(data.readline())
            #Malaise
            malaise = self.evaluate(data.readline())
            #Weakness
            lastline = data.readline()
            weakness = self.evaluate(lastline)
            if not lastline:
                break

            found = 0
            if(len(self.diseases) > 0):
                for i in self.diseases:
                    if(i.name == diagnosis):
                        i.addTestCase(fever, pain, nausea, neurological, chills, wound, jaundice, malaise, weakness)
                        found = 1
                        break
            if(found < 1):
                disease = Disease()
                disease.name = diagnosis
                disease.addTestCase(fever, pain, nausea, neurological, chills, wound, jaundice, malaise, weakness)
                self.diseases.append(disease)
            
        data.close()

    #Returns a 1 if symptom exists, 0 if no, -1 if blank
    def evaluate(self, symptom):
        if(symptom[:2] == 'No'):
            return 0
        elif(symptom[:5] == 'BLANK'):
            return -1
        else:
            return 1
        return -1

    def buildStats(self):
        write = open('training_results.txt', 'w')
        for i in self.diseases:
            i.buildStats()
            write.write(i.name + '\n')
            write.write(str(i.nofever) + '\n')
            write.write(str(i.lowfever) + '\n')
            write.write(str(i.highfever) + '\n')
            write.write(str(i.pain) + '\n')
            write.write(str(i.nopain) + '\n')
            write.write(str(i.nausea) + '\n')
            write.write(str(i.nonausea) + '\n')
            write.write(str(i.neurological) + '\n')
            write.write(str(i.noneurological) + '\n')
            write.write(str(i.chills) + '\n')
            write.write(str(i.nochills) + '\n')
            write.write(str(i.wound) + '\n')
            write.write(str(i.nowound) + '\n')
            write.write(str(i.jaundice) + '\n')
            write.write(str(i.nojaundice) + '\n')
            write.write(str(i.malaise) + '\n')
            write.write(str(i.nomalaise) + '\n')
            write.write(str(i.weakness) + '\n')
            write.write(str(i.noweakness) + '\n')
            write.write(str(i.testcases) + '\n')
            write.write(str(i.nofeverstat) + '\n')
            write.write(str(i.lowfeverstat) + '\n')
            write.write(str(i.highfeverstat) + '\n')
            write.write(str(i.painstat) + '\n')
            write.write(str(i.nopainstat) + '\n')
            write.write(str(i.nauseastat) + '\n')
            write.write(str(i.nonauseastat) + '\n')
            write.write(str(i.neurologicalstat) + '\n')
            write.write(str(i.noneurologicalstat) + '\n')
            write.write(str(i.chillsstat) + '\n')
            write.write(str(i.nochillsstat) + '\n')
            write.write(str(i.woundstat) + '\n')
            write.write(str(i.nowoundstat) + '\n')
            write.write(str(i.jaundicestat) + '\n')
            write.write(str(i.nojaundicestat) + '\n')
            write.write(str(i.malaisestat) + '\n')
            write.write(str(i.nomalaisestat) + '\n')
            write.write(str(i.weaknessstat) + '\n')
            write.write(str(i.noweaknessstat) + '\n')
        write.close()

    def printStats(self):
        for i in self.diseases:
            i.printStats()

    def findDiagnosis(self, fever, pain, nausea, neurological, chills, wound, jaundice, malaise, weakness):
        finscore = 0
        finname = ""
        for each in self.diseases:
            score = 0
            if fever < 99 and each.nofeverstat >= 0.45:
               score += 1 
            if fever >= 99 and fever <= 101 and each.lowfeverstat >= 0.45:
                score += 1
            if fever >= 102 and each.highfeverstat >= 0.45:
                score += 1
            if pain > 0 and each.painstat >= 0.45:
                score += 1
            if pain == 0 and each.nopainstat >= 0.45:
                score += 1
            if nausea == 1 and each.nauseastat >= 0.45:
                score += 1
            if nausea == 0 and each.nonauseastat >= 0.45:
                score += 1
            if neurological == 1 and each.neurologicalstat >= 0.45:
                score += 1
            if neurological == 0 and each.noneurologicalstat >= 0.45:
                score += 1
            if chills == 1 and each.chillsstat >= 0.45:
                score += 1
            if chills == 0 and each.nochillsstat >= 0.45:
                score += 1
            if wound == 1 and each.woundstat >= 0.45:
                score += 1
            if wound == 0 and each.nowoundstat >= 0.45:
                score += 1
            if jaundice == 1 and each.jaundicestat >= 0.45:
                score += 1
            if jaundice == 0 and each.nojaundicestat >= 0.45:
                score += 1
            if malaise == 1 and each.malaisestat >= 0.45:
                score += 1
            if malaise == 0 and each.nomalaisestat >= 0.45:
                score += 1
            if weakness == 1 and each.weaknessstat >= 0.45:
                score += 1
            if weakness == 0 and each.noweaknessstat >= 0.45:
                score += 1

            if score > finscore:
                finscore = score
                finname = each.name

        return finname
        

#Disease stores the statistics for a particular type of disease
class Disease:
    def __init__(self):
        #Raw data
        self.name = ''
        self.nofever = 0
        self.lowfever = 0
        self.highfever = 0
        self.pain = 0
        self.nopain = 0
        self.nausea = 0
        self.nonausea = 0
        self.neurological = 0
        self.noneurological = 0
        self.chills = 0
        self.nochills = 0
        self.wound = 0
        self.nowound = 0
        self.jaundice = 0
        self.nojaundice = 0
        self.malaise = 0
        self.nomalaise = 0
        self.weakness = 0
        self.noweakness = 0
        self.testcases = 0

        #Probability Statistics
        self.nofeverstat = 0
        self.lowfeverstat = 0
        self.highfeverstat = 0
        self.painstat = 0
        self.nopainstat = 0
        self.nauseastat = 0
        self.nonauseastat = 0
        self.neurologicalstat = 0
        self.noneurologicalstat = 0
        self.chillsstat = 0
        self.nochillsstat = 0
        self.woundstat = 0
        self.nowoundstat = 0
        self.jaundicestat = 0
        self.nojaundicestat = 0
        self.malaisestat = 0
        self.nomalaisestat = 0
        self.weaknessstat = 0
        self.noweaknessstat = 0

    def addTestCase(self, fever, pain, nausea, neurological, chills, wound, jaundice, malaise, weakness):
        self.testcases += 1
        
        #No fever
        if(fever <= 98):
            self.nofever += 1
        #Low fever
        if(fever >= 99 and fever <= 101):
            self.lowfever += 1
        #High fever
        if(fever > 101):
            self.highfever += 1

        if(pain > 0):
            self.pain += 1
        elif(pain == 0):
            self.nopain += 1

        if(nausea > 0):
            self.nausea += 1
        elif(nausea == 0):
            self.nausea += 1

        if(neurological > 0):
            self.neurological += 1
        elif(neurological == 0):
            self.noneurological += 1

        if(chills > 0):
            self.chills += 1
        elif(chills == 0):
            self.nochills += 1

        if(wound > 0):
            self.wound += 1
        elif(wound == 0):
            self.nowound += 1

        if(jaundice > 0):
            self.jaundice += 1
        elif(jaundice == 0):
            self.nojaundice += 1

        if(malaise > 0):
            self.malaise += 1
        elif(malaise == 0):
            self.nomalaise += 1

        if(weakness > 0):
            self.weakness += 1
        elif(weakness == 0):
            self.weakness += 1

    def buildStats(self):
        #The conditionals prevent division by 0
        self.nofeverstat = self.nofever / self.testcases
        self.lowfeverstat = self.lowfever / self.testcases
        self.highfeverstat = self.highfever / self.testcases
        if self.pain > 0 or self.nopain > 0:
            self.painstat = self.pain / (self.pain + self.nopain)
            self.nopainstat = self.nopain / (self.pain + self.nopain)
        if self.nausea > 0 or self.nonausea > 0:
            self.nauseastat = self.nausea / (self.nausea + self.nonausea)
            self.nonauseastat = self.nonausea / (self.nausea + self.nonausea)
        if self.neurological > 0 or self.noneurological > 0:
            self.neurologicalstat = self.neurological / (self.neurological + self.noneurological)
            self.noneurologicalstat = self.noneurological / (self.neurological + self.noneurological)
        if self.chills > 0 or self.nochills > 0:
            self.chillsstat = self.chills / (self.chills + self.nochills)
            self.nochillsstat = self.nochills / (self.chills + self.nochills)
        if self.wound > 0 or self.nowound > 0:
            self.woundstat = self.wound / (self.wound + self.nowound)
            self.nowoundstat = self.nowound / (self.wound + self.nowound)
        if self.jaundice > 0 or self.nojaundice > 0:
            self.jaundicestat = self.jaundice / (self.jaundice + self.nojaundice)
            self.nojaundicestat = self.nojaundice / (self.jaundice + self.nojaundice)
        if self.malaise > 0 or self.nomalaise > 0:
            self.malaisestat = self.malaise / (self.malaise + self.nomalaise)
            self.nomalaisestat = self.nomalaise / (self.malaise + self.nomalaise)
        if self.weakness > 0 or self.noweakness > 0:
            self.weaknessstat = self.weakness / (self.weakness + self.noweakness)
            self.noweaknessstat = self.noweakness / (self.weakness + self.noweakness)

    def printStats(self):
        print("\n\n" + self.name)
        print("No Fever: " + str(self.nofever))
        print("Low Fever: " + str(self.lowfever))
        print("High Fever: " + str(self.highfever))
        print("Pain: " + str(self.pain))
        print("No Pain: " + str(self.nopain))
        print("Nausea: " + str(self.nausea))
        print("No Nausea: " + str(self.nonausea))
        print("Neurological: " + str(self.neurological))
        print("No Neurological: " + str(self.noneurological))
        print("Chills: " + str(self.chills))
        print("No Chills: " + str(self.nochills))
        print("Wound: " + str(self.wound))
        print("No Wound: " + str(self.nowound))
        print("Jaundice: " + str(self.jaundice))
        print("No Jaundice: " + str(self.nojaundice))
        print("Malaise: " + str(self.malaise))
        print("No Malaise: " + str(self.nomalaise))
        print("Weakness: " + str(self.weakness))
        print("No Weakness: " + str(self.noweakness))
        print("Statistics:")
        print("No Fever: " + str(self.nofeverstat))
        print("Low Fever: " + str(self.lowfeverstat))
        print("High Fever: " + str(self.highfeverstat))
        print("Pain: " + str(self.painstat))
        print("No Pain: " + str(self.nopainstat))
        print("Nausea: " + str(self.nauseastat))
        print("No Nausea: " + str(self.nonauseastat))
        print("Neurological: " + str(self.neurologicalstat))
        print("No Neurological: " + str(self.noneurologicalstat))
        print("Chills: " + str(self.chillsstat))
        print("No Chills: " + str(self.nochillsstat))
        print("Wound: " + str(self.woundstat))
        print("No Wound: " + str(self.nowoundstat))
        print("Jaundice: " + str(self.jaundicestat))
        print("No Jaundice: " + str(self.nojaundicestat))
        print("Malaise: " + str(self.malaisestat))
        print("No Malaise: " + str(self.nomalaisestat))
        print("Weakness: " + str(self.weaknessstat))
        print("No Weakness: " + str(self.noweaknessstat))
        
#Main
#Build database from training data
database = Database()
flag = 0
try:
    f = open('training_results.txt', 'r')
    flag = 1
except:
    #f.close()
    print("Reading training data...\n")
    database.readDatabase("training.txt")
    print("Building training data statistics...\n")
    database.buildStats()
    print("Database Statistics:")
    database.printStats()

if flag == 1:
    while True:
        disease = Disease()
        disease.name = f.readline()
        print(disease.name)
        if not disease.name:
            break
        f.readline()#blank \n
        line = f.readline()
        if not line:
            break
        disease.nofever = int(line)
        disease.lowfever = int(f.readline())
        disease.highfever = int(f.readline())
        disease.pain = int(f.readline())
        disease.nopain = int(f.readline())
        disease.nausea = int(f.readline())
        disease.nonausea = int(f.readline())
        disease.neurological = int(f.readline())
        disease.noneurological = int(f.readline())
        disease.chills = int(f.readline())
        disease.nochills = int(f.readline())
        disease.wound = int(f.readline())
        disease.nowound = int(f.readline())
        disease.jaundice = int(f.readline())
        disease.nojaundice = int(f.readline())
        disease.malaise = int(f.readline())
        disease.nomalaise = int(f.readline())
        disease.weakness = int(f.readline())
        disease.noweakness = int(f.readline())
        disease.testcases = int(f.readline())
        disease.nofeverstat = float(f.readline())
        disease.lowfeverstat = float(f.readline())
        disease.highfeverstat = float(f.readline())
        disease.painstatfloat = float(f.readline())
        disease.nopainstatfloat = float(f.readline())
        disease.nauseastat = float(f.readline())
        disease.nonauseastat = float(f.readline())
        disease.neurologicalstat = float(f.readline())
        disease.noneurologicalstat = float(f.readline())
        disease.chillsstat = float(f.readline())
        disease.nochillsstat = float(f.readline())
        disease.woundstat = float(f.readline())
        disease.nowoundstat = float(f.readline())
        disease.jaundicestat = float(f.readline())
        disease.nojaundicestat = float(f.readline())
        disease.malaisestat = float(f.readline())
        disease.nomalaisestat = float(f.readline())
        disease.weaknessstat = float(f.readline())
        disease.noweaknessstat = float(f.readline())
        database.diseases.append(disease)
    f.close()

database.printStats()
    
try:
    f = open('formatted_testing.txt', 'r')
except:
    f = open('testing.txt', 'r')
    print("Formatting Testing Data...")
    data=""
    while True:
        line = f.readline()
        if not line:
            break
        if(line[:7] == "Patient"):
            print(line)
        if(line != "\n"):
            data += line
        else:
            print("Line killed!")
    f.close()
    f = open('formatted_testing.txt', 'w')
    f.write(data)
    f.close()
    f = open('formatted_testing.txt', 'r')

correct = 0
incorrect = 0

print("Computing testing data...")

while True:
    #Patient ID
    print(f.readline(), "")
    #Diagnosis
    diagnosis = f.readline()
    #Fever
    feverline = f.readline()
    if not feverline:
        break
    fever = int(feverline)
    #Pain
    pain = database.evaluate(f.readline())
    #Nausea
    nausea = database.evaluate(f.readline())
    #Neurological Symptoms
    neurological = database.evaluate(f.readline())
    #Chills
    chills = database.evaluate(f.readline())
    #Wound
    wound = database.evaluate(f.readline())
    #Jaundice
    jaundice = database.evaluate(f.readline())
    #Malaise
    malaise = database.evaluate(f.readline())
    #Weakness
    lastline = f.readline()
    weakness = database.evaluate(lastline)
    if not lastline:
        break
    result = database.findDiagnosis(fever, pain, nausea, neurological, chills, wound, jaundice, malaise, weakness)
    if diagnosis == result:
        print("Correct")
        correct += 1
    else:
        print("Answer: " + diagnosis + " " + "Guess: " + result)
        incorrect += 1
f.close()

print("Writing results....")

f = open('results.txt', 'w')
f.write('Correct: ' + str(correct) + '\n')
f.write('Incorrect: ' + str(incorrect) + '\n')
f.write('Percentage Correct: ' + str(correct/(correct+incorrect)*100))
f.close()

print("ALL DONE! HOORAY! See results in results.txt")
