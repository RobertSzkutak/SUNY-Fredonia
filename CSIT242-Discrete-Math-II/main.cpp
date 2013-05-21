// Robert Szkutak
// Calculate partitions of bipartite graphs which exist within the complete graph of size N

#include <iostream>
#include <map>
#include <vector>
#include <algorithm>
#include <string>
#include <sstream>

void sort(int *arr, int size)
{
	int flag=1, temp=0;
	
	for(int i = 0; i < size && flag; i++)
	{
		flag = 0;
		for(int j = 0; j < size-1; j++)
		{
			if(arr[j+1] > arr[j])
			{
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
				flag = 1;
			}
		}
	}
}

std::string par_hash(int *partition1, int size1)
{
	std::string hash;
	sort(partition1, size1);
	std::ostringstream convert;
	for(int i = 0; i < size1; i++)
		convert << partition1[i];
	hash = convert.str();
//	std::cout << hash << std::endl;
	return hash;
}

void print_partitions(int *partition1, int size1, int *partition2, int size2)
{
	std::cout << "Partitions: ";
	for(int i = 0; i < size1; i++)
	{
		std::cout << partition1[i];
		if(i != size1-1)
			std::cout << ", ";
		else
			std::cout << " | ";
	}
	for(int i = 0; i < size2; i++)
	{
		std::cout << partition2[i];
		if(i != size2-1)
			std::cout << ", ";
		else
			std::cout << std::endl;
	}
}

int partitions(int n, int size1)
{
	std::vector<int>permute;
	int size2 = n-size1;
	int partition1[size1], partition2[size2];
	std::map<std::string, bool>map;

	int ret = 0;	

	for(int i = 0; i < n; i++)
		permute.push_back(i);

	do
	{
		for(int i = 0; i < size1; i++)
			partition1[i] = permute[i];
		for(int i = 0; i < size2; i++)
			partition2[i] = permute[size1+i];
		std::string hash = par_hash(partition1, size1);
		std::string hash2 = par_hash(partition2, size2);	
		if(map[hash] != true && map[hash2] != true)
		{
			ret++;
			map[hash] = true;
			map[hash2] = true;
			print_partitions(partition1, size1, partition2, size2);
		}
	}while(std::next_permutation(permute.begin(), permute.end()) == true);

	return ret;
}

int all_partitions(int n)
{
	int ret = 0;
	int hack = 0;
	if(n % 2 == 0)
		hack = 1;
	for(int i = 0; i <= (n/2) - (n%2) - hack; i++)
		ret += partitions(n, i+1);
	return ret;
}

int main()
{

	int in = 0;
	std::cout << "Compute the number of bipartite graphs which exist  within the complete graph of: ";
	std::cin >> in;
	if(in > 1)
		std::cout << std::endl << std::endl << all_partitions(in) << std::endl;
	else
		std::cout << "Invalid input!" << std::endl;
	return 0;
}
