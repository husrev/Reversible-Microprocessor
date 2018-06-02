#include <iostream>
#include <bitset>
#include <list>
#include <cmath>
#include <fstream>
using namespace std;
int main()
{
	ofstream fout("encoder.v",ios_base::out);
	const unsigned int bitsize = 12;
	const unsigned int dense_bitsize = 8;
	const unsigned int distance = 3;
	list<unsigned int> codeWords;
	fout << "`timescale 1ns / 1ps " << endl;
	fout << "module encoder(" << endl;
	fout << "	input [7:0] data_in," << endl;
	fout << "	output reg [11:0] data_out" << endl;
	fout << ");" << endl << endl;
	fout << "always @*" << endl;
	fout << "case(data_in)" << endl;
	int number = 0;
	for(int i = 0; i <= pow(2,bitsize)-1; i++)
	{
		bool flag = 1;
		for(list<unsigned int>::iterator it = codeWords.begin(); it != codeWords.end(); it++)
		{
			bitset<bitsize> x( i ^ *it);
			if( x.count() < distance)
			{
				flag = 0;
				break;
			}
		}	 
		if(flag)
		{
			codeWords.push_back(i);
			bitset<bitsize> y(i);
			bitset<dense_bitsize> m(number++);
			cout << y << endl;
			fout << "	8'b" << m << ": " << " data_out <= 12'b" << y << ";" << endl;
		}			
	}
	fout << "endcase" << endl;
	fout << "endmodule" << endl;
	return log(codeWords.size())/log(2);
}
