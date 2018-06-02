#include <iostream>
#include <bitset>
#include <list>
#include <cmath>
#include <fstream>
using namespace std;

int main()
{
	ofstream fout("decoder.v",ios_base::out);
	const unsigned int bitsize = 12;
	const unsigned int dense_bitsize = 8;
	const unsigned int distance = 3;
	list<unsigned int> codeWords;
	fout << "`timescale 1ns / 1ps " << endl;
	fout << "module decoder(" << endl;
	fout << "	input [11:0] data_in," << endl;
	fout << "	output reg defect," << endl;	
	fout << "	output reg [7:0] data_out" << endl;
	fout << ");" << endl << endl;
	fout << "always @*" << endl;
	fout << "case(data_in)" << endl;
	for(int i = 0; i <= pow(2,bitsize)-1; i++){
		bool flag = 1;
		for(list<unsigned int>::iterator it = codeWords.begin(); it != codeWords.end(); it++){
			bitset<bitsize> x( i ^ *it);
			if( x.count() < distance){
				flag = 0;
				break;
			}
		}	 
		if(flag)
		{
			codeWords.push_back(i);
			bitset<bitsize> y(i);
			cout << y << endl;
		}			
	}
	for(int j = 0; j <= pow(2,bitsize)-1; j++){
		bitset<bitsize> m(j);
		int i = 0;
		for(list<unsigned int>::iterator it = codeWords.begin(); it != codeWords.end(); it++){
			bitset<bitsize> x( j ^ *it);
			bitset<dense_bitsize> n(i);
			if( x.count() < distance){
				fout << "	12'b" << m << ": " << endl << "		begin" << endl
					 << "		data_out <= 8'b" << n << ";" << endl
					 << "		defect <= " << (x.count() != 0) << ";" << endl << "		end "<< endl;
				break;
			}
			i++;
		}	
	}
	fout << "endcase" << endl;
	fout << "endmodule" << endl;
	return log(codeWords.size())/log(2);
}
