// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./14_T_Import_1.sol";

contract ExampleImport2{
    ExampleImport exampleimport = new ExampleImport();

    function getAge() public view returns(uint){
        return exampleimport.age();
    }

    function getName() public view returns(string memory){
        return exampleimport.getName();
    }
}
