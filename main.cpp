
#include "ImageTool.hpp"
#include <filesystem>

namespace the {


    class ProcessAImage {
        std::filesystem::path thisImageName;
    public:

        inline void process() const {
            
        }

        inline ProcessAImage(const std::filesystem::path & arg) : 
            thisImageName{ arg } {
        }

    };


}/*namespace the*/



int main(int argc,char ** argv){


}












