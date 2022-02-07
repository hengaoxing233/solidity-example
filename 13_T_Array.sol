// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExampleArray{

    uint[] iArray;
    uint[] iArray2 = [1,2,3];
    uint[3] iArray3;

    function getArray() public view returns(uint [] memory){
        return iArray2;
    }

    function getArrayByIndex(uint _i) public view returns(uint){
        return iArray2[_i];
    }

    function getLength() public view returns(uint){
        return iArray3.length;
    }

    function push(uint _i) public{
        iArray2.push(_i);
    }

    function pop() public{
        iArray2.pop();
    }

    function deleteByIndex(uint _index) public{
        delete iArray2[_index];
    }
}
