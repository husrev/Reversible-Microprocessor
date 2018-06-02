#include <iostream>
#include <bitset>
#include <vector>
#include <cmath>
#include <fstream>
#include <string>
using namespace std;
struct truth_table_row{
	string input;
	string output;
};
int main()
{
	const unsigned int bitsize = 4;
	const unsigned int exp = (int) pow(2,bitsize);
	vector<unsigned int> codeWords;
	ifstream fin("testbench/truthtable/full_adder_SEC.pla", ios_base::in);
	ofstream fout("testbench/truthtable/full_adder_SEC_decimal.pla", ios_base::out);
	string a;
	int k = 0;
	struct truth_table_row tt[exp];
	while(!fin.eof())
	{
		fin >> a;
		if(k%2 == 0)	tt[k/2].input = a;			
		else	tt[k/2].output = a;	
		k++;
	}
	int b = 0;
	for(int i = 0; i <= pow(2,7)-1; i++)
	{
		bitset<7> x(tt[b].output);
		bitset<7> y(i);
		if(x==y){
			fout << x.to_ulong() << endl;
			b++;
		}			
		else
			fout << "-1" << endl;
	}
	return 0;
}
