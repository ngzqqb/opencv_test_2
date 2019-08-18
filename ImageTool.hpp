#pragma once

#include <memory>
#include <vector>

#include <filesystem>
#include <opencv2/opencv.hpp>

namespace sstd {

    double evalAngle(const std::filesystem::path &);
    cv::Mat rotateExternImage(const cv::Mat &,double,int=64);
    cv::Mat rotateExternImage(const std::filesystem::path &, double, int = 64);
    bool saveImage(const cv::Mat & arg, const std::filesystem::path & argFileName);

}/*namespace sstd*/

