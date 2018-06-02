#include <iostream>
#include <bitset>
#include <list>
#include <cmath>
//#include <fstream>
using namespace std;
int main()
{
//	ofstream fout("code.txt",ios_base::out);
	const unsigned int bitsize = 12;
	const unsigned int distance = 3;
	list<unsigned int> codeWords;
	for(int i = 0; i <= pow(2,bitsize)-1; i++){
		bool flag = 1;
		for(list<unsigned int>::iterator it = codeWords.begin(); it != codeWords.end(); it++){
			bitset<bitsize> x( i ^ *it);
			if( x.count() < distance){
				flag = 0;
				break;
			}
		}	 
		if(flag){
			codeWords.push_back(i);
			bitset<bitsize> y(i);
			cout << y << endl;
		}			
	}
	cout << endl << codeWords.size() << endl << endl;
	int i = 0, j = 0;
	for(list<unsigned int>::iterator it = codeWords.begin(); it != codeWords.end(); it++)
		if((int) pow(2,j) == i++){
			j++;
			bitset<bitsize> y(*it);
			cout << y << " "<< endl;			
		}		
	return log(codeWords.size())/log(2);
}
