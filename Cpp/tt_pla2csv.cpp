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
	const unsigned int dense_bitsize = 9;
	const unsigned int exp = (int) pow(2,dense_bitsize);
	vector<unsigned int> codeWords;
	ifstream fin("testbench/truthtable/hwb9_65.pla", ios_base::in);
	ofstream csvout("testbench/CSVtruthtables/hwb9_65.csv", ios_base::out);
	string a;
	int k = 0;
	struct truth_table_row tt[exp];
	while(!fin.eof())
	{
		fin >> a;
		if(k%2 == 0)
			tt[k/2].input = a;			
		else
			tt[k/2].output = a;	
		k++;
	}
	for(int i = 0; i < dense_bitsize; i++)
		csvout << "IN" << i << ',';
	csvout << ',';
	for(int i = 0; i < dense_bitsize; i++)
		if(i!= dense_bitsize-1)
			csvout << "OUT" << i << ',';	
		else
			csvout << "OUT" << i << endl;	
	for(int i = 0; i < ( (int) pow(2,dense_bitsize))  ; i++)
	{	
		bitset<dense_bitsize> g(i);
		for(int p = 0; p < dense_bitsize; p++)
			csvout << g[p] << ',';
		csvout << ',';
		bitset<dense_bitsize> h(tt[i].output);
		for(int p = 0; p < dense_bitsize; p++)
			if(p!= dense_bitsize-1)
				csvout << h[p] << ',';	
			else
				csvout << h[p] << endl;	
	}
	return 0;
}
