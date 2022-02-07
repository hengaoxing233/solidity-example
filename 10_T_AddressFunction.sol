// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExampleAddressFunction{

    function send(address payable _to) public payable{
        bool isSend = _to.send(msg.value);
        require(isSend,"send fail");
    }

    function transfer(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    //推荐这个转账,上面两个好像有gas限制,可能会转账失败
    function calls(address payable _to) public payable{
        (bool isSend,) = _to.call{value:msg.value}("");
        require(isSend,"send fail");
    }

}
