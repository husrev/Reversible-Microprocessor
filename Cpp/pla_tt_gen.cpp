#include <iostream>
#include <fstream>
#include <bitset>
#include <cmath>
#include <cstdlib>
#include <string>
#include <sstream> 
using namespace std;

int main()
{
	{
		const int inputs = 3;	
		const int outputs = 3;
		int numberoffiles = 10;
		for(int j = 0; j < numberoffiles; j++){
			ostringstream ostr; //output string stream
	    	ostr << j; //use the string stream just like cout
			string a = "irreversible_benchmarq/t" + ostr.str() + ".pla";
			ofstream fout(a.c_str(), ios_base::out);
			fout << ".i " << inputs << endl << ".o " << outputs << endl;
			for(int i = 0; i < pow(2,inputs); i++){
				int randomnumber = (rand() % (int)(pow(2,inputs)));
				bitset <inputs> m(i);
				bitset <outputs> n(randomnumber);
				fout << m << " " << n << endl;
			}
			fout << ".e";
			fout.close();
		}
	}
