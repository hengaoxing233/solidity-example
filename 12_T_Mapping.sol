// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExampleMapping{
    //相当于map. key:value 格式存储数据
    mapping(address => uint) account;

    function get(address _address) public view returns(uint){
        return account[_address];
    }

    function set(address _address,uint _balance) public {
        account[_address] = _balance;
    }

    function remove(address _address) public {
        delete account[_address];
    }
}
