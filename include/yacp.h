#include <iostream>
#include <string>
#include <unordered_map>
namespace yacp
{
struct yacp_struct
{
    std::unordered_map<std::string, std::pair<std::string, std::string>> SET;
    std::unordered_map<std::string, std::pair<std::string, std::string>> RESOURCE;

} yacp;
} // namespace yacp
