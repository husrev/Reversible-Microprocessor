#include <iostream>
#include <fstream>
using namespace std;
int main()
{
	ofstream fout("revkitScript.txt",ios_base::out);
	for(int i=0; i < 100; i++){
		fout << "revkit" << endl;
		fout << "read_pla /home/ecc_lab/Desktop/input/t" << i << ".pla" << endl;
		fout << "embed -b" << endl;
		fout << "tbs -b" << endl;
		fout << "spec -c" << endl;
		fout << "write_pla /home/ecc_lab/Desktop/output/t" << i << ".pla" << endl;
		fout << "quit" << endl;
	}
	fout.close();
	return 0;
}
