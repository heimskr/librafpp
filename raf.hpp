#include <cstdio>
#include <ostream>

namespace Raf {
	struct Raf {
		bool trueColor;
		Raf(bool true_color = true): trueColor(true_color) {}
	};

	void raf(bool true_color = true);
	void raf(FILE *, bool true_color = true);
	bool raf(int fd, bool true_color = true);

	std::ostream & operator<<(std::ostream &, Raf);
}
