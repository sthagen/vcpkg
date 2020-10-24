include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ArashPartow/exprtk
    REF d312ba91419c9cb12c8279fd3a19096d39dfcb5e # accessed on 2020-09-14
    SHA512 c8145e2fdd6ecbed2a1a82d0e7e5e1e5545f42d2bb02700fb52f31012e959d4e070e0e04e5e13d1879d62f7a9c61c692462ce3cca44144670f97db84f572be09
)

file(COPY ${SOURCE_PATH}/exprtk.hpp DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(COPY ${CMAKE_CURRENT_LIST_DIR}/copyright DESTINATION ${CURRENT_PACKAGES_DIR}/share/exprtk)
