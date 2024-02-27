using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Lab1
{
    internal interface ICalculator
    {
        bool SetVarA(string varA);
        bool SetVarB(string varB);
        void SetOperation(string operation);
        string ShowLastMemory();
        string ShowNextMemory();
        void Clean();
        string Equal(string varB);
    }
}