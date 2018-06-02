#include <iostream>
#include <string>
#include <fstream>
using namespace std;
int main()
{
	ofstream fout("misiiScript.txt",ios_base::out);
	for(int i=0; i < 100; i++){
		fout << "read_library lib\\" << "minimal.genlib" << endl;
		fout << "read_pla C:\\Users\\Husrev\\Dropbox\\Husrev-Can\\Files\\irreversible_benchmarq_mapped\\t" << i << ".pla" << endl;
		fout << "map" << endl;
		fout << "espresso" << endl;
		fout << "map" << endl;
		fout << "simplify" << endl;
		fout << "map" << endl;
		fout << "pgc" << endl;
	}
	fout.close();
	return 0;
}
