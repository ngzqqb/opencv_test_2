
#include "ImageTool.hpp"
#include <filesystem>
#include <regex>
#include <string_view>
using namespace std::string_view_literals;

namespace the {

    class ProcessAImage {
        std::filesystem::path thisImageName;
    public:

        inline bool process() const try {
            auto varAngle = sstd::evalAngle(thisImageName);
            if (varAngle > 90) {
                varAngle -= 180;
            }
            auto varImage = sstd::rotateExternImage(thisImageName, varAngle);
            return sstd::saveImage(varImage, thisImageName);
        } catch (const std::exception & e) {
            std::cout << e.what() << std::endl;
            return false;
        }

        inline ProcessAImage(const std::filesystem::path & arg) :
            thisImageName{ arg } {
        }

    };

    class DutyGen {
        bool thisIsFile{ false };
        std::filesystem::path thisImageNameOrRootPath;
        std::list< std::shared_ptr< ProcessAImage > > thisDutys;
        inline static bool checkIsImageFile(const std::filesystem::path & arg) {
            const auto varImageName = arg.filename().string();
            const static std::regex varRegex{ u8R"(.*[.]((jpg)|(jpeg)|(png)|(bmp)))",
            std::regex_constants::icase |
                std::regex_constants::ECMAScript };
            return std::regex_match( varImageName,varRegex );
        }
        inline void pushAImage(const std::filesystem::path & arg) {
            if (checkIsImageFile(arg)) {
                thisDutys.push_back( std::make_shared<ProcessAImage>(arg) );
            }
        }
    public:
        template<typename T>
        inline DutyGen(T && arg) :
            thisImageNameOrRootPath{ std::forward<T>(arg) } {
            if (std::filesystem::is_directory(thisImageNameOrRootPath)) {
                thisIsFile = false;
                {
                    std::filesystem::recursive_directory_iterator varPos{ 
                        thisImageNameOrRootPath };
                    const std::filesystem::recursive_directory_iterator varEnd;
                    for (;varPos!=varEnd;++varPos) {
                        if (varPos->is_directory()) {
                            continue;
                        }
                        if (varPos->is_regular_file()) {
                            pushAImage(*varPos);
                        }
                    }
                }
            } else {
                thisIsFile = true;
                pushAImage(thisImageNameOrRootPath);
            }
            std::cout << "共找到： "<< thisDutys.size() <<" 文件" <<std::endl ;
        }

        inline void apply() {
            while (!thisDutys.empty()) {
                auto varDuty = thisDutys.front();
                thisDutys.pop_front();
                varDuty->process();
                std::cout << "还有： " << thisDutys.size() << " 文件" << std::endl;
            }
        }

    };


}/*namespace the*/



int main(int argc, char ** argv) try {

    if ( argc == 1 ) {

        std::filesystem::path varPath{ argv[0] };
        the::DutyGen varGen{ varPath.parent_path() };
        varGen.apply();
        system("pause");
        return 0;

    } 

    the::DutyGen varGen{ argv[1] };
    varGen.apply();
    return 0;

} catch ( const std::exception & e) {
    std::cout << e.what() << std::endl;
    return -1;
}












