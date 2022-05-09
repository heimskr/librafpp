#include <iostream>
#include <unistd.h>

#include "raf.hpp"

int main(void) {
	std::cout << "true color:\n";
	Raf::raf(true);
	Raf::raf(stdout, true);
	Raf::raf(STDOUT_FILENO, true);
	std::cout << Raf::Raf(true);
	std::cout << std::string_view(Raf::Raf(true));
	std::cout << "\nansi:\n";
	Raf::raf(false);
	Raf::raf(stdout, false);
	Raf::raf(STDOUT_FILENO, false);
	std::cout << Raf::Raf(false);
	std::cout << std::string_view(Raf::Raf(false));
}
