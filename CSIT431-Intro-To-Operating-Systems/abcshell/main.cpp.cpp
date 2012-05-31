//Written by Robert Szkutak

#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <vector>

//Which operating system we're using
#define LINUX 1
#undef WINDOWS

//Make sure constants are properly defined
#if ( !LINUX && !WINDOWS ) || ( LINUX > 0 && WINDOWS > 0 )
    #error Please define which operating system you are compiling the shell for
#endif

#ifdef LINUX
    #include <unistd.h>
    #include <sys/wait.h>
#endif

#ifdef WINDOWS
    #include <msclr\/marshal_cppstd.h>
    #using <mscorlib.dll>
    #using <System.dll>
    using namespace System;
    using namespace System::Diagnostics;
    using namespace System::ComponentModel;
    using namespace msclr::interop;
#endif

#undef DEBUG
#define HISTORY 10 //How much command history we save

#ifndef HISTORY
    #define HISTORY 1
#endif

class ABCShell
{

    public:
        ABCShell();
        ~ABCShell();
        void initialize();
        bool waitForCommand();
    private:
        void processCommand(std::string command);
        void pushHistory(std::string command);
        void printHistory();
        std::string history[HISTORY];
        std::string path;

};

ABCShell::ABCShell()
{
    initialize();
}

ABCShell::~ABCShell()
{

}

void ABCShell::initialize()
{
    for(int i = 0; i < HISTORY; i++)
        history[i] = "";

    #ifdef LINUX
        path = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games";
    #endif
    #ifdef WINDOWS
        path = "C:\Windows\System32";
    #endif
}

bool ABCShell::waitForCommand()
{
    std::string command = "";
    
    std::cout << "abc$ ";
    getline(std::cin,command);

    if(command == "exit")
        return false;
    else
        processCommand(command);
    return true;
}

void ABCShell::pushHistory(std::string command)
{
    for(int i = HISTORY-1; i > 0; i--)
        history[i] = history[i-1];
    history[0] = command;
}

void ABCShell::printHistory()
{
    for(int i = HISTORY-1; i >= 0; i--)
        if(history[i] != "")
            std::cout << std::endl << history[i];
        std::cout << std::endl;
}

void ABCShell::processCommand(std::string command)
{
    //Push command on the history stack
    pushHistory(command);

    if(command == "history")
        printHistory();
    else if(command.find("path") == 0 && command.length() > 4)
    {
        path = command.substr(5, command.length()-5);
    }
    else if(command.find("path") == 0 && command.length() == 4)
    {
        std::cout << path << std::endl;
    }
    else
    {
    #ifdef LINUX
            int child, childStatus;

            if((child = fork())==0)
            {    
    #endif

    #ifdef WINDOWS
            Process myprocess;
	        ProcessStartInfo^ proc1 = new ProcessStartInfo;
    #endif

                size_t i=-1, l=0, s=0;
                std::vector<std::string> args;
                std::string arg_final[5];
                for(int i = 0; i < 5; i++)
                    arg_final[i] = "";
                int count = 0;
                do 
                {
                    i = command.find(" ", i+1);
                    if ( i == std::string::npos )
                        s = std::string::npos;
                    else
                        s = i - l;
                    args.push_back(command.substr(l, s));
                    l = i + 1;
                    #ifdef DEBUG
                        std::cout << args.back() << std::endl;
                    #endif
                    arg_final[count] = args.back();
                    count++;
                } while ( i != std::string::npos );

                #ifdef DEBUG
                    for(int i = 0; i < 5; i++)
                        std::cout << arg_final[i] << std::endl;
                #endif

                //Parse for abcshell commands

                //List all
                if(arg_final[0] == "a")
                {
                    arg_final[4] = arg_final[3];
                    arg_final[3] = arg_final[2];

                    arg_final[0] = "ls";
                    arg_final[1] = "-l";
                    arg_final[2] = "-a";
                    if(count == 1)
                        count = 3;
                    else
                        count += 3;
                }
                //Concatenate
                else if(arg_final[0] == "c")
                {
                    arg_final[0] = "cat";
                }
                //Diff
                else if(arg_final[0] == "d")
                {
                    arg_final[0] = "diff";
                }
                //Help
                else if(arg_final[0] == "h")
                {
                    arg_final[0] = "man";
                }
                //List
                else if(arg_final[0] == "l")
                {
                    #ifdef LINUX
                        arg_final[0] = "ls";
                    #endif
                    #ifdef WINDOWS
                        arg_final[0] = "dir";
                    #endif
                }
                //Print
                else if(arg_final[0] == "p")
                {
                    arg_final[0] = "echo";
                }
                //Move
                else if(arg_final[0] == "m")
                {
                    arg_final[0] = "mv";
                }
                //Remove
                else if(arg_final[0] == "r")
                {
                    arg_final[0] = "rm";
                }
                //Touch
                else if(arg_final[0] == "t")
                {
                    arg_final[0] = "touch";
                }
                //Copy
                else if(arg_final[0] == "v")
                {
                    arg_final[0] = "cp";
                }

                //Execute command
            #ifdef LINUX
                if(count == 1)
                    execlp(arg_final[0].c_str(), arg_final[0].c_str(), NULL);
                else if(count == 2)
                    execlp(arg_final[0].c_str(), arg_final[0].c_str(), arg_final[1].c_str(), NULL);
                else if(count == 3)
                    execlp(arg_final[0].c_str(), arg_final[0].c_str(), arg_final[1].c_str(), arg_final[2].c_str(), NULL);
                else if(count == 4)
                    execlp(arg_final[0].c_str(), arg_final[0].c_str(), arg_final[1].c_str(), arg_final[2].c_str(), arg_final[3].c_str(), NULL);
                else if(count >= 5)
                    execlp(arg_final[0].c_str(), arg_final[0].c_str(), arg_final[1].c_str(), arg_final[2].c_str(), arg_final[3].c_str(), arg_final[4].c_str(), NULL);

                exit(0);
            }
            else
            {
                waitpid(child, &childStatus, 0);
            }
            #endif
            #ifdef WINDOWS
                std::string finalCommand = "";
                for(int i = 0; i < 5; i++)
                    finalCommand += arg_final[i];
                proc1->FileName = finalCommand;
                myprocess.StartInfo = proc1;
                myprocess.Start();
            #endif
    }
}

int main(int argc, char *argv[])
{
    ABCShell abcshell;
    abcshell.initialize();

    while(abcshell.waitForCommand() == true){}

    return 0;
}
